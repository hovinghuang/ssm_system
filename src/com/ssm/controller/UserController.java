package com.ssm.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ssm.pojo.Role;
import com.ssm.pojo.User;
import com.ssm.service.RoleService;
import com.ssm.service.UserRoleService;
import com.ssm.service.UserService;

@Controller
@RequestMapping("config")
public class UserController {
	@Autowired
	UserRoleService userRoleService;
	@Autowired
	UserService userService;
	@Autowired
	RoleService roleService;

	@RequestMapping("listUserPage")
	public String listUserPage(Model model) {
		// 用户列表的记录总数
		int amount = userService.total();
		model.addAttribute("amount", amount);
		return "user-list";
	}

	@ResponseBody
	@RequestMapping("listUserTable")
	public JSONObject listUserTable(String draw, String start, String length) throws SQLException {
		int amount = userService.total();
		List<User> us = userService.list();
		// Map<String, String> user_roles = new HashMap<>();
		//
		// for (User user : us) {
		// Role roles = roleService.get(user.getId());
		// user_roles.put("id", String.valueOf(user.getId()));
		// user_roles.put("name", user.getName());
		// user_roles.put("password", user.getPassword());
		// user_roles.put("realname", user.getRealname());
		// user_roles.put("sex", String.valueOf(user.getSex()));
		// user_roles.put("phone", user.getPhone());
		// user_roles.put("email", user.getEmail());
		// user_roles.put("address", user.getAddress());
		// user_roles.put("entrytime", user.getEntrytime());
		// }
		//
		// JSONObject json = new JSONObject();
		// json.put("data", JSONObject.toJSON(user_roles));
		// System.out.println("返回数据json：" + json.toJSONString());
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

		List<User> pageList = new ArrayList<User>();
		int mylen = 0;
		if ((amount - (mypage - 1) * mylength) > 10) {
			mylen = mylength;
		} else {
			mylen = amount - (mypage - 1) * mylength;
		}
		for (int i = 0; i < mylen; i++) {
			pageList.add(us.get(mystart + i));
		}
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("data", pageList);
		info.put("draw", draw);
		info.put("start", start);
		info.put("length", length);
		String a = JSON.toJSONString(info);
		JSONObject user_table = JSONObject.parseObject(a);
		return user_table;
	}

	@RequestMapping("editUserPage")
	public String editUserPage(Model model, long id) {
		List<Role> rs = roleService.list();
		model.addAttribute("rs", rs);

		User user = userService.get(id);
		model.addAttribute("user", user);

		List<Role> roles = roleService.listRoles(user);
		model.addAttribute("currentRoles", roles);

		// System.out.println("rs==" + rs);
		// System.out.println("roles==" + roles);

		return "user-edit";
	}

	@ResponseBody
	@RequestMapping("editUser")
	public String editUser(User user, long[] roleIds) {

		String password = user.getPassword();
		// 如果在修改的时候没有设置密码，就表示不改动密码
		if (user.getPassword().length() != 0) {
			String salt = new SecureRandomNumberGenerator().nextBytes().toString();
			int times = 2;
			String algorithmName = "md5";
			String encodedPassword = new SimpleHash(algorithmName, password, salt, times).toString();
			user.setSalt(salt);
			user.setPassword(encodedPassword);
		} else {
			user.setPassword(null);
		}
		try {
			// 设置用户角色
			userRoleService.setRoles(user, roleIds);
			// 提交编辑好的用户
			userService.update(user);
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
	@RequestMapping("deleteUser")
	public String deleteUser(Model model, long id) {
		try {
			// 根据id删除用户
			userService.delete(id);
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

	// 根据id批量删除用户
	@ResponseBody
	@RequestMapping("deleteUsers")
	public String deleteUsers(Long[] idArray) {
		try {
			// 遍历数组
			for (int i = 0; i < idArray.length; i++) {
				// 根据id批量删除用户
				userService.delete(idArray[i]);
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

	@RequestMapping("addUserPage")
	public String addUserPage() {
		return "user-add";
	}

	@ResponseBody
	@RequestMapping("addUser")
	public String addUser(User user) {

		// 获取当前时间
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateNowStr = sdf.format(d);

		String salt = new SecureRandomNumberGenerator().nextBytes().toString();
		int times = 2;
		String algorithmName = "md5";
		// 设置默认密码，设置当前时间
		String default_password = "123456";
		String default_entrytime = dateNowStr;

		String encodedPassword = new SimpleHash(algorithmName, default_password, salt, times).toString();

		try {
			// 将拿到的用户插入数据库
			user.setPassword(encodedPassword);
			user.setSalt(salt);
			user.setEntrytime(default_entrytime);
			userService.add(user);
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

	@RequestMapping("searchUserByKeyPage")
	public String searchUserByKeyPage() {
		return "user-search";
	}

	@ResponseBody
	@RequestMapping("searchUserByKey")
	public JSONObject searchUserByKey(String key) {
		List<User> us = userService.searchUserByKey(key);
		for (User u : us) {
			System.out.println("查找到的对象：" + u.getRealname());
		}
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("data", us);
		String a = JSON.toJSONString(info);
		JSONObject user_table = JSONObject.parseObject(a);
		return user_table;
	}

}