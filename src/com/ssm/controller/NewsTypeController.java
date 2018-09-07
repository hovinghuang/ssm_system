package com.ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ssm.pojo.NewsType;
import com.ssm.service.NewsTypeService;

@Controller
@RequestMapping("")
public class NewsTypeController {
	@Autowired
	NewsTypeService newsTypeService;

	@RequestMapping("listNewsTypePage")
	public String listNewsTypePage(Model model) {
		return "newstype-list";
	}

	@ResponseBody
	@RequestMapping("listNewsTypeTable")
	public JSONObject listNewsTypeTable() {
		List<NewsType> nt = newsTypeService.list();
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("data", nt);
		String a = JSON.toJSONString(info);
		JSONObject newstype_table = JSONObject.parseObject(a);
		return newstype_table;
	}

	@RequestMapping("addNewsTypePage")
	public String addNewsTypePage(Model model) {
		return "newstype-add";
	}

	@ResponseBody
	@RequestMapping("addNewsType")
	public String addNewsType(NewsType newsType) {
		try {
			// 将拿到的数据插入数据库
			newsTypeService.add(newsType);
			// 向前端返回操作成功的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "success");
			return json.toJSONString();
		} catch (Exception e) {
			// 向前端返回操作失败的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "error");
			return json.toJSONString();
		}

	}

	@RequestMapping("editNewsTypePage")
	public String editNewsTypePage(Model model, int id) {
		NewsType newsType = newsTypeService.findNewsTypeById(id);
		model.addAttribute("newsType", newsType);
		return "newstype-edit";
	}

	@ResponseBody
	@RequestMapping("editNewsType")
	public String editNewsType(NewsType newsType) {
		System.out.println("newsType.getName()==" + newsType.getName());
		try {
			// 提交编辑好的数据
			newsTypeService.update(newsType);
			// 向前端返回操作成功的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "success");
			return json.toJSONString();
		} catch (Exception e) {
			// 向前端返回操作失败的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "error");
			return json.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping("deleteNewsType")
	public String deleteNewsType(Model model, int id) {
		try {
			// 根据id删除数据
			newsTypeService.delete(id);
			// 向前端返回操作成功的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "success");
			return json.toJSONString();
		} catch (Exception e) {
			// 向前端返回操作失败的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "error");
			return json.toJSONString();
		}
	}

}
