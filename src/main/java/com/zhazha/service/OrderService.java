package com.zhazha.service;

import com.zhazha.pojo.Car;
import com.zhazha.pojo.Order;
import com.zhazha.pojo.Order_item;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderService {
    public String  createOrder(Car car,Integer userId);

    public int addOrder(Order order);

    //针对用户端
    public List<Order> queryOrderByuserId(int userId);

    //针对管理端
    public List<Order> queryOrder();

    public int updateOrderByUserId(@Param("orderId") String orderId, @Param ("status") Integer status);

    public int addOrderItem(Order_item order_item);

    public List<Order_item> queryOrderItemByOrderId(String orderId);
}
