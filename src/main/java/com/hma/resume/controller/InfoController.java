package com.hma.resume.controller;

import com.hma.resume.domain.Info;
import com.hma.resume.domain.User;
import com.hma.resume.dto.Result;
import com.hma.resume.service.InfoService;
import com.hma.resume.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/info")
@Transactional
@SessionAttributes("username")
public class InfoController {

    @Autowired
    private InfoService infoService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "testJSP")
    public String testJSP(){
        return "menu/modify-information";
    }

    /**
     * 显示人才上传信息页面
     * @return
     */
    @RequestMapping(value = "upload-info", method = RequestMethod.GET)
    public String uploadInfo(Model model, HttpSession session){
        User user = this.infoService.getCurrentUser(session);
        model.addAttribute("user", user);
        List<Info> infoList = this.infoService.selectInfoByUserId(user.getId());
        model.addAttribute("study_info", this.infoService.separateStudy(infoList));
        model.addAttribute("work_info", this.infoService.separateWork(infoList));
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

    @RequestMapping(value = "show-chainInfo", method = RequestMethod.GET)
    public String showChainInfo(Model model, HttpSession session){
        //根据session获取当前登录用户
        User user = this.userService.findByUserName(session.getAttribute("username").toString());
        Map map= this.infoService.getChainDataToPOJO(user);
        if(map.size() == 0){
            model.addAttribute("tips", "尚无数据上链");
        }else{
            model.addAttribute("tips", null);
            model.addAttribute("userInfo", map.get("user"));
            model.addAttribute("infoList", map.get("info"));
        }
        return "info/showChainInfo";
    }
}
