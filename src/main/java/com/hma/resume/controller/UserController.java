package com.hma.resume.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hma.resume.domain.User;
import com.hma.resume.dto.Result;
import com.hma.resume.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 用户控制器
 */
@Controller
@RequestMapping("/")
@Transactional
public class UserController extends HttpServlet{
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String initLogin(){
		return "login";
	}
	
	/**
	 * 登陆
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
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
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public @ResponseBody Result<User> loginPost(String username, String password, Model model, HttpSession session, HttpServletRequest request) {
		Result<User> result = this.userService.checkPassword(username, password);
		if(result.getSuccess()){
			//设置username缓存
			request.getSession(true).setAttribute("username", result.getData().getUserName());
			session.setMaxInactiveInterval(1800);
		}
		return result;
	}

    /**
     * 选择注册类型
     * @return
     */
	@RequestMapping(value = "register", method = RequestMethod.GET)
    public String register(){
	    return "register";
    }

    /**
     * 人才跳转接口，当选择人才后跳转到对应的注册页面
     * @param type 人才-talent    机构-organization
     * @return
     */
    @RequestMapping(value = "register", method = RequestMethod.POST)
    public @ResponseBody String registerPost(String type){
	    return "redirect:"+ type + "-register";
    }

	/**
	 * 人才注册页面
	 * @return
	 */
	@RequestMapping(value = "talent-register", method = RequestMethod.GET)
	public String talentRegister(){return "talent-register";}

	/**
	 * 人才提交注册
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "talent-register", method = RequestMethod.POST)
	public String talentRegisterPost(User user, Model model){

		return "redirect:login";
	}

    /**
     * 显示机构注册页面
     * @return
     */
	@RequestMapping(value = "organization-register", method = RequestMethod.GET)
    public String orgRegister(){
	    return "organization-register";
    }

    /**
     * 提交机构注册信息
     * @return
     */
    @RequestMapping(value = "organization-register", method = RequestMethod.POST)
    public String orgRegisterPost(){

	    return "redirect: login";
    }
}
