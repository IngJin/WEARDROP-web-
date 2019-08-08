package common;

import java.io.File;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface CommonService {
	void emailSend(String email, String name, HttpSession Session);
	String upload(String category, MultipartFile file, HttpSession session);
	
	File download(String filepath, String filename, HttpSession session, HttpServletResponse response);
}
