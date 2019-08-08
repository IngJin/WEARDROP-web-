package com.hanul.iot;

import java.io.File;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import main.MainVO;
import notice.NoticePage;
import notice.NoticeServiceImpl;
import notice.NoticeVO;
import notice.NoticeService;

@Controller @SessionAttributes("category")
public class NoticeController {
	//@Autowired private NoticeServiceImpl service;
	@Resource(name="service")private NoticeService service;
	
	@Autowired NoticePage page;
	
	//�����۸��ȭ�� ��û
	@RequestMapping("/list.no")
	public String list( @RequestParam(defaultValue="1") int curPage, Model model, String search, String keyword) {
		//DB���� �����۸���� ��ȸ�ؿ�
		//���ȭ�鿡 ����� �� �ֵ��� Model�� ��´�.
		//�˻��� ����� �ش��ϴ� �����۸���� ��ȸ�ϴ� ���
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		model.addAttribute("page", service.list(page));
		model.addAttribute("category", "no");
		
		/*NoticePage page = service.list(vo);*/
		
		/*if(keyword != null) {
			//Key,Value ������  �ڷᱸ�� : HahMap
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("search", search);
			map.put("keyword", keyword);
			model.addAttribute("list", service.list(map));
			model.addAttribute("search", search);
			model.addAttribute("keyword", keyword);
		}else {
			
			//�˻����� �����۸���� ��ȸ�ϴ� ���
			model.addAttribute("list", service.list());
		}*/
		
		
		return "notice/list";
	}
	
	//�ű԰���������ȭ�� ��û
	@RequestMapping("/insert.no")
	public String insert(NoticeVO vo, HttpSession session) {
		//�ۼ��ڴ� �α����� ������� userid�� ��´�.
		vo.setWriter( ((MainVO)session.getAttribute("login_info")).getUserid() );
		//ȭ�鿡�� �Է��� ������ DB�� ������ ��
		//���ȭ������ ����
		//÷�������� �ִ� ��� ���������� �����Ͱ�ü�� ��´�.
		
		service.insert(vo);	//���񽺿� �޼ҵ带 ȣ��
		return "redirect:list.no";
	}
	
	@Autowired private CommonService common;
	
	//�ű԰������ۼ�ȭ�� ��û    
	@RequestMapping("/new.no")
	public String notice() {
		return "notice/new";
	}
	
	//@�����ۻ�ȭ�� ��û
	@RequestMapping("/detail.no")
	//readcnt�ϴ� �����
	//@RequestParam(required=false) integer read) { 
	//@RequestParam(defaultValue="0") int read 
//	public String detail(Model model, int id,  int read) {
	public String detail(Model model, int id,  @RequestParam(defaultValue="0") int read) {
		//������ �������� ������ DB���� ��ȸ�ؿ� ��
		//��ȭ�鿡 ����� �� �ֵ��� Model�� ��´�.
		if(read==1) {
			//��ȸ�� ���� ó��
			service.read(id);
		}
		model.addAttribute("vo", service.detail(id));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		model.addAttribute("page", page);		
		return "notice/detail";
	}
	
	
	//������ ����ó�� ��û
	@RequestMapping("/delete.no")
	public String delete(int id, HttpSession session) {
		//�ش� �������� DB���� ������ ��
		//���ȭ������ ����
		service.delete(id);
		return "redirect:list.no";
	}
	
	//������ ����ȭ�� ��û
	@RequestMapping("/modify.no")
	public String modify(int id, Model model) {
		//DB���� �ش� ������ ������ ��ȸ�ؿ� ��
		//����ȭ�鿡 ����ϵ��� Model�� ��´�
		model.addAttribute("vo", service.detail(id));
		return "notice/modify";
	}
	
	//�������������� ó�� ��û
	@RequestMapping("/update.no")
		public String update(NoticeVO vo, HttpSession session, String attach) {
			//ȭ�鿡�� �����Է��� ������ DB�� ������ ��
			//��ȭ������ ����
			//���� ÷�ε� ������ ���µ� �����ϸ鼭 ÷���ϴ� ���
			//���� DB�� ����Ǿ� �ִ� ÷������������ ��ȸ�� �´�.
			NoticeVO notice = service.detail(vo.getId());
			service.update(vo);
			return "redirect:detail.no?id=" + vo.getId();
		}
		
}