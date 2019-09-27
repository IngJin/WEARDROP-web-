package com.hanul.iot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import main.ManagerServiceImpl;

@Controller
public class ManagerController {
	
	@Autowired private ManagerServiceImpl service;

	// 회원관리 페이지 호출
	@RequestMapping("/manager.list")
	public String list(Model model) {
		model.addAttribute("category", "cu");
		model.addAttribute("list", service.list());

		return "manager/list";
	}
	
	// 고객정보 삭제 처리 요청
	@RequestMapping("/manager.delete")
	public String delete(String userid) {
		// 해당 고객의 정보를 DB에서 삭제한 후
		// 목록 화면으로 연결
		service.delete(userid);
		return "redirect:manager.list";
	}
	
}
