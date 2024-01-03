package com.ecommerce.base.service.orderStatus;

import com.ecommerce.base.dao.orderStatus.OrderStatusDao;
import com.ecommerce.base.entity.OrderStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderStatusServiceImpl implements OrderStatusService {

	@Autowired
	private OrderStatusDao orderStatusDao;

	@Override
	public void insertOrderStatus(OrderStatus orderStatus) {
		orderStatusDao.insertOrderStatus(orderStatus);
	}
}
