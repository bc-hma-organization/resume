package com.hma.resume.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hma.resume.domain.Organization;
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
     * 显示首页信息
     * @return
     */
	@RequestMapping(value = "index", method = RequestMethod.GET)
    public String showIndex(Model model, HttpSession session){
	    //根据session获取当前登录用户
	    User user = this.userService.findByUserName(session.getAttribute("username").toString());
	    model.addAttribute("user", user);
	    return "index";
    }

    /**
     * 欢迎页
     * @return
     */
    @RequestMapping(value = "welcome", method = RequestMethod.GET)
    public String showWelcome(Model model, HttpSession session){
        model.addAttribute("user", this.userService.findByUserName(session.getAttribute("username").toString()));
	    return "welcome";
	}

    /**
     * 注销账号，登出
     * @param session
     * @return
     */
	@RequestMapping(value = "logout")
    public @ResponseBody Integer logout(HttpSession session){
	    session.invalidate();
	    return 1;
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
	    return type + "-register";
    }

	/**
	 * 人才注册页面
	 * @return
	 */
	@RequestMapping(value = "talent-register", method = RequestMethod.GET)
	public String talentRegister(){
	    return "talent-register";
	}

	/**
	 * 人才提交注册
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "talent-register", method = RequestMethod.POST)
	public @ResponseBody Result talentRegisterPost(User user){
        Result result = this.userService.saveRegister(user);
		return result;
	}

    /**
     * 查找机构key是否已被注册
     * @param organizationKey
     * @return
     */
	@RequestMapping(value = "checkOrganizationKey", method = RequestMethod.POST)
    public @ResponseBody Result checkOrganizationKey(String organizationKey){
	    Result result = this.userService.checkOrganizationKey(organizationKey);
        return result;
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
    public @ResponseBody Result orgRegisterPost(User user, Organization organization){
        Result result = this.userService.saveOrgRegister(user, organization);
	    return result;
    }

	/**
	 * 显示个人信息页面
	 * @param model
	 * @param session
	 * @return
	 */
    @RequestMapping(value = "edit", method = RequestMethod.GET)
	public String updateUser(Model model, HttpSession session){
    	model.addAttribute("user", this.userService.findByUserName(session.getAttribute("username").toString()));
    	return "modify-information";
	}

	/**
	 * 保存用户信息接口
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public @ResponseBody Result editPost(User user){
    	Result result = this.userService.updateUserInfo(user);
		return result;
	}
}
