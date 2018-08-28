package com.hma.resume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/info")
@Transactional
public class InfoController {

    @RequestMapping(value = "testJSP")
    public String testJSP(){
        return "talent-register";
    }

}
