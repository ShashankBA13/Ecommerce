package com.ecommerce.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

    @RequestMapping(value = "test")
    public String test() {
        return "sayHello";
    }

    @PostMapping(value = "customMessage")
    public String customMessage(Model model) {
        System.out.println("TestController.customMessage");
        model.addAttribute("customMessage", "Here is your custom message");
        return "sayHello";
    }
}