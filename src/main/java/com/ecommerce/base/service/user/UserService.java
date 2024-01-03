package com.ecommerce.base.service.user;

import com.ecommerce.base.entity.User;

import java.util.List;

public interface UserService {

	public List<User> getUserList();

	public boolean checkEmailExist(String emailid);

	public String createSignup(User user);

	public String login(User user);

}
