package com.hanul.iot;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.CommonService;
import gallery.GalleryPage;
import gallery.GalleryServiceImpl;
import gallery.GalleryVO;

@Controller
@SessionAttributes("category")
public class GalleryController {

	@Autowired
	private GalleryServiceImpl service;
	@Autowired
	private CommonService common;
	@Autowired
	private GalleryPage page;
	
	// �ű� ������ �ۼ� ȭ���û
	@RequestMapping("/test.gal")
	public String gallery_test() {
			return "gallery/list4";
	}// gallery()
		
	// ������ ȭ���û
	@RequestMapping("/list.gal")
	public String list(@RequestParam(defaultValue="1") int curPage,
			Model model, String search, String keyword) {
		// DB���� ������ ����� ��ȸ�ؿ�
		// ���ȭ�鿡 ����� �� �ֵ��� Model�� ��´�.
		model.addAttribute("category", "gal"); // ī�װ�
		//�˻��� ����� �ش��ϴ� �����۸���� ��ȸ�ϴ� ���
		//0816
//		if( keyword != null ) {
//			//key,value ������ �ڷᱸ�� : HashMap
//			HashMap<String, String> map = new HashMap<String, String>();
//			map.put("search", search);
//			map.put("keyword", keyword);
//			model.addAttribute("list", service.list(map));
//			model.addAttribute("search",search);
//			model.addAttribute("keyword",keyword);
//		}else {
//			//�˻����� �����۸���� ��ȸ�ϴ� ���
//			model.addAttribute("list", service.list());
//		}
		page.setCurPage(curPage);
		page.setSearch(search); //190708 �˻�
		page.setKeyword(keyword); //190708 Ű����
		model.addAttribute("page", service.list(page));
		return "gallery/list3";
	}//list()
	
	// �� ȭ���û
	@RequestMapping("/detail.gal")
	public String detail(Model model, int id, @RequestParam(defaultValue = "0") int read, HttpSession session) {
		String resources = session.getServletContext().getRealPath("resources");
		if (read == 1) {
			// ��ȸ�� ���� ó��
			service.read(id);
		}
		model.addAttribute("vo", service.detail(id));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		model.addAttribute("page", page);
		model.addAttribute("resources", resources);
		return "gallery/detail";
	}//detail()

	// �ű� ������ �ۼ� ȭ���û
	@RequestMapping("/new.gal")
	public String gallery() {
		return "gallery/new";
	}// gallery()

	// �ű� ������ ����ó�� ��û
	@RequestMapping("/insert.gal")
	public String insert(GalleryVO vo, MultipartFile file, HttpSession session) { // ÷������ ÷�� MultipartFile
		// ȭ�鿡�� �Է��� ������ DB�� ������ ��
		// ���ȭ������ ����
		// ÷�������� �ִ� ��� ���������� �����Ͱ�ü�� ��´�.
		if (file.getSize() > 0) {// ÷���� ������ �ִ� ���
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.upload("gallery", file, session));
		}
		service.insert(vo);
		return "redirect:list.gal";
	}// insert()
	
	
	//������ ���� ó�� ��û
	@RequestMapping("/delete.gal")
	public String delete(int id, HttpSession session) {
		//÷�ε� ������ �ִٸ� ������ �������� �ش� ������ ����
	File f = new File(
			session.getServletContext().getRealPath(
			"resources" + service.detail(id).getFilepath()));
			if(f.exists()) f.delete(); //������ �����ϴ� ó��
			//�ش� �������� DB���� ������ ��
			//���ȭ������ ����
			service.delete(id);
			return "redirect:list.gal";
	}//delete()
	
	//������ ����ȭ�� ��û
		@RequestMapping("/modify.gal")
		public String modify(int id, Model model) {
			//DB���� �ش� ������ ������ ��ȸ�ؿ� ��
			//����ȭ�鿡 ����ϵ��� Model�� ��´�.
			model.addAttribute("vo", service.detail(id));
			return "gallery/modify";
		}//modify()
		
		//������ ���� ó�� ��û
		@RequestMapping("/update.gal")
		public String update(GalleryVO vo, MultipartFile file, 
								HttpSession session, String attach) { // ���ϵ� ÷���ؾ��ϹǷ� MultipartFile, �������� ��ġ HttpSession, ���ֵ̹����� attach
			// ȭ�鿡�� ���� �Է��� ������ DB�� ������ �� 
			// ��ȭ������ ����
			
			// 1. ���� ÷�ε� ������ ���µ� �����ϸ鼭 ÷���ϴ� ���
			// ���� DB�� ����Ǿ� �ִ� ÷������������ ��ȸ�� �´�.
			GalleryVO gallery = service.detail(vo.getId());
			String uuid = gallery.getFilepath();
			// /upload/notice/2019/07/03/ads-er232-00faf_abc.txt
			// �������κ��� ��ġ�����͸� �����;���
			uuid = session.getServletContext().getRealPath("resources") +uuid;
			// d:/Study_Spring/...../upload/gallery/2019/07/03/ads-er232-00faf_abc.txt
			
			if(file.getSize()>0) {
				vo.setFilename(file.getOriginalFilename());
				vo.setFilepath(common.upload("gallery", file, session));
				// 2. ���� ÷�ε� ������ �־��� �� ������ �ٸ� ���Ϸ� ������ ÷���ϴ� ���
				// ���� ÷�ε� ������ �����Ѵ�.
				File f = new File(uuid);
				if(f.exists()) f.delete();
			}else {
				// 3. ���� ÷�ε� ������ �־��µ� ÷�ε� ������ �����ϴ� ���
				if(attach.equals("y")) {
					File f = new File(uuid);
					if(f.exists()) f.delete();
				}else {
					// 4. ���� ÷�ε� ������ �ְ� �״�� ����ϴ� ���
					vo.setFilename(gallery.getFilename());
					vo.setFilepath(gallery.getFilepath());
				}
			}
			service.update(vo);
			return "redirect:detail.gal?id=" + vo.getId();
		}//update()	
	
	//�ȵ���̵� ó��
	@ResponseBody @RequestMapping(value="/json.gal", 
			produces="application/json; charset=utf-8")
	public String JSONDate(Model model) {
		List<GalleryVO> data = new ArrayList<GalleryVO>();
		data = service.andlist();
		//System.out.println(data);
		service.galUpdate();
		String json = new Gson().toJson(model.addAttribute("andlist", data));
		return json;
	}
	
