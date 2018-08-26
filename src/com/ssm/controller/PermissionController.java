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
import com.ssm.pojo.Permission;
import com.ssm.service.PermissionService;

@Controller
@RequestMapping("config")
public class PermissionController {
	@Autowired
	PermissionService permissionService;

	@RequestMapping("listPermissionPage")
	public String listPermissionPage() {
		return "permission-list";
	}

	@ResponseBody
	@RequestMapping("listPermissionTable")
	public JSONObject listPermissionTable(Model model) {
		List<Permission> ps = permissionService.list();
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("data", ps);
		String a = JSON.toJSONString(info);
		JSONObject permission_table = JSONObject.parseObject(a);
		return permission_table;
	}

	@RequestMapping("editPermissionPage")
	public String editPermissionPage(Model model, long id) {
		Permission permission = permissionService.get(id);
		model.addAttribute("permission", permission);
		return "permission-edit";
	}

	@ResponseBody
	@RequestMapping("editPermission")
	public String editPermission(Permission permission) {
		System.out.println(permission.getName());
		try {
			// 提交编辑好的角色
			permissionService.update(permission);
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

	@RequestMapping("addPermissionPage")
	public String addPermissionPage() {
		return "permission-add";
	}

	@ResponseBody
	@RequestMapping("addPermission")
	public String addPermission(Permission permission) {
		System.out.println(permission.getName());
		System.out.println(permission.getDesc_());
		try {
			// 添加权限
			permissionService.add(permission);
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
	@RequestMapping("deletePermission")
	public String delete(Model model, long id) {
		try {
			// 删除权限
			permissionService.delete(id);
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