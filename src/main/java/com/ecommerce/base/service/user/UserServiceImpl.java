package com.ecommerce.base.service.user;

import com.ecommerce.base.dao.user.UserDao;
import com.ecommerce.base.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public List<User> getUserList() {
		return userDao.getUserList();
	}

	@Override
	public String createSignup(User user) {
		System.out.println("this is signup service implementation service method");
		boolean isEmailExist = userDao.checkEmailExist(user.getEmailId());
		if (!isEmailExist) {
			int res = userDao.save(user);
			return String.valueOf(res);

		} else {
			return "your email" + user.getEmailId() + "already exist pls try with differnt emailid";
		}

	}

	@Override
	public boolean checkEmailExist(String emailid) {
		return userDao.checkEmailExist(emailid);
	}
}
