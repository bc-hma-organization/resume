package com.hma.resume.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hma.resume.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/")
@Transactional
public class UserController extends HttpServlet{
	
	@Autowired
	private UserService userService;
	
	/**
	 * 登陆
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	/**
	 * 验证登陆
	 * @param username
	 * @param password
	 * @param model
	 * @param session
	 * @param request
	 * @return
	 */
	/*@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPost(String username, String password, Model model, HttpSession session, HttpServletRequest request) {
		
		return "";
	}*/
}
