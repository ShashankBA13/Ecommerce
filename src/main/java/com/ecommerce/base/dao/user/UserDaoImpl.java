package com.ecommerce.base.dao.user;

import com.ecommerce.base.entity.user.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class UserDaoImpl implements UserDao{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<User> getUserList() {
        System.out.println("UserDaoImpl.getUserList");
        Session session = sessionFactory.getCurrentSession();
        List<User> userList = session.createQuery(" FROM User").list();
        return userList;
    }
}
