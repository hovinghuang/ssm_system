package com.ssm.controller;

import java.util.ArrayList;
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
@RequestMapping("")
public class PermissionController {
	@Autowired
	PermissionService permissionService;

	@RequestMapping("listPermissionPage")
	public String listPermissionPage(Model model) {
		// 用户列表的记录总数
		int amount = permissionService.total();
		model.addAttribute("amount", amount);
		return "permission-list";
	}

	@ResponseBody
	@RequestMapping("listPermissionTable")
	public JSONObject listPermissionTable(String draw, String start, String length) {
		int amount = permissionService.total();
		List<Permission> permissionList = permissionService.list();

		// 获取Action的上下文，就是action的一些运行信息，环境等等
		int mydraw = 0, mystart = 0, mylength = 0, mypage = 0;
		// 获取前端的分页参数
		mydraw = Integer.parseInt(draw);
		mystart = Integer.parseInt(start);
		mylength = Integer.parseInt(length);
		mypage = (mystart / mylength) + 1;
		// System.out.println("访问次数mydraw==" + mydraw);
		// System.out.println("起始下标mystart==" + mystart);
		// System.out.println("列表长度mylength==" + mylength);
		// System.out.println("当前页数mypage==" + mypage);

		List<Permission> pageList = new ArrayList<Permission>();
		int mylen = 0;
		if ((amount - (mypage - 1) * mylength) > 10) {
			mylen = mylength;
		} else {
			mylen = amount - (mypage - 1) * mylength;
		}
		for (int i = 0; i < mylen; i++) {
			pageList.add(permissionList.get(mystart + i));
		}
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("data", pageList);
		info.put("draw", mydraw);
		info.put("start", mystart);
		info.put("length", mylength);
		info.put("recordsTotal", amount);
		info.put("recordsFiltered", amount);
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
			e.printStackTrace();
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