//	@ResponseBody @RequestMapping(value="/andinsert.gal", 
//			produces = "application/json;charset=UTF-8", method = {RequestMethod.GET,RequestMethod.POST})
//	public JSONObject andInsert(@RequestParam ("filename") MultipartFile file,
//								@RequestParam HashMap<String, String> map,
//								HttpServletRequest request,
//								HttpSession session) {
//
//		MultipartHttpServletRequest multipartHttpServletRequest = null;
//		try {
//			multipartHttpServletRequest = (MultipartHttpServletRequest) request;
//			String p_name = multipartHttpServletRequest.getParameter("p_name");
//			p_name = new String(p_name.getBytes("8859_1"),"utf-8");
//			String p_p_name = request.getParameter("p_name");
//			System.out.println("p_name=======" + p_name);
//			System.out.println("p_name=======" + p_p_name);
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		JSONObject result = new JSONObject();
//		String title = (String) map.get("title");
//		System.out.println("����1 : " + map.get("title"));
//		String content = (String) map.get("content");
//		String writer = (String) map.get("writer");
//		String filename = file.getOriginalFilename();
//		String filepath = common.upload("gallery", file, session);
//		
//		GalleryVO vo = new GalleryVO(title, content, writer, filename, filepath);
//		System.out.println("���� : " + title);
//		System.out.println("���� : " + content);
//		System.out.println("�ۼ��� : " + writer);
//		System.out.println("���ϸ� : " + file.getOriginalFilename());
//		System.out.println(file.getSize());
//		vo.setFilename(file.getOriginalFilename());
//		
//		result.put("message", service.andInsert(vo));
//		
//		List<GalleryVO> data = new ArrayList<GalleryVO>();
//		data = service.andlist();
//		service.galUpdate();
//		
//		System.out.println(result);
//		return result;
//	}
	
	@RequestMapping("/andinsert.gal")
	public String andinsert(GalleryVO vo, @RequestParam("p_name") String p_name, MultipartFile file, HttpSession session) { // ÷������ ÷�� MultipartFile
		// ȭ�鿡�� �Է��� ������ DB�� ������ ��
		// ���ȭ������ ����
		// ÷�������� �ִ� ��� ���������� �����Ͱ�ü�� ��´�.
		System.out.println("p_name=====================" + p_name);
		
		if (file.getSize() > 0) {// ÷���� ������ �ִ� ���
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.upload("gallery", file, session));
		}
		service.insert(vo);
		return "redirect:list.gal";
	}// insert()
	

	

	}
