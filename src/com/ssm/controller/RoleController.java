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
import com.ssm.pojo.Role;
import com.ssm.service.PermissionService;
import com.ssm.service.RolePermissionService;
import com.ssm.service.RoleService;

@Controller
@RequestMapping("config")
public class RoleController {
	@Autowired
	RoleService roleService;
	@Autowired
	RolePermissionService rolePermissionService;
	@Autowired
	PermissionService permissionService;

	@RequestMapping("listRolePage")
	public String listRolePage() {
		return "role-list";
	}

	@ResponseBody
	@RequestMapping("listRoleTable")
	public JSONObject listRoleTable() {
		List<Role> rs = roleService.list();
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("data", rs);
		String a = JSON.toJSONString(info);
		JSONObject role_table = JSONObject.parseObject(a);
		return role_table;
	}

	@RequestMapping("editRolePage")
	public String editRolePage(Model model, long id) {
		Role role = roleService.get(id);
		model.addAttribute("role", role);

		List<Permission> ps = permissionService.list();
		model.addAttribute("ps", ps);

		List<Permission> currentPermissions = permissionService.list(role);
		model.addAttribute("currentPermissions", currentPermissions);

		return "role-edit";
	}

	@ResponseBody
	@RequestMapping("editRole")
	public String editRole(Role role, long[] permissionIds) {
		System.out.println("role.getName()==" + role.getName());
		System.out.println("role.getDesc_()==" + role.getDesc_());
		try {
			// 设置用户权限
			rolePermissionService.setPermissions(role, permissionIds);
			// 提交编辑好的角色
			roleService.update(role);
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

	@RequestMapping("addRolePage")
	public String addRolePage() {
		return "role-add";
	}

	@ResponseBody
	@RequestMapping("addRole")
	public String addRole(Role role) {
		System.out.println(role.getName());
		System.out.println(role.getDesc_());
		try {
			// 将拿到的角色插入数据库
			roleService.add(role);
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
	@RequestMapping("deleteRole")
	public String delete(long id) {
		try {
			// 删除角色
			roleService.delete(id);
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