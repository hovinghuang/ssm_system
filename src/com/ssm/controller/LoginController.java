package com.ssm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssm.pojo.User;
import com.ssm.service.UserService;

@Controller
@RequestMapping("")
public class LoginController {
	@Autowired
	UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, String username, String password, HttpServletRequest request,
			HttpSession httpSession, HttpServletResponse response) {
		User user = userService.getByName(username);
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		String checkcode = request.getParameter("checkCode");
		try {
			// 先检查验证码
			if (checkcode.equals("") || checkcode == null) {
				model.addAttribute("error", "请输入验证码");
				return "login";
			} else {
				if (!checkcode.equalsIgnoreCase((String) httpSession.getAttribute("randCheckCode"))) {
					model.addAttribute("error", "验证码不正确,请重新输入");
					return "login";
				} else {
					subject.login(token);
					Session session = subject.getSession();
					session.setAttribute("subject", subject);
					session.setAttribute("userId", user.getId());
					session.setAttribute("userName", user.getName());
					session.setAttribute("userRealname", user.getRealname());
					session.setAttribute("userSex", user.getSex());
					session.setAttribute("userPhone", user.getPhone());
					session.setAttribute("userEmail", user.getEmail());
					session.setAttribute("userAddress", user.getAddress());
					session.setAttribute("userEntrytime", user.getEntrytime());
					return "redirect:index";
				}
			}
		} catch (AuthenticationException e) {
			model.addAttribute("error", "验证失败,账号或密码错误");
			return "login";
		}

	}
}
