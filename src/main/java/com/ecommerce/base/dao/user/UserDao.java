package com.ecommerce.base.dao.user;

import com.ecommerce.base.entity.User;

import java.util.List;

public interface UserDao {

	public List<User> getUserList();

	public boolean checkEmailExist(String emailid);

	public int save(User user);

}
