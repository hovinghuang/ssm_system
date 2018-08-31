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
import com.ssm.pojo.PhotoType;
import com.ssm.service.PhotoTypeService;

@Controller
@RequestMapping("")
public class PhotoTypeController {
	@Autowired
	PhotoTypeService photoTypeService;

	@RequestMapping("listPhotoTypePage")
	public String listPhotoTypePage(Model model) {
		return "phototype-list";
	}

	@ResponseBody
	@RequestMapping("listPhotoTypeTable")
	public JSONObject listPhotoTypeTable() {
		List<PhotoType> photoTypeList = photoTypeService.list();
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("data", photoTypeList);
		String a = JSON.toJSONString(info);
		JSONObject photo_table = JSONObject.parseObject(a);
		return photo_table;
	}

	@RequestMapping("addPhotoTypePage")
	public String addPhotoTypePage(Model model) {
		return "phototype-add";
	}

	@ResponseBody
	@RequestMapping("addPhotoType")
	public String addPhotoType(PhotoType photoType) {
		try {
			// 添加相册类型
			photoTypeService.add(photoType);
			// 向前端返回操作成功的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "success");
			return json.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
			// 向前端返回操作失败的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "error");
			return json.toJSONString();
		}

	}

	@ResponseBody
	@RequestMapping("deletePhotoType")
	public String deletePhotoType(int id) {
		try {
			// 根据id删除用户
			photoTypeService.delete(id);
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

	@RequestMapping("editPhotoTypePage")
	public String editPhotoTypePage(Model model, int id) {
		PhotoType photoType = photoTypeService.findPhotoTypeById(id);
		model.addAttribute("photoType", photoType);

		return "phototype-edit";
	}

	@ResponseBody
	@RequestMapping("editPhotoType")
	public String editPhotoType(PhotoType photoType) {
		try {
			// 将图片文件写入photo文件夹CommonsMultipartFile file
			photoTypeService.update(photoType);
			// 向前端返回操作成功的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "success");
			return json.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
			// 向前端返回操作失败的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "error");
			return json.toJSONString();
		}

	}

}
