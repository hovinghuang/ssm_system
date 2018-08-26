package com.ssm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssm.util.PictureCheckCode;

//专门用于显示页面的控制器
@Controller
@RequestMapping("")
public class PageController {
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

	@RequestMapping("userInfoPage")
	public String userInfoPage() {
		return "user-info";
	}

	@RequestMapping("index")
	public String index() {
		return "index";
	}

	// @RequiresPermissions("deleteOrder")
	@RequestMapping("deleteOrder")
	public String deleteOrder() {
		return "deleteOrder";
	}

	// @RequiresRoles("productManager")
	@RequestMapping("deleteProduct")
	public String deleteProduct() {
		return "deleteProduct";
	}

	@RequestMapping("listProduct")
	public String listProduct() {
		return "listProduct";
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
