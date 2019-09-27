package com.hanul.iot;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
import gallery.Gallery_CommentVO;
import main.MainVO;

@Controller
@SessionAttributes("category")
public class GalleryController {

	@Autowired // 서비스
	private GalleryServiceImpl service;

	@Autowired // 파일업로드
	private CommonService common;

	@Autowired // 페이징
	private GalleryPage page;

	// 갤러리 목록
	@RequestMapping("/list.gal")
	public String list(@RequestParam(defaultValue = "1") int curPage, Model model, String search, String keyword) {
		model.addAttribute("category", "gal"); // 카테고리
		// 검색한 결과에 해당하는 갤러리목록을 조회하는 경우
//		if( keyword != null ) {
//			//key,value 형태의 자료구조 : HashMap
//			HashMap<String, String> map = new HashMap<String, String>();
//			map.put("search", search);
//			map.put("keyword", keyword);
//			model.addAttribute("list", service.list(map));
//			model.addAttribute("search",search);
//			model.addAttribute("keyword",keyword);
//		}else {
//			//검색없이 공지글목록을 조회하는 경우
//			model.addAttribute("list", service.list());
//		}
		page.setCurPage(curPage);
		page.setSearch(search); // 검색
		page.setKeyword(keyword); // 키워드
		model.addAttribute("page", service.list(page));
		return "gallery/list";
	}// list()

	// 갤러리 상세화면
	@RequestMapping("/detail.gal")
	public String detail(Model model, int id, @RequestParam(defaultValue = "0") int read, HttpSession session) {
		String resources = session.getServletContext().getRealPath("resources");
		if (read == 1) {
			// 조회수 증가 처리
			service.read(id);
		}
		model.addAttribute("vo", service.detail(id));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		model.addAttribute("page", page);
		model.addAttribute("resources", resources);
		return "gallery/detail";
	}// detail()

	// 신규 갤러리 작성화면
	@RequestMapping("/new.gal")
	public String gallery() {
		return "gallery/new";
	}// gallery()

