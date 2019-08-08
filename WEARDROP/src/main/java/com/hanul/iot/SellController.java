package com.hanul.iot;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import sell.SellPage;
import sell.SellService;
import sell.SellServiceImpl;
import sell.SellVO;

@Controller @SessionAttributes("category")
public class SellController {
	@Autowired private SellServiceImpl service;
	@Autowired private CommonService common;
	@Autowired SellPage page;
	
	//신규글저장처리 요청
	@RequestMapping("/insert.se")
	public String insert(SellVO vo, MultipartFile file, HttpSession session) {
		
		if(file.getSize()>0) {
			vo.setFilename(file.getOriginalFilename() );
			vo.setFilepath(common.upload("sell",file,session));
		}
		service.insert(vo);
		return "redirect:list.se";
	}
	
	// 신규 공지글 작성화면 요청
	@RequestMapping("/new.se")
	public String sell() {
		return "sell/new";
	}
	
	// 중고장터 목록 화면 요청
	@RequestMapping("/list.se")
	public String list(@RequestParam(defaultValue="1") int curPage, Model model, String search, String keyword) {
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		System.out.println(page);
		model.addAttribute("page", service.list(page));
	
	//model.addAttribute( "list", service.list() );
		return "sell/list";
		
	}
	// 중고장터 상세화면 요청
	@RequestMapping("/detail.se")
	public String detail(Model model, int id, 
			@RequestParam(defaultValue="0") int read) {
		//선택한 방명록 글의 정보를 DB에서 조회해온 후
		//상세화면에 출력할 수 있도록 Model 에 담는다.
		if(read==1) service.read(id);
		model.addAttribute("vo",service.detail(id) );
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		model.addAttribute("page", page);
		return "sell/detail";
	}
	
	
	// 중고장터 글 수정화면 요청
	@RequestMapping("/modify.se")
	public String modify(int id, Model model) {
		//DB에서 해당 장터 정보를 조회해온 후
		//수정화면에 출력하도록 Model에 담는다.
		model.addAttribute("vo", service.detail(id));
		return "sell/modify";
	}
}
