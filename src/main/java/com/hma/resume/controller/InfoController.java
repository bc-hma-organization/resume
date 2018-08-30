package com.hma.resume.controller;

import com.hma.resume.domain.Info;
import com.hma.resume.domain.User;
import com.hma.resume.dto.Result;
import com.hma.resume.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/info")
@Transactional
@SessionAttributes("username")
public class InfoController {

    @Autowired
    private InfoService infoService;

    @RequestMapping(value = "testJSP")
    public String testJSP(){
        return "organization/show-user";
    }

    /**
     * 显示人才上传信息页面
     * @return
     */
    @RequestMapping(value = "upload-info", method = RequestMethod.GET)
    public String uploadInfo(Model model, HttpSession session){
        User user = this.infoService.getCurrentUser(session);
        model.addAttribute("user", user);
        model.addAttribute("info", this.infoService.selectInfoByUserId(user.getId()));
        model.addAttribute("type", "show");
        return "info/uploadInfo";
    }

    /**
     * 上传人才信息
     * @param info
     * @param session
     * @return
     */
    @RequestMapping(value = "upload-info", method = RequestMethod.POST)
    public @ResponseBody Result uploadInfoPost(Info info, HttpSession session){
        Result result = this.infoService.saveInfo(info, session);
        return result;
    }
}
