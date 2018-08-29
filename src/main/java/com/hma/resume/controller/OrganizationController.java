package com.hma.resume.controller;

import com.hma.resume.domain.Info;
import com.hma.resume.domain.User;
import com.hma.resume.service.InfoService;
import com.hma.resume.service.UserService;
import com.hma.resume.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
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
//regien 增删查改
    /**
     * 根据单位查询用户信息
     * @return
     */
    @RequestMapping(value = "selectUserByCompany")
    public String selectUserByCompany(HttpServletRequest request, Model model, String company){
        HttpSession session = request.getSession();//获得session
        int page;//声明页面
        String string_page = (String) session.getAttribute(company + "_CURRENT_PAGE");//活动session中的page
        if (string_page == null && string_page.equals("")) {//如果在session中存在不存在page，则把page赋值1
            page = 1;
        }else {//存在则读取出来
            page = Integer.parseInt(string_page);
        }
        int pageNum = Page.page(this.userService.findUserNumByCompany(company), PAGE_MAX_NUM);//活动最大页码
        List<User> list = this.userService.findUserByCompany(company, (page-1)*PAGE_MAX_NUM, PAGE_MAX_NUM);//获得记录
        if (list != null) {//判断
            model.addAttribute(company + "_userList", list);//保存
            session.setAttribute(company + "_CURRENT_PAGE", page);
            session.setAttribute(company + "_MAX_PAGE", pageNum);
            return "user_info_list";
        }else {
            return "menu/404";
        }
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
        System.out.println("===================updateStatusById");
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