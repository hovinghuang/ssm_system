package com.ssm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.ConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ssm.pojo.Permission;
import com.ssm.pojo.Role;
import com.ssm.pojo.ZtreeNodeVo;
import com.ssm.service.PermissionService;
import com.ssm.service.RolePermissionService;
import com.ssm.service.RoleService;

@Controller
@RequestMapping("")
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

		List<Permission> permissionList = permissionService.list();
		List<ZtreeNodeVo> ztreeNodeVoList = new ArrayList<ZtreeNodeVo>();
		for (int i = 0; i < permissionList.size(); i++) {
			ZtreeNodeVo node = new ZtreeNodeVo();
			node.setId(permissionList.get(i).getId());
			node.setpId(permissionList.get(i).getPid());
			node.setName(permissionList.get(i).getName());
			ztreeNodeVoList.add(node);
		}

		model.addAttribute("ztreeNodeVoList2", JSONObject.toJSONString(ztreeNodeVoList));

		return "role-edit";
	}

	@ResponseBody
	@RequestMapping(value = "queryFunByRoleId", method = RequestMethod.POST)
	public String queryFunByRoleId(Model model, long id) {
		Role role = roleService.get(id);
		System.out.println("queryFunByRoleId的role.getName()==" + role.getName());
		List<Permission> currentPermissions = permissionService.list(role);
		List<ZtreeNodeVo> ztreeNodeVoList = new ArrayList<ZtreeNodeVo>();
		for (int i = 0; i < currentPermissions.size(); i++) {
			ZtreeNodeVo node = new ZtreeNodeVo();
			node.setId(currentPermissions.get(i).getId());
			node.setpId(currentPermissions.get(i).getPid());
			node.setName(currentPermissions.get(i).getName());
			node.setChecked(true);
			ztreeNodeVoList.add(node);
		}

		JSONObject json = new JSONObject();
		json.put("data", ztreeNodeVoList);
		return json.toJSONString();
	}

	@ResponseBody
	@RequestMapping("editRole")
	public String editRole(Role role, HttpServletRequest request) {
		System.out.println("role.getName()==" + role.getName());
		System.out.println("role.getDesc_()==" + role.getDesc_());
		String[] arr = request.getParameterValues("nodes");
		long[] permissionIds = null;
		if (arr != null) {
			permissionIds = (long[]) ConvertUtils.convert(arr, long.class);
		}
		try {
			if (arr != null) {
				// 设置用户权限
				rolePermissionService.setPermissions(role, permissionIds);
			}
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
	public String addRolePage(Model model) {
		List<Permission> permissionList = permissionService.list();
		List<ZtreeNodeVo> ztreeNodeVoList = new ArrayList<ZtreeNodeVo>();
		for (int i = 0; i < permissionList.size(); i++) {
			ZtreeNodeVo node = new ZtreeNodeVo();
			node.setId(permissionList.get(i).getId());
			node.setpId(permissionList.get(i).getPid());
			node.setName(permissionList.get(i).getName());
			ztreeNodeVoList.add(node);
		}

		model.addAttribute("ztreeNodeVoList", JSONObject.toJSONString(ztreeNodeVoList));
		return "role-add";
	}

	@ResponseBody
	@RequestMapping("addRole")
	public String addRole(Role role, HttpServletRequest request) {
		System.out.println(role.getName());
		System.out.println(role.getDesc_());

		String[] arr = request.getParameterValues("nodes");
		long[] permissionIds = null;
		if (arr != null) {
			permissionIds = (long[]) ConvertUtils.convert(arr, long.class);
		}
		try {
			// 将拿到的角色插入数据库
			roleService.add(role);
			// 将角色对应的权限插入数据库
			if (arr != null) {
				rolePermissionService.setPermissions(role, permissionIds);
			}
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