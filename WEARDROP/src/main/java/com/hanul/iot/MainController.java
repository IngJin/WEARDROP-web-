package com.hanul.iot;

import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import main.KakaoAPI;
import main.MainEmailService;
import main.MainEmailServiceImpl;
import main.MainServiceImpl;
import main.MainVO;

@Controller
@SessionAttributes("category")
public class MainController {
	@Autowired
	private MainServiceImpl service;
	@Autowired
	private MainEmailServiceImpl emailService;	
	@Autowired
	private KakaoAPI kakao;

	// 메인 페이지 호출
	@RequestMapping(value = { "/", "/index" })
	public String home(Locale locale, Model model) {
		model.addAttribute("category", "");
		return "home";
	}
	
	// 약관 페이지 호출
	@RequestMapping("/terms.ho")
	public String terms() {
		return "terms";
	}	
	
	// 아이디 찾기 페이지 호출
	@RequestMapping("/userid_find.ho")
	public String userid_find() {
		return "userid_find";
	}	
	
	// 비밀번호 찾기 페이지 호출
	@RequestMapping("/userpw_find.ho")
	public String userpw_find() {
		return "userpw_find";
	}	

	// 로그인 페이지 호출
	@RequestMapping("/login.ho")
	public String login() {
		return "main/login";
	}

	// 로그아웃 처리 요청
	@ResponseBody
	@RequestMapping("/logout_log")
	public void logout(HttpSession session) {
		// 세션에 저장한 회원정보 삭제
		kakao.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("info_login");
	}

	// 로그인 처리 요청
	@ResponseBody
	@RequestMapping("/login_log")
	public boolean login(String userid, String userpw, HttpSession session) {
		// DB에서 입력한 아이디, 비번과 일치하는 회원정보 조회
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpw", userpw);
		MainVO vo = service.login(map);
		if (vo != null) {
			session.setAttribute("info_login", vo);
		}
		return vo == null ? false : true;
	}

	// 회원가입 처리 요청
	@ResponseBody
	@RequestMapping(value = "/join_log", produces = "text/html; charset=utf-8")
	public String join(MainVO vo) {
		// 화면에서 입력한 정보를 DB에 저장한 후 홈으로 이동
		StringBuffer sb = new StringBuffer("<script type='text/javascript'>");
		if (service.insert(vo)) {
			sb.append("alert('회원가입을 축하합니다.'); location='index'");
		} else {
			sb.append("alert('회원가입 실패 ㅠㅠ'); history.go(-1);");
		}
		sb.append("</script>");
		return sb.toString();
	}

	// 아이디 중복확인 요청
	@ResponseBody
	@RequestMapping("/id_check_main")
	public String id_check(String userid) {
		// DB에 입력된 아이디가 있는지의 여부 판단
		return String.valueOf(service.id_check(userid));
	}	
	
	// 아이디 찾기
	@ResponseBody @RequestMapping(value="/userid_find")
	public MainVO userid_find(String email) {
		// DB에 입력된 이메일이 있는지의 여부 판단
		MainVO check = service.userid_find(email);
		return check;		
	}
	
	// 비밀번호 찾기
	@ResponseBody @RequestMapping(value="/userpw_find")
	public MainVO userpw_find(String userid, String email) {
		// DB에 입력된 이메일이 있는지의 여부 판단
		MainVO vo = new MainVO();
		vo.setUserid(userid);
		vo.setEmail(email);
		MainVO check = service.userpw_find(vo);
		if(check != null) {
			emailService.emailSend(check);
		}
		return check;		
	}
			
	// 카카오톡 로그인
	@RequestMapping(value = "/kakaologin")
	public String kakaologin(@RequestParam("code") String code, HttpSession session) {
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);

		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		if (userInfo.get("email") != null) {
			String email = userInfo.get("email").toString();
			String userid = userInfo.get("userid").toString();
			String writer = userInfo.get("writer").toString();

			// DB에 해당 정보가 존재할 경우
			String check = String.valueOf(service.email_check(email));
			if (check == "false") {
				// 이메일 정보를 매칭하여 일치한 걸 가져온다.
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("email", email);
				MainVO vo = service.email_login(map);
				session.setAttribute("info_login", vo);
				session.setAttribute("access_Token", access_Token);
				// 없으면 해당 정보를 VO에 넣어서 바로 세션 처리.
			} else {
				MainVO vo = new MainVO();
				vo.setEmail(email);
				vo.setUserid(userid);
				vo.setWriter(writer);
				session.setAttribute("info_login", vo);
				session.setAttribute("access_Token", access_Token);
			}
		}
		return "home";
	}
}
