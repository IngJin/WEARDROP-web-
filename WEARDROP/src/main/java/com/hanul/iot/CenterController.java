package com.hanul.iot;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import main.MainVO;
import center.CenterPage;
import center.CenterServiceImpl;
import center.CenterVO;
import common.CommonService;

@Controller
// 고객센터 목록화면 요청
@SessionAttributes("category")
public class CenterController {

	@Autowired
	private CommonService common;

	@Autowired
	private CenterServiceImpl service;

	@Autowired
	CenterPage page;

	@RequestMapping("/list.ct")
	public String list(@RequestParam(defaultValue = "1") int curPage, Model model) {
		page.setCurPage(curPage);
		model.addAttribute("page", service.list(page));
		model.addAttribute("category", "ct");
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		return "center/list";
	}

	// 신규 글쓰기화면 요청	
	@RequestMapping("/new.ct")
	public String center() {
		return "center/new";
	}

	@RequestMapping("/insert.ct")
	public String insert(CenterVO vo, HttpSession session) {
		vo.setUserid(((MainVO)session.getAttribute("info_login")).getUserid() );
		vo.setWriter(((MainVO)session.getAttribute("info_login")).getWriter() );
		service.insert(vo);
		return "redirect:list.no";
	}
	
	@RequestMapping("/center/list/${pid}")
	public String comment_list(@PathVariable int pid, Model model) {
	      model.addAttribute("list", service.content(pid));
	      model.addAttribute("crlf", "\r\n");
	      model.addAttribute("lf", "\n");
	      return "board/comment/List";
	   }
	
	@RequestMapping("/detail.ct")
	public String detail(Model model, int id) {
		// 선택한 방명록 글의 정보를 DB에서 조회해온 후
		// 상세화면에 출력할 수 있도록 Model 에 담는다.
		model.addAttribute("vo", service.detail(id));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		model.addAttribute("page", page);
		return "center/detail";
	}
		// 방명록 글 삭제처리 요청
		@RequestMapping("/delete.ct")
		public String delete(int id, HttpSession session) {
			// 첨부된 파일이 있다면 물리적 공간에서 해당 파일을 삭제

			// 해당 방명록 글을 DB에서 삭제한 후
			// 목록화면으로 연결
			service.delete(id);
			return "redirect:list.no";
		
	}
		
		// 방명록 글 수정화면 요청
		@RequestMapping("/modify.ct")
		public String modify(int id, Model model) {
			// DB에서 해당 방명록 정보를 조회해온 후
			// 수정화면에 출력하도록 Model에 담는다.
			model.addAttribute("vo", service.detail(id));
			return "center/modify";
		}
		
		// 방명록 정보 수정 처리 요청
		@RequestMapping("/update.ct")
		public String update(CenterVO vo, HttpSession session, String attach) {
			// 화면에서 변경입력한 정보를 DB에 저장한 후
			// 상세화면으로 연결
			// 원래DB에 저장되어 있던 첨부파일정보를 조회해 온다.
			CenterVO center = service.detail(vo.getId());

			service.update(vo);
			return "redirect:list.no";
		}
	

}
