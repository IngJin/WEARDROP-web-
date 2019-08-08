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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import Android_Ser.AndGalleryVO;
import Android_Ser.AndServiceImpl;



@Controller @SessionAttributes("category")
public class And_SerController {
	
	@Autowired private AndServiceImpl service;
	
	@ResponseBody @RequestMapping(value="/json.gal", produces="application/json; charset=utf-8")
	public String JSONDate(Model model) {
		List<AndGalleryVO> data = new ArrayList<AndGalleryVO>();
		data = service.list();
		service.galUpdate();
		String json = new Gson().toJson(model.addAttribute("list", data));
		return json;
	}
	
	@ResponseBody @RequestMapping(value="/andinsert.gal", produces="application/json; charset=utf-8", method= {RequestMethod.GET, RequestMethod.POST})
	public JSONObject andInsert(@RequestParam HashMap<String, Object> map) {
		JSONObject result = new JSONObject();
		result.put("message", service.andInsert(map));
		//List<GalleryVO> data = new ArrayList<GalleryVO>();
		//service.list();
		System.out.println(result);
		return result;
	}	
}


