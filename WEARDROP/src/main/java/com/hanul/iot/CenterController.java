package com.hanul.iot;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import main.MainVO;
import center.CenterPage;
import center.CenterServiceImpl;
import center.CenterVO;
import common.CommonService;

@Controller
//������ ���ȭ�� ��û
@SessionAttributes("category")
public class CenterController {

	@Autowired
	private CommonService common;

	@Autowired
	private CenterServiceImpl service;

	@Autowired
	CenterPage page;

	@RequestMapping("/list.ct")
	public String list(@RequestParam(defaultValue = "1") int curPage, Model model) {
		page.setCurPage(curPage);
		model.addAttribute("page", service.list(page));
		model.addAttribute("category", "ct");
		return "center/list";
	}

	//�ű� �۾���ȭ�� ��û
	@RequestMapping("/new.ct")
	public String center() {
		return "center/new";
	}

	@RequestMapping("/insert.ct")
	public String insert(CenterVO vo, HttpSession session) {
		vo.setWriter(((MainVO) session.getAttribute("login_info")).getUserid());
		service.insert(vo);
		return "redirect:list.ct";
	}
	
	@RequestMapping("/center/list/${pid}")
	public String comment_list(@PathVariable int pid, Model model) {
	      model.addAttribute("list", service.content(pid));
	      model.addAttribute("crlf", "\r\n");
	      model.addAttribute("lf", "\n");
	      return "board/comment/List";
	   }
	
	@RequestMapping("/detail.ct")
	public String detail(Model model, int id) {
		// ������ ���� ���� ������ DB���� ��ȸ�ؿ� ��
		// ��ȭ�鿡 ����� �� �ֵ��� Model �� ��´�.
		model.addAttribute("vo", service.detail(id));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		model.addAttribute("page", page);
		return "center/detail";
	}
		// ���� �� ����ó�� ��û
		@RequestMapping("/delete.ct")
		public String delete(int id, HttpSession session) {
			// ÷�ε� ������ �ִٸ� ������ �������� �ش� ������ ����

			// �ش� ���� ���� DB���� ������ ��
			// ���ȭ������ ����
			service.delete(id);
			return "redirect:list.ct";
		
	}
		
		// ���� �� ����ȭ�� ��û
		@RequestMapping("/modify.ct")
		public String modify(int id, Model model) {
			// DB���� �ش� ���� ������ ��ȸ�ؿ� ��
			// ����ȭ�鿡 ����ϵ��� Model�� ��´�.
			model.addAttribute("vo", service.detail(id));
			return "center/modify";
		}
		
		// ���� ���� ���� ó�� ��û
		@RequestMapping("/update.ct")
		public String update(CenterVO vo, HttpSession session, String attach) {
			// ȭ�鿡�� �����Է��� ������ DB�� ������ ��
			// ��ȭ������ ����
			// ����DB�� ����Ǿ� �ִ� ÷������������ ��ȸ�� �´�.
			CenterVO center = service.detail(vo.getId());

			service.update(vo);
			return "redirect:detail.ct?id=" + vo.getId();
		}
	

}
