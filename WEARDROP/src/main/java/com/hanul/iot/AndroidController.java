package com.hanul.iot;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import main.MainServiceImpl;
import main.MainVO;

@Controller @SessionAttributes("category")
public class AndroidController {
	@Autowired private MainServiceImpl service;
	/*
	@RequestMapping("/detail.bo")
	public String detail(Model model, int id, @RequestParam(defaultValue = "0") int read) {
		// 선택한 방명록 글의 정보를 DB에서 조회해온 후
		// 상세화면에 출력할 수 있도록 Model 에 담는다.
		if (read == 1)
			service.read(id);
		model.addAttribute("vo", service.detail(id));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		model.addAttribute("page", page);
		return "board/detail";
	}*/
	
	// 방명록 목록화면 요청
	@ResponseBody @RequestMapping(value="/list_android", produces="application/json; charset=utf-8")
	public JSONObject list() {
		JSONObject result = new JSONObject();
		result.put("message", service.list());
		return result;
	}
	
	@ResponseBody @RequestMapping(value="/id_check_android", produces="application/json; charset=utf-8")
	public JSONObject id_check(String userid) {
		JSONObject result = new JSONObject();
		// DB에 입력된 아이디가 있는지의 여부 판단
		String check = String.valueOf(service.id_check(userid));
		if (check == "false") {
			result.put("message", "아이디가 중복됩니다." );
		}
		return result;
	}
	
	@ResponseBody @RequestMapping(value="/email_check_android", produces="application/json; charset=utf-8")
	public JSONObject email_check(String email) {
		JSONObject result = new JSONObject();
		// DB에 입력된 이메일이 있는지의 여부 판단
		String check = String.valueOf(service.email_check(email));
		if (check == "false") {
			result.put("message", "email" );
		} else {
			result.put("message", "not" );
		}
		return result;
	}
	
	
	@ResponseBody @RequestMapping(value="/login_android", produces="application/json; charset=utf-8")
	public JSONObject login(String userid, String userpw, HttpSession session) {
		// DB에서 입력한 아이디, 비번과 일치하는 회원정보 조회
		HashMap<String, String> map = new HashMap<String , String>();
		map.put("userid", userid);
		map.put("userpw", userpw);
		MainVO vo = service.login(map);
		JSONObject result = new JSONObject();
		if( vo != null) { 
			session.setAttribute("info_login", vo); 
			result.put("message", vo);
		} 
		
		return result;
	}
	
	@ResponseBody @RequestMapping(value="/email_login_android", produces="application/json; charset=utf-8")
	public JSONObject email_login(String email, HttpSession session) {
		// DB에서 입력한 아이디, 비번과 일치하는 회원정보 조회
		HashMap<String, String> map = new HashMap<String , String>();
		map.put("email", email);
		MainVO vo = service.email_login(map);
		JSONObject result = new JSONObject();
		if( vo != null) { 
			session.setAttribute("info_login", vo); 
			result.put("message", vo);
		} 
		
		return result;
	}
	
	@ResponseBody @RequestMapping(value="/sign_android", produces="application/json; charset=utf-8")
	public JSONObject join(MainVO vo) {
		JSONObject result = new JSONObject();
		if ( service.insert(vo) ) {
			result.put("message", "회원가입에 성공하셨습니다.");
		} 
		return result;
	}
}
