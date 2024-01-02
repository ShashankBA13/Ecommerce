package com.ecommerce.base.dao.user;

import com.ecommerce.base.entity.User;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
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

	@Override
	public int save(User user) {
		System.out.println("UserDaoImpl.getInsertMethod");
		Session session=sessionFactory.getCurrentSession();
		System.out.println(user.getId());
		session.save(user);
		System.out.println(user.getId());
		if(user.getId()>0) {
			return 1;
		}
			else {
				return 0;
			}
		}

	@Override
	public boolean checkEmailExist(String emailid) {
		Session session = sessionFactory.getCurrentSession();		
		
		@SuppressWarnings("deprecation")
		Criteria ctr = session.createCriteria(User.class);
		ctr.add(Restrictions.eq("emailId", emailid));
			User u = (User)ctr.uniqueResult();
			
			if(u != null && u.getId() > 0) {
				System.out.println("The email "+ emailid + " exist in the database, pls provide different email id.");
				return true;
			}else {
				return false;
			}

	
	}

	
	
}

	
    



