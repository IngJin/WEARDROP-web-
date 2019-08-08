package com.hanul.iot;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.google.gson.Gson;

import common.CommonService;
import gallery.GalleryServiceImpl;
import gallery.GalleryVO;

@Controller
@SessionAttributes("category")
public class GalleryController {

	@Autowired
	private GalleryServiceImpl service;
	@Autowired
	private CommonService common;

	// 갤러리 화면요청
	@RequestMapping("/list.gal")
	public String list(Model model, String search, String keyword) {
		// DB에서 갤러리 목록을 조회해와
		// 목록화면에 출력할 수 있도록 Model에 담는다.
		model.addAttribute("category", "gal"); // 카테고리
		//검색한 결과에 해당하는 공지글목록을 조회하는 경우
		if( keyword != null ) {
			//key,value 형태의 자료구조 : HashMap
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("search", search);
			map.put("keyword", keyword);
			model.addAttribute("list", service.list(map));
			model.addAttribute("search",search);
			model.addAttribute("keyword",keyword);
		}else {
			//검색없이 공지글목록을 조회하는 경우
			model.addAttribute("list", service.list());
		}
		return "gallery/list2";
	}//list()
	
	// 상세 화면요청
	@RequestMapping("/detail.gal")
	public String detail(Model model, int id, @RequestParam(defaultValue = "0") int read, HttpSession session) {
		String resources = session.getServletContext().getRealPath("resources");
		if (read == 1) {
			// 조회수 증가 처리
			service.read(id);
		}
		model.addAttribute("vo", service.detail(id));
		model.addAttribute("resources", resources);
		return "gallery/detail";
	}//detail()

	// 신규 갤러리 작성 화면요청
	@RequestMapping("/new.gal")
	public String gallery() {
		return "gallery/new";
	}// gallery()

	// 신규 갤러리 저장처리 요청
	@RequestMapping("/insert.gal")
	public String insert(GalleryVO vo, MultipartFile file, HttpSession session) { // 첨부파일 첨부 MultipartFile
		// 화면에서 입력한 정보를 DB에 저장한 후
		// 목록화면으로 연결
		// 첨부파일이 있는 경우 파일정보를 데이터객체에 담는다.
		if (file.getSize() > 0) {// 첨부한 파일이 있는 경우
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.upload("gallery", file, session));
		}
		service.insert(vo);
		return "redirect:list.gal";
	}// insert()
	
	
	//갤러리 삭제 처리 요청
	@RequestMapping("/delete.gal")
	public String delete(int id, HttpSession session) {
		//첨부된 파일이 있다면 물리적 공간에서 해당 파일을 삭제
	File f = new File(
			session.getServletContext().getRealPath(
			"resources" + service.detail(id).getFilepath()));
			if(f.exists()) f.delete(); //파일을 삭제하는 처리
			//해당 공지글을 DB에서 삭제한 후
			//목록화면으로 연결
			service.delete(id);
			return "redirect:list.gal";
	}//delete()
	
	//갤러리 수정화면 요청
		@RequestMapping("/modify.gal")
		public String modify(int id, Model model) {
			//DB에서 해당 공지글 정보를 조회해온 후
			//수정화면에 출력하도록 Model에 담는다.
			model.addAttribute("vo", service.detail(id));
			return "gallery/modify";
		}//modify()
		
		//공지글 수정 처리 요청
		@RequestMapping("/update.gal")
		public String update(GalleryVO vo, MultipartFile file, 
								HttpSession session, String attach) { // 파일도 첨부해야하므로 MultipartFile, 물리적인 위치 HttpSession, 네이밍데이터 attach
			// 화면에서 변경 입력한 정보를 DB에 저장한 후 
			// 상세화면으로 연결
			
			// 1. 원래 첨부된 파일이 없는데 변경하면서 첨부하는 경우
			// 원래 DB에 저장되어 있던 첨부파일정보를 조회해 온다.
			GalleryVO gallery = service.detail(vo.getId());
			String uuid = gallery.getFilepath();
			// /upload/notice/2019/07/03/ads-er232-00faf_abc.txt
			// 세션으로부터 위치데이터를 가져와야함
			uuid = session.getServletContext().getRealPath("resources") +uuid;
			// d:/Study_Spring/...../upload/gallery/2019/07/03/ads-er232-00faf_abc.txt
			
			if(file.getSize()>0) {
				vo.setFilename(file.getOriginalFilename());
				vo.setFilepath(common.upload("gallery", file, session));
				// 2. 원래 첨부된 파일이 있었고 그 파일을 다른 파일로 변경해 첨부하는 경우
				// 원래 첨부된 파일은 삭제한다.
				File f = new File(uuid);
				if(f.exists()) f.delete();
			}else {
				// 3. 원래 첨부된 파일이 있었는데 첨부된 파일을 삭제하는 경우
				if(attach.equals("y")) {
					File f = new File(uuid);
					if(f.exists()) f.delete();
				}else {
					// 4. 원래 첨부된 파일이 있고 그대로 사용하는 경우
					vo.setFilename(gallery.getFilename());
					vo.setFilepath(gallery.getFilepath());
				}
			}
			service.update(vo);
			return "redirect:detail.gal?id=" + vo.getId();
		}//update()	
	
	//안드로이드 처리
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
//		System.out.println("제목1 : " + map.get("title"));
//		String content = (String) map.get("content");
//		String writer = (String) map.get("writer");
//		String filename = file.getOriginalFilename();
//		String filepath = common.upload("gallery", file, session);
//		
//		GalleryVO vo = new GalleryVO(title, content, writer, filename, filepath);
//		System.out.println("제목 : " + title);
//		System.out.println("내용 : " + content);
//		System.out.println("작성자 : " + writer);
//		System.out.println("파일명 : " + file.getOriginalFilename());
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
	public String andinsert(GalleryVO vo, @RequestParam("p_name") String p_name, MultipartFile file, HttpSession session) { // 첨부파일 첨부 MultipartFile
		// 화면에서 입력한 정보를 DB에 저장한 후
		// 목록화면으로 연결
		// 첨부파일이 있는 경우 파일정보를 데이터객체에 담는다.
		System.out.println("p_name=====================" + p_name);
		
		if (file.getSize() > 0) {// 첨부한 파일이 있는 경우
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.upload("gallery", file, session));
		}
		service.insert(vo);
		return "redirect:list.gal";
	}// insert()
	

	

	}
