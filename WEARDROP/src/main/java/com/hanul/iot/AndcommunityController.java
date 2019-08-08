package com.hanul.iot;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import community.CommunityServiceImpl;
import community.CommunityVO;

@Controller
public class AndcommunityController {
	@Autowired
	private CommunityServiceImpl service;

	// json ������
	@ResponseBody
	@RequestMapping(value = "/free.com", produces = "application/json; charset=utf-8")
	public String JSONFree(Model model) {
		List<CommunityVO> data = new ArrayList<CommunityVO>();
		data = service.and_list();
		// ÷������ file��� ġȯ
		for (int i = 0; i < data.size(); i++) {
			String filePath = data.get(i).getFilepath().replace("\\", "/");
			data.get(i).setFilepath(filePath);
			// System.out.println("=====================" + data.get(i).getFilepath());
		}
		String json = new Gson().toJson(model.addAttribute("list", data));
		return json;
	}

	// json ��������
	@ResponseBody
	@RequestMapping(value = "/sale.com", produces = "application/json; charset=utf-8")
	public String JSONSale(Model model) {
		List<CommunityVO> data = new ArrayList<CommunityVO>();
		data = service.and_list2();
		// ÷������ file��� ġȯ
		for (int i = 0; i < data.size(); i++) {
			String filePath = data.get(i).getFilepath().replace("\\", "/");
			data.get(i).setFilepath(filePath);
			// System.out.println("=====================" + data.get(i).getFilepath());
		}
		String json = new Gson().toJson(model.addAttribute("list", data));
		return json;
	}

	// �ȵ���̵� �� ���� insert
	@ResponseBody
	@RequestMapping(value = "/commu.com", produces = "application/json; charset=utf-8", method = {RequestMethod.GET, RequestMethod.POST })
	public JSONObject commu(@RequestParam HashMap<String, Object> map) {
		JSONObject result = new JSONObject();
		result.put("message", service.and_insert(map));
		List<CommunityVO> data = new ArrayList<CommunityVO>();
		service.and_list();
		System.out.println(result);
		return result;
	}

	// ����
	@ResponseBody
	@RequestMapping(value = "/anddelete.com", produces = "application/json; charset=utf-8", method = {RequestMethod.GET, RequestMethod.POST })
	public JSONObject delete(@RequestParam HashMap<String, Object> map) {
		JSONObject result = new JSONObject();
		result.put("message", service.and_delete(map));
		List<CommunityVO> data = new ArrayList<CommunityVO>();
		service.and_list();
		
		return result;
	}

	// ����
	@ResponseBody
	@RequestMapping(value = "/andupdate.com", produces = "application/json; charset=utf-8", method = {
			RequestMethod.GET, RequestMethod.POST })
	public JSONObject update(@RequestParam HashMap<String, Object> map) {
		JSONObject result = new JSONObject();
		result.put("message", service.and_update(map));
		List<CommunityVO> data = new ArrayList<CommunityVO>();
		service.and_list();
		return result;
	}

}
