package com.hanul.iot;

import java.io.File;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import main.MainVO;
import notice.NoticePage;
import notice.NoticeServiceImpl;
import notice.NoticeVO;
import notice.NoticeService;

@Controller @SessionAttributes("category")
public class NoticeController {
	//@Autowired private NoticeServiceImpl service;
	@Resource(name="service")private NoticeService service;
	
	@Autowired NoticePage page;
	
	//공지글목록화면 요청
	@RequestMapping("/list.no")
	public String list( @RequestParam(defaultValue="1") int curPage, Model model, String search, String keyword) {
		//DB에서 공지글목록을 조회해와
		//목록화면에 출력할 수 있도록 Model에 담는다.
		//검색한 결과에 해당하는 공지글목록을 조회하는 경우
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		model.addAttribute("page", service.list(page));
		model.addAttribute("category", "no");
		
		/*NoticePage page = service.list(vo);*/
		
		/*if(keyword != null) {
			//Key,Value 형태의  자료구조 : HahMap
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("search", search);
			map.put("keyword", keyword);
			model.addAttribute("list", service.list(map));
			model.addAttribute("search", search);
			model.addAttribute("keyword", keyword);
		}else {
			
			//검색없이 공지글목록을 조회하는 경우
			model.addAttribute("list", service.list());
		}*/
		
		
		return "notice/list";
	}
	
	//신규공지글저장화면 요청
	@RequestMapping("/insert.no")
	public String insert(NoticeVO vo, HttpSession session) {
		//작성자는 로그인한 사용자의 userid를 담는다.
		vo.setWriter( ((MainVO)session.getAttribute("login_info")).getUserid() );
		//화면에서 입력한 정보를 DB에 저장한 후
		//목록화면으로 연결
		//첨부파일이 있는 경우 파일정보를 데이터객체에 담는다.
		
		service.insert(vo);	//서비스에 메소드를 호출
		return "redirect:list.no";
	}
	
	@Autowired private CommonService common;
	
	//신규공지글작성화면 요청    
	@RequestMapping("/new.no")
	public String notice() {
		return "notice/new";
	}
	
	//@공지글상세화면 요청
	@RequestMapping("/detail.no")
	//readcnt하는 방법들
	//@RequestParam(required=false) integer read) { 
	//@RequestParam(defaultValue="0") int read 
//	public String detail(Model model, int id,  int read) {
	public String detail(Model model, int id,  @RequestParam(defaultValue="0") int read) {
		//선택한 공지글의 정보를 DB에서 조회해온 후
		//상세화면에 출력할 수 있도록 Model에 담는다.
		if(read==1) {
			//조회수 증가 처리
			service.read(id);
		}
		model.addAttribute("vo", service.detail(id));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		model.addAttribute("page", page);		
		return "notice/detail";
	}
	
	
	//공지글 삭제처리 요청
	@RequestMapping("/delete.no")
	public String delete(int id, HttpSession session) {
		//해당 공지글을 DB에서 삭제한 후
		//목록화면으로 연결
		service.delete(id);
		return "redirect:list.no";
	}
	
	//공지글 수정화면 요청
	@RequestMapping("/modify.no")
	public String modify(int id, Model model) {
		//DB에서 해당 공지글 정보를 조회해온 후
		//수정화면에 출력하도록 Model에 담는다
		model.addAttribute("vo", service.detail(id));
		return "notice/modify";
	}
	
	//공지글정보수정 처리 요청
	@RequestMapping("/update.no")
		public String update(NoticeVO vo, HttpSession session, String attach) {
			//화면에서 변경입력한 정보를 DB에 저장한 후
			//상세화면으로 연결
			//원래 첨부된 파일이 없는데 변경하면서 첨부하는 경우
			//원래 DB에 저장되어 있던 첨부파일정보를 조회해 온다.
			NoticeVO notice = service.detail(vo.getId());
			service.update(vo);
			return "redirect:detail.no?id=" + vo.getId();
		}
		
}