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
import org.springframework.web.bind.annotation.ResponseBody;
import com.hma.resume.dto.Result;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 机构控制层
 */
@Controller
@RequestMapping("/organization")
@Transactional
public class OrganizationController {

    @Autowired
    private InfoService infoService;

    @Autowired
    private UserService userService;

    @Autowired
    private OrganizationService organizationService;

    //regien 增删查改
    @RequestMapping(value = "selectUser", method = RequestMethod.GET)
    public String selectUser() {
        return "organization/show-user";
    }
    /**
     * 根据机构登录信息查询用户列表
     * @return
     */
    @RequestMapping(value = "selectUser", method = RequestMethod.POST)
    public @ResponseBody Object selectUser(HttpSession session, Integer start, Integer limit){
        //获得保存再session中的username
        String username = (String) session.getAttribute("username");
        //根据用户名查询用户信息，获得机构ID
        User user = this.userService.findByUserName(username);
        //根据用户表中的机构ID查询机构信息
        Organization organization = this.organizationService.findOrganizationById(user.getOrganizationID());

        Page page = new Page();
        System.out.println("start初始值" + start);
        //开始的记录index
        page.setStart(start * limit);
        System.out.println("转换后start" + page.getStart());
        //一页大小
        page.setLimit(limit);
        //总页数
        page.setTotal(this.userService.findUserNumByCompanyKey(organization.getOrganizaKey()));

        //获得记录
        List<User> list = this.userService.findUserByCompanyKey(organization.getOrganizaKey(), page.getStart(), page.getLimit());
        page.setRoot(list);

        return page;

    }

    /**
     * 根据用户ID查询用户详情
     * @return
     */
    @RequestMapping(value = "selectInfoByUserId", method = RequestMethod.GET)
    public String selectInfoByUserId(Model model, Integer userId) {
        //根据id查询用户
        User user = this.userService.findById(userId);
        //根据id查询信息列表
        List<Info> infoList = this.infoService.selectInfoByUserId(userId);
        if (user != null && infoList != null){
            //保存数据到model上
            model.addAttribute("userInfo", user);
            model.addAttribute("infoList", infoList);
            return "organization/authentication";
        }else {
            return  "menu/404";
        }
    }

    /**
     * 根据infoID修改状态
     * @return
     */
    @RequestMapping(value = "updateStatusById",method = RequestMethod.POST)
    public @ResponseBody Result updateStatusById(Integer userId, String infoIds, Integer status){
        Result result = this.infoService.updateStatusById(userId,infoIds,status);
        return result;
    }
}
// endregien