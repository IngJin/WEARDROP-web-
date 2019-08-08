package main;

import java.util.HashMap;
import java.util.List;

public interface MainService {
	boolean id_check(String userid); 	// 아이디 중복확인
	boolean insert(MainVO vo); 			// 회원가입
	boolean update(MainVO vo);			// 회원정보 수정
	boolean delete(String userid);		// 회원 탈퇴
	MainVO login(HashMap map);			// 로그인
	
	MainVO email_login(HashMap map);			// 로그인
	List<TestVO> list(); // text
	boolean email_check(String email); 	// 아이디 중복확인

}
