package com.ecommerce.base.dao.orderStatus;

import com.ecommerce.base.entity.OrderStatus;
import org.hibernate.criterion.Order;

public interface OrderStatusDao {

	public void insertOrderStatus(OrderStatus orderStatus);
}