	// 신규 갤러리 저장처리 요청
	@RequestMapping("/insert.gal")
	public String insert(GalleryVO vo, MultipartFile file, HttpSession session) { // 파일 업로드 MultipartFile
		// 작성자는 로그인한 사용자의 userid, writer를 담는다.
		// 회원정보를 저장한 주소를 가지고있음
		vo.setUserid(((MainVO) session.getAttribute("info_login")).getUserid());
		vo.setWriter(((MainVO) session.getAttribute("info_login")).getWriter());
//		System.out.println(vo.getUserid()); //확인용 
//		System.out.println(vo.getWriter()); //확인용 
		// 화면에서 입력한 정보를 DB에 저장한 후
		// 목록화면으로 연결
		// 첨부파일이 있는 경우 파일정보를 데이터객체에 담는다.
		if (file.getSize() > 0) { // 첨부한 파일이 있는 경우
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.upload("gallery", file, session));
		}
		service.insert(vo);
//		System.out.println(vo.getTitle()); //확인용 
//		System.out.println(vo.getContent()); //확인용 
//		System.out.println(vo.getFilename()); //확인용 
//		System.out.println(vo.getFilepath()); //확인용 
		return "redirect:list.gal";
	}// insert()

	// 갤러리 삭제 처리 요청
	@RequestMapping("/delete.gal")
	public String delete(int id, HttpSession session) {
		// 첨부된 파일이 있다면 물리적 공간에서 해당 파일을 삭제
		File f = new File(session.getServletContext().getRealPath("resources" + service.detail(id).getFilepath()));
		if (f.exists())
			f.delete(); // 파일을 삭제하는 처리
		// 해당 방명록을 DB에서 삭제한 후
		// 목록화면으로 연결
		service.delete(id);
		return "redirect:list.gal";
	}// delete()

	// 방명록 수정화면 요청
	@RequestMapping("/modify.gal")
	public String modify(int id, Model model) {
		// DB에서 해당 갤러리 정보를 조회해온 후
		// 수정화면에 출력하도록 Model에 담는다.
		model.addAttribute("vo", service.detail(id));
		return "gallery/modify";
	}// modify()

	// 방명록 수정 처리 요청
	@RequestMapping("/update.gal")
	public String update(GalleryVO vo, MultipartFile file, HttpSession session, String attach) { 
		// 파일도 첨부해야하므로 MultipartFile, 물리적인 위치 HttpSession, 네이밍데이터 attach
		// 화면에서 변경 입력한 정보를 DB에 저장한 후 
		// 상세화면으로 연결

		// 1. 원래 첨부된 파일이 없는데 변경하면서 첨부하는 경우
		// 원래 DB에 저장되어 있던 첨부파일정보를 조회해 온다.
		GalleryVO gallery = service.detail(vo.getId());
		String uuid = gallery.getFilepath();
		// /upload/gallery/2019/07/03/ads-er232-00faf_abc.txt
		// 세션으로부터 위치데이터를 가져와야함
		uuid = session.getServletContext().getRealPath("resources") + uuid;
		// d:/Study_Spring/...../upload/gallery/2019/07/03/ads-er232-00faf_abc.txt

		if (file.getSize() > 0) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.upload("gallery", file, session));
			// 2. 원래 첨부된 파일이 있었고 그 파일을 다른 파일로 변경해 첨부하는 경우
			// 원래 첨부된 파일은 삭제한다.
			File f = new File(uuid);
			if (f.exists())
				f.delete();
		} else {
			// 3. 원래 첨부된 파일이 있었는데 첨부된 파일을 삭제하는 경우
			if (attach.equals("y")) {
				File f = new File(uuid);
				if (f.exists())
					f.delete();
			} else {
				// 4. 원래 첨부된 파일이 있고 그대로 사용하는 경우
				vo.setFilename(gallery.getFilename());
				vo.setFilepath(gallery.getFilepath());
			}
		}
		service.update(vo);
		return "redirect:detail.gal?id=" + vo.getId();
	}// update()

	// 갤러리 댓글 저장 처리 요청
	@ResponseBody
	@RequestMapping("/gallery/comment/insert")
	public boolean comment_insert(int pid, String content, HttpSession session) {
		HashMap<String, Object> map //숫자도 문자도 다 담을수 있는 Object타입
				= new HashMap<String, Object>();
		map.put("pid", pid);
		map.put("content", content);
		map.put("userid", ((MainVO) session.getAttribute("info_login")).getUserid());
		return service.comment_insert(map); //저장하는 서비스를 호출(저장 o = true/ 저장x = false)
	}

	// 갤러리 글에 대한 댓글 조회 요청
	@RequestMapping("/gallery/comment/{pid}")
	public String comment_list(@PathVariable int pid, Model model) { //숫자 id인 pid 호출
		model.addAttribute("list", service.comment_list(pid));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		return "gallery/comment/list";
	}// comment_list()

	// 댓글변경처리 요청
	@ResponseBody
	@RequestMapping(value = "/gallery/comment/update", // 이자체가 응답 @ResponseBody
			produces = "application/text; charset=utf-8") //산출문 한글깨지지 않게 설정
	public String comment_update(@RequestBody Gallery_CommentVO vo) { // json 형태의 데이터를 받아올때는 @RequestBody
		return service.comment_update(vo) ? "성공" : "실패";
	}// comment_update()

	// 댓글삭제처리 요청
	@ResponseBody
	@RequestMapping("/gallery/comment/delete/{id}")
	public void comment_delete(@PathVariable int id) { //잘 삭제되었는지 반환하고 싶지 않을때는 리턴값 안주고 void
		service.comment_delete(id);
	}

	// 안드로이드 -------------------------------------------------------------------------------------------
	@ResponseBody
	@RequestMapping(value = "/json.gal", produces = "application/json; charset=utf-8")
	public String JSONDate(Model model) {
		List<GalleryVO> data = new ArrayList<GalleryVO>();
		data = service.andlist();
		// System.out.println(data);
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
	public String andinsert(GalleryVO vo, @RequestParam("p_name") String p_name, MultipartFile file,
			HttpSession session) { // ÷������ ÷�� MultipartFile
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
