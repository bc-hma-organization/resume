package com.hma.resume.controller;

import com.hma.resume.domain.Info;
import com.hma.resume.domain.Organization;
import com.hma.resume.domain.User;
import com.hma.resume.service.InfoService;
import com.hma.resume.service.OrganizationService;
import com.hma.resume.service.UserService;
import com.hma.resume.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 机构控制层
 */
@Controller
@RequestMapping("/organization")
@Transactional
public class OrganizationController {

    private Integer PAGE_MAX_NUM = 1;

    @Autowired
    private InfoService infoService;

    @Autowired
    private UserService userService;

    @Autowired
    private OrganizationService organizationService;

//regien 增删查改
    /**
     * 根据机构登录信息查询用户信息
     * @return
     */
    @RequestMapping(value = "selectUser", method = RequestMethod.GET)
    public String selectUser(HttpSession session, Model model, Integer page){
        String username = (String) session.getAttribute("username");//获得保存再session中的username
        User user = this.userService.findByUserName(username);//根据用户名查询用户信息，获得机构ID
        Organization organization = this.organizationService.findOrganizationById(user.getOrganizationID());//根据用户表中的机构ID查询机构信息
        int pageNum = Page.page(this.userService.findUserNumByConpanyKey(organization.getOrganizaKey()), PAGE_MAX_NUM);//获得最大页码
        List<User> list = this.userService.findUserByConpanyKey(organization.getOrganizaKey(), (page - 1) * PAGE_MAX_NUM, PAGE_MAX_NUM);//获得记录

        model.addAttribute("userList_" + username, list);//保存
        //session.setAttribute("CURRENT_PAGE_" + username, page);
        session.setAttribute("MAX_PAGE_" + username, pageNum);
        return "organization/show-user";

    }

    /**
     * 根据用户ID查询用户详情
     * @return
     */
    @RequestMapping(value = "selectInfoByUserId")
    public String selectInfoByUserId(Model model, Integer userId){
        User user = this.userService.findById(2);
        List<Info> infoList = this.infoService.selectInfoByUserId(2);
        if (user != null && infoList != null){
            model.addAttribute("userinfo", user);
            model.addAttribute("infoList", infoList);
            return "user_info";
        }else {
            return  "menu/404";
        }
    }

    /**
     * 根据infoID修改状态(未完成)
     * @return
     */
    @RequestMapping(value = "updateStatusById")
    public String updateStatusById(){
        Integer flag = 0;
        this.infoService.updateStatusById(1,0);
        if (flag > 0){
            return "success";
        }else {
            return  "flase";
        }
    }

    @RequestMapping(value = "approveInfo-list", method = RequestMethod.GET)
    public String approveList(Model model){

        return "organization/approveInfo-list";
    }
}
// endregien