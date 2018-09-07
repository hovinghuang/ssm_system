package com.ssm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ssm.pojo.User;
import com.ssm.service.UserService;
import com.ssm.util.PictureCheckCode;

//专门用于显示页面的控制器
@Controller
@RequestMapping("")
public class PageController {
	@Autowired
	UserService userService;

	@RequestMapping("PictureCheckCode")
	public void PictureCheckCode(HttpServletRequest request, HttpServletResponse response) {
		PictureCheckCode pictureCheckCode = new PictureCheckCode();
		try {
			pictureCheckCode.service(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("welcome")
	public String welcome() {
		return "welcome";
	}

	@RequestMapping("index")
	public String index() {
		return "index";
	}

	@RequestMapping("userInfoPage")
	public String userInfoPage() {
		return "user-info";
	}

	@RequestMapping("passwordEditPage")
	public String passwordEditPage() {
		return "password-edit";
	}

	@ResponseBody
	@RequestMapping("passwordEdit")
	public String passwordEdit(long userid, String oldpassword, String newpassword) {
		User user = userService.get(userid);
		String salt = new SecureRandomNumberGenerator().nextBytes().toString();
		int times = 2;
		String algorithmName = "md5";
		String saltInDB = user.getSalt();
		String encodedPasswordInDB = user.getPassword();
		String oldencodedPassword = new SimpleHash(algorithmName, oldpassword, saltInDB, times).toString();
		// 如果旧的密码匹配不相等，则无法修改新密码
		if (!encodedPasswordInDB.equals(oldencodedPassword)) {
			// 向前端返回操作失败的json信息
			JSONObject json = new JSONObject();
			json.put("msg", "oldpassworderror");
			return json.toJSONString();
		}
		try {
			String newencodedPassword = new SimpleHash(algorithmName, newpassword, salt, times).toString();
			user.setSalt(salt);
			user.setPassword(newencodedPassword);
			// 提交编辑好的修改密码
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

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping("unauthorized")
	public String noPerms() {
		return "unauthorized";
	}
}
