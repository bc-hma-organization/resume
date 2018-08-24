package com.hma.resume.controller;

import com.hma.resume.domain.Info;
import com.hma.resume.domain.User;
import com.hma.resume.service.InfoService;
import com.hma.resume.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
@RequestMapping("/")
@Transactional
public class OrganizationController {

    @Autowired
    private InfoService infoService;
//regien 增删查改


    /**
     * 根据单位查询用户信息
     * @return
     */
    @RequestMapping(value = "selectInfoByCompany")
    public String selectInfoByCompany(){
        System.out.println("selectInfoByCompany");
        List<User> list = this.infoService.selectInfoByCompany("XX学校");
        for (int i = 0; i < list.size(); i++) {
            System.out.println("-----------------------"+list.get(i));
        }
        return "";
    }

    /**
     * 根据用户ID查询用户详情
     * @return
     */
    @RequestMapping(value = "selectInfoByUserId")
    public  String selectInfoByUserId(){
        List<Object> list = this.infoService.selectInfoByUserId(2);
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }

        int t = Page.page(23,10);
        return "";
    }
}
// endregien