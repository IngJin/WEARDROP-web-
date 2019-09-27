package com.hanul.iot;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import community.CommentVO;
import community.CommunityPage;
import community.CommunityServiceImpl;
import community.CommunityVO;
import main.MainVO;

@Controller @SessionAttributes("category")
public class commuityController {
	@Autowired private CommunityServiceImpl service;
	@Autowired private CommonService common;
	@Autowired CommunityPage page;
	
	//자유게시판 화면 요청
	@RequestMapping("/list.com")
	public String list(@RequestParam(defaultValue="1") int curPage, Model model, String search, String keyword, @RequestParam(defaultValue="1") int code) {
		return"community/list";
	}
	
	// 중고장터 목록 화면 요청
	@RequestMapping("/list_com.ajax")
	public String list( @RequestParam(defaultValue="1") int code, @RequestParam(defaultValue="1") int curPage, Model model, String search, String keyword) {
	page.setCurPage(curPage);
	page.setSearch(search);
	page.setKeyword(keyword);
	page.setCode(code);
	model.addAttribute("page", service.list(page));
	return "community/tabs/list";
				
	}
	
	//게시글작성화면 요청
	@RequestMapping("/new.com")
	public String write() {
		return"community/new";
	}
	
	//신규게시글 저장처리 요청
	@RequestMapping("/insert.com")
	public String insert(CommunityVO vo, MultipartFile file, HttpSession session) {
		//로그인한 사용자의 userid를 담는다.
	    vo.setUserid(((MainVO)session.getAttribute("info_login")).getUserid());
		vo.setWriter(((MainVO)session.getAttribute("info_login")).getWriter());
	    System.out.println(vo.getWriter());
		//첨부파일
		if(file.getSize()>0) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.upload("community", file, session));
		}
		service.insert(vo);
		return"redirect:list.com";
	}
	
	//게시글 상세화면 요청
	@RequestMapping("/detail.com")
	public String detail(HttpServletResponse response, HttpServletRequest request,
			Model model, int id, int code, 
			@RequestParam(defaultValue="0") int read) {
		if(read==1) {
			service.read(id);		//조회수처리
		}
			model.addAttribute("vo",service.detail(id));
			model.addAttribute("crlf", "\r\n");
			model.addAttribute("lf", "\n");
			model.addAttribute("page", page);	//curpage 정보
			return"community/detail";
	}

	//게시글 수정화면 요청(자유게시판)
	@RequestMapping("/modify.com")
	public String modify(Model model, int id) {
		model.addAttribute("vo", service.detail(id));
		return"community/modify";
	}
	
	//게시글 정보수정 처리요청
	@RequestMapping("/update.com")
	public String update(CommunityVO vo, MultipartFile file, HttpSession session, String attach) {
		//원래 첨부된 파일이 없는데 변경하면서 첨부하는 경우
		//원래 DB에 저장되어 있던 첨부파일정보를 조회해 온다.
		CommunityVO commu = service.detail(vo.getId());
		
		String uuid = commu.getFilepath();			//공지글 한건의 정보를 반환
		uuid = session.getServletContext().getRealPath("resources") + uuid;   
		
		if(file.getSize()> 0) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.upload("community", file, session));
			//원래 첨부된 파일이 있었고 그 파일을 다른 파일로 변경해 첨부하는 경우
			//원래 첨부된 파일은 삭제
			File f = new File(uuid);
			if(f.exists()) f.delete();
		}else {
			//원래 첨부된 파일이 있었는데 첨부된 파일을 삭제하는 경우
			if(attach.equals("y")) {
				File f = new File(uuid);
				if(f.exists()) f.delete();
			}else {
				//원래 첨부된 파일이 있고 그대로 사용하는 경우
				vo.setFilename(commu.getFilename());
				vo.setFilepath(commu.getFilepath());
			}
		}
		service.update(vo);
		return "redirect:detail.com?id=" + vo.getId() + "&code=" + vo.getCode();
	}
	
	//게시글 삭제 처리요청
	@RequestMapping("/delete.com")
	public String delete(int id, HttpSession session) {
		//첨부된 파일이 있다면 물리적 공간에서 해당 파일을 삭제
		File f = new File (
			session.getServletContext().getRealPath(
			"resources" + service.detail(id).getFilepath())	);
		if( f.exists() ) f.delete();
				
		//해당 공지글을 DB에서 삭제한 후
		//목록화면으로 연결
		service.delete(id);
		return"redirect:list.com";
	}
	
	//첨부파일 다운로드 요청
	@ResponseBody @RequestMapping("/download.com")
	public File download(int id, HttpSession session, HttpServletResponse response) {
		CommunityVO vo = service.detail(id);
		return common.download(vo.getFilepath(), vo.getFilename(), session, response);
	}
	
	//지도 화면 요청
	@RequestMapping("/map.com")
	public String map() {
		return"community/map";
	}
	
	//댓글 저장 처리 요청
	@ResponseBody @RequestMapping("/community/comment/insert")
	public boolean comment_insert(int pid, String content, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pid", pid);
		map.put("content", content);
		map.put("userid", ((MainVO)session.getAttribute("info_login")).getUserid());
		return service.comment_insert(map);
	}

	//댓글이 보여지는 처리
	@RequestMapping("/community/comment/{pid}")
	public String comment_list(@PathVariable int pid, Model model) {
		model.addAttribute("list",service.comment_list(pid));
		model.addAttribute("crlf","\r\n");			
		model.addAttribute("lf", "\n");
		return"community/comment/list";
	}
	
	//댓글 수정처리
	@ResponseBody @RequestMapping(value="/community/comment/update", produces="application/text; charset=utf-8")
	public String comment_update(@RequestBody CommentVO vo) {
		return service.comment_update(vo) ? "성공" : "실패";
	}
	
	//댓글 삭제처리
	@ResponseBody @RequestMapping("/community/comment/delete/{id}")
	public void comment_delete(@PathVariable int id) {
		service.comment_delete(id);
	}
}
