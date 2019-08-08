package com.hanul.iot;

import java.io.File;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import community.CommunityPage;
import community.CommunityServiceImpl;
import community.CommunityVO;

@Controller
public class commuityController {
	@Autowired private CommunityServiceImpl service;
	@Autowired private CommonService common;
	@Autowired CommunityPage page;
	
	//�����Խ��� ȭ�� ��û
	@RequestMapping("/list.com")
	public String list(Model model, String search, String keyword,@RequestParam(defaultValue="1") int curPage) {
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		// System.out.println("keyword =========="+keyword);
		// System.out.println("curPage =========="+curPage);
		model.addAttribute("page", service.list(page));
		return"community/list";
	}
	
	//�ı�Խ��� ȭ�� ��û
	@RequestMapping("/list.hu")
	public String hugi() {
		return"community/hugi";
	}
	
	//�ı� ��ȭ�� ��û
	@RequestMapping("/detail.hu")
	public String hugidetail() {
		return"community/hugi_detail";
	}
	
	//�Խñ��ۼ�ȭ�� ��û
	@RequestMapping("/new.com")
	public String write() {
		return"community/new";
	}
	
	//�ű԰Խñ� ����ó�� ��û
	@RequestMapping("/insert.com")
	public String insert(CommunityVO vo, MultipartFile file, HttpSession session) {
		//÷������
		if(file.getSize()>0) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.upload("community", file, session));
		}
		service.insert(vo);
		return"redirect:list.com";
	}
	
	//�Խñ� ��ȭ�� ��û
	@RequestMapping("/detail.com")
	public String detail(Model model, int id, @RequestParam(defaultValue="0") int read) {
		if(read == 1) {
			service.read(id);	//��ȸ�� ���� ó��
		}
		model.addAttribute("vo",service.detail(id));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		model.addAttribute("page", page);	//curpage ����
		return"community/detail";
	}
	
	//�Խñ� ����ȭ�� ��û(�����Խ���)
	@RequestMapping("/modify.com")
	public String modify(Model model, int id) {
		model.addAttribute("vo", service.detail(id));
		return"community/modify";
	}
	
	//�Խñ� �������� ó����û
	@RequestMapping("/update.com")
	public String update(CommunityVO vo, MultipartFile file, HttpSession session, String attach) {
		//���� ÷�ε� ������ ���µ� �����ϸ鼭 ÷���ϴ� ���
		//���� DB�� ����Ǿ� �ִ� ÷������������ ��ȸ�� �´�.
		CommunityVO commu = service.detail(vo.getId());
		
		String uuid = commu.getFilepath();			//������ �Ѱ��� ������ ��ȯ
		uuid = session.getServletContext().getRealPath("resources") + uuid;   
		
		if(file.getSize()> 0) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.upload("community", file, session));
		//���� ÷�ε� ������ �־��� �� ������ �ٸ� ���Ϸ� ������ ÷���ϴ� ���
		//���� ÷�ε� ������ ����
			File f = new File(uuid);
			if(f.exists()) f.delete();
		}else {
			//���� ÷�ε� ������ �־��µ� ÷�ε� ������ �����ϴ� ���
			if(attach.equals("y")) {
				File f = new File(uuid);
				if(f.exists()) f.delete();
			}else {
				//���� ÷�ε� ������ �ְ� �״�� ����ϴ� ���
				vo.setFilename(commu.getFilename());
				vo.setFilepath(commu.getFilepath());
			}
		}
		service.update(vo);
		return "redirect:detail.com?id=" + vo.getId();
	}
	
	//�Խñ� ���� ó����û
	@RequestMapping("/delete.com")
	public String delete(int id) {
		service.delete(id);
		return"redirect:list.com";
	}
	
	//÷������ �ٿ�ε� ��û
	@ResponseBody @RequestMapping("/download.com")
	public File download(int id, HttpSession session, HttpServletResponse response) {
		CommunityVO vo = service.detail(id);
		return common.download(vo.getFilepath(), vo.getFilename(), session, response);
	}
	
	//���� ȭ�� ��û
	@RequestMapping("/map.com")
	public String map() {
		return"community/map";
	}
	

}
