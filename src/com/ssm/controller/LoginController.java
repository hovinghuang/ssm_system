package com.ssm.controller;

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
	public String login(Model model, String username, String password) {
		User user = userService.getByName(username);
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		try {
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

		} catch (AuthenticationException e) {
			model.addAttribute("error", "验证失败");
			return "login";
		}

	}
}
