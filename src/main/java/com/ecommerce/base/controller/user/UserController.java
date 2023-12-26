package com.ecommerce.base.controller.user;

import com.ecommerce.base.entity.User;
import com.ecommerce.base.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping(value = "/listUsers")
    public String showUsers(Model model) {
        System.out.println("UserController.showUsers");
        List<User> userList = userService.getUserList();
        System.out.println(userList);
        model.addAttribute("userList", userList);
        return "/views/listUser.jsp";
    }
}
