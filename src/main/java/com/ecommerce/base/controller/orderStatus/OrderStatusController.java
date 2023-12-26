package com.ecommerce.base.controller.orderStatus;

import com.ecommerce.base.entity.OrderStatus;
import com.ecommerce.base.service.orderStatus.OrderStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "orderStatus")
public class OrderStatusController {

    @Autowired
    private OrderStatusService orderStatusService;

    @PostMapping(value = "save")
    public String saveOrderStatus(OrderStatus orderStatus, Model model) {
        System.out.println("OrderStatus: " + orderStatus);
        orderStatusService.insertOrderStatus(orderStatus);
        return "listUser";
    }
}
