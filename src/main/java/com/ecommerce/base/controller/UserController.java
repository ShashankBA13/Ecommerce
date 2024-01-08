package com.ecommerce.base.controller;

import com.ecommerce.base.entity.User;
import com.ecommerce.base.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		return "listUser";
	}

	@PostMapping(value = "/signup")
	public String SignUp(User user, Model model) {
		System.out.println("iam in signup controller");
		System.out.println(user);
		String res = userService.createSignup(user);
		if (res != null && res.equals("1")) {
			return "login";
		} else if (res != null && res.equals("0")) {
			return "signupfailure";
		} else {
			model.addAttribute("email exist msg", res);
			return "signupfailure";
		}
	}

	@GetMapping(value = "/login")
	public String login() {
		return "login";
	}

	@PostMapping(value = "/login")
	public String login(User user, Model model) {

		System.out.println("user = " + user);
		String result = userService.login(user);

		if(result.equals("Login Success")) {
			System.out.println("Inside the success block");
			return "redirect:/home/";
		} else {
			model.addAttribute("failureMessage", "Something happened at our end");
			return "login";
		}
	}

}
