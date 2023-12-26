package com.ecommerce.base.dao.orderStatus;

import com.ecommerce.base.entity.OrderStatus;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class OrderStatusDaoImpl implements OrderStatusDao{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void insertOrderStatus(OrderStatus orderStatus) {
        Session session = sessionFactory.getCurrentSession();
        session.save(orderStatus);
    }
}
