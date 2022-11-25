package com.zhazha.controller;

import com.zhazha.pojo.Car;
import com.zhazha.pojo.Order;
import com.zhazha.pojo.User;
import com.zhazha.service.BookService;
import com.zhazha.service.OrderServiceImpl;
import com.zhazha.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/Order")
public class OrderContorller {

    @Autowired
    @Qualifier("OrderServiceImpl")
    private OrderServiceImpl orderServiceImpl;

    @RequestMapping("/createOrder")
    public String createOrder(HttpServletRequest req){
        Car cart = (Car) req.getSession ( ).getAttribute ("cart");
        User user = (User) req.getSession ( ).getAttribute ("user");
        String orderId = orderServiceImpl.createOrder (cart, user.getId ( ));
        req.getSession ().setAttribute ("orderId",orderId);
        req.getSession ().setAttribute ("Cart",cart);
        return "/cart/checkout";
    }

    @RequestMapping("managerOrder")
    public String managerOrder(HttpServletRequest req){
        User user = (User) req.getSession ( ).getAttribute ("user");
        List<Order> orders = orderServiceImpl.queryOrderByuserId (user.getId ( ));
        for (Order order : orders) {
            Date createTime = order.getCreateTime ( );
        }
        req.setAttribute ("user_order",orders);

        return "/user/order_manager";
    }

}
