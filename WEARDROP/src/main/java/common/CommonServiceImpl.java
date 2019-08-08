package common;

import java.io.File;
import java.io.FileInputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.MultiPartEmail;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import oracle.net.aso.s;

@Service
public class CommonServiceImpl implements CommonService {

	@Override
	public String upload(String category, MultipartFile file, HttpSession session) {

		// 업로드할 파일을 어디에 업로드 할 것인지(물리적인 위치)를 지정한다.
		// upload/notice/2019/07/02/abc.txt
		// upload/board/2019/07/02/abc.txt

		String resources = session.getServletContext().getRealPath("resources");
		// Study_Web/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/IoT/resources

		// Study_Web/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/IoT/resources
		String upload = resources + File.separator + "upload";

		// Study_Web/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/IoT/resources/upload/notice/2019/07/03

		String folder = makeFolder(category, upload);

		// 동시다발적 사용자의 업로드로 인한 중복을 막기 위한 고유 아이디를 부여한다.
		// UUID(범용고유식별자:Universally Unique ID)
		String uuid = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

		// 파일을 저장하는 처리 : 파일을 옮겨주는 형태로
		try {
			file.transferTo(new File(folder, uuid));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return folder.substring(resources.length()) + File.separator + uuid;
	}

	private String makeFolder(String category, String upload) {
		// upload/board/2019/07/02/abc.txt
		StringBuilder sb = new StringBuilder(upload); // .../upload
		sb.append(File.separator + category); // .../load/notice

		Date now = new Date();
		sb.append(File.separator + new SimpleDateFormat("yyyy").format(now)); // ...upload/notice/2019

		sb.append(File.separator + new SimpleDateFormat("MM").format(now)); // ...upload/notice/2019/07

		sb.append(File.separator + new SimpleDateFormat("dd").format(now)); // ...upload/notice/2019/07/03

		String folder = sb.toString(); // 해당 폴더가 없으면 폴더를 생성
		File f = new File(folder);
		if (!f.exists())
			f.mkdirs();

		return folder;
	}

	@Override
	public File download(String filepath, String filename, HttpSession session, HttpServletResponse response) {
		// 다운로드할 파일객체 생성
		File file = new File(session.getServletContext().getRealPath("resources") + filepath);
		// 다운로드할 파일의 마임타입결정
		String mime = session.getServletContext().getMimeType(filename);
		if (mime == null)
			mime = "application/octet-stream";

		response.setContentType(mime);

		try {
			filename = URLEncoder.encode(filename, "utf-8").replaceAll("\\+", "%20");

			response.setHeader("content-disposition", "attachment; filename=" + filename);

			ServletOutputStream out = response.getOutputStream();
			FileCopyUtils.copy(new FileInputStream(file), out);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return file;
	}

	@Override
	public void emailSend(String email, String name, HttpSession session) {
		// 1. 기본 이메일
		// simpleSend(email, name);
		
		// 2. 첨부파일 있는 이메일
		// attachSend(email, name, session);
		
		// 3. Html 형식의 이메일
		HtmlSend(email, name, session);
	}
	
	private void HtmlSend(String email, String name, HttpSession session) {
		HtmlEmail mail = new HtmlEmail();
		
		mail.setHostName("smtp.daum.net");
		mail.setCharset("utf-8");
		
		mail.setAuthentication("cdkgw11", "qmfforghf!@3");
		mail.setSSLOnConnect(true);
		
		try {
			// 보내는이의 정보
			mail.setFrom("cdkgw11@hanmail.net", "한울 관리자");
			// 받는이의 정보
			mail.addTo(email, name);
			
			// 메일 제목, 내용 작성
			mail.setSubject("한울 오픈소스 기반 지능형 IoT 개발과정");
			
			StringBuffer content = new StringBuffer("<html>");
			content.append("<body>");
			content.append("<a href='http://www.hanuledu.co.kr'>"
					+ "<img src='http://cmsimg.mnet.com/clipimage/album/480/000/259/259237.jpg'/></a>");
					
			content.append("<h2>한울 오픈소스 과정</h2>");
			content.append("<hr>과정 가입을 축하합니다.<br>");			
			content.append("프로젝트까지 잘 마무리하시기 바랍니다!!");
			content.append("</body>");			
			content.append("</html>");
			
			mail.setHtmlMsg(content.toString());
			
			EmailAttachment file = new EmailAttachment();
			file = new EmailAttachment();
			file.setPath( session.getServletContext().getRealPath("resources") + File.separator + "img" + File.separator + "hanul.logo.png");
			mail.attach(file);		
			
			
			// 메일 보내기	
			mail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*
	private void attachSend(String email, String name, HttpSession session) {
		MultiPartEmail mail = new MultiPartEmail();
		mail.setHostName("smtp.daum.net");
		mail.setCharset("utf-8");
		
		mail.setAuthentication("cdkgw11", "qmfforghf!@3");
		mail.setSSLOnConnect(true);
		
		try {
			// 보내는이의 정보
			mail.setFrom("cdkgw11@hanmail.net", "한울 관리자");
			// 받는이의 정보
			mail.addTo(email, name);
			
			// 메일 제목, 내용 작성
			mail.setSubject("한울 오픈소스 기반 지능형 IoT 개발과정");
			mail.setMsg("과정 회원가입을 축하합니다! 첨부된 파일을 확인해주세요.");	
			
			// 이메일 파일 첨부를 위한 첨부 파일 객체 생성
			EmailAttachment file = new EmailAttachment();
			file.setPath("C:\\Users\\User\\Downloads\\OPEN API 이용자 매뉴얼_v5.pdf");
			mail.attach(file);
			
			// 프로젝트 내의 파일을 첨부하는 경우
			file = new EmailAttachment();
			file.setPath( session.getServletContext().getRealPath("resources") + File.separator + "img" + File.separator + "hanul.logo.png");
			mail.attach(file);			
			
			// URL을 통해 첨부하는 경우
			file = new EmailAttachment();
			file.setURL(new URL("http://cmsimg.mnet.com/clipimage/album/480/000/259/259237.jpg"));
			mail.attach(file);
			
			// 메일 보내기
			mail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}
	} */
	
	/*
	private void simpleSend(String email, String name) {
		SimpleEmail mail = new SimpleEmail();
		// 이메일 보낼 사람의 메일서버 지정
		mail.setHostName("smtp.daum.net");
		mail.setCharset("utf-8");
		
		// 로그인하기 위한 아이디 / 비밀번호
		mail.setAuthentication("cdkgw11", "qmfforghf!@3");
		mail.setSSLOnConnect(true);
		
		try {
			// 보내는이의 정보
			mail.setFrom("cdkgw11@hanmail.net", "한울 관리자");
			// 받는이의 정보
			mail.addTo(email, name);
			
			// 메일 제목, 내용 작성
			mail.setSubject("한울 오픈소스 기반 지능형 IoT 개발과정");
			mail.setMsg("과정 회원가입을 축하합니다!");	
			
			// 메일 보내기
			mail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*/
}
