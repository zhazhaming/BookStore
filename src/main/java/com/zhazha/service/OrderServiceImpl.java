package com.zhazha.service;

import com.zhazha.mapper.Bookmapper;
import com.zhazha.mapper.Ordermapper;
import com.zhazha.pojo.*;

import java.util.Date;
import java.util.List;
import java.util.Map;


public class OrderServiceImpl implements OrderService{

    private Ordermapper ordermapper;
    private Bookmapper bookmapper;

    public void setBookmapper(Bookmapper bookmapper) {
        this.bookmapper = bookmapper;
    }

    public void setOrdermapper(Ordermapper ordermapper) {
        this.ordermapper = ordermapper;
    }

    public String createOrder(Car car, Integer userId) {
        String orderId = System.currentTimeMillis ()+""+userId;
        Order order = new Order(orderId,new Date (),car.getTotalprice(), 0,userId);
        ordermapper.addOrder (order);
        for(Map.Entry<Integer, Car_item> entry:car.getItems ().entrySet ()){
            Car_item car_item = entry.getValue ();
            Order_item order_item = new Order_item ( null, car_item.getName (),car_item.getCount (),car_item.getPrice (),car_item.getTotal_price (),orderId);
            ordermapper.addOrderItem (order_item);

            Book book =bookmapper.queryBookById (car_item.getId ());
            book.setStock (book.getStock ()-car_item.getCount ());
            book.setSales (book.getSales ()+car_item.getCount ());
            bookmapper.updateBook (book);
        }
        car.clear ();
        return orderId;
    }

    public int addOrder(Order order) {
        return ordermapper.addOrder (order);
    }

    public List<Order> queryOrderByuserId(int userId) {
        return ordermapper.queryOrderByuserId (userId);
    }

    public List<Order> queryOrder() {
        return ordermapper.queryOrder ();
    }

    public int updateOrderByUserId(String orderId, Integer status) {
        return ordermapper.updateOrderByUserId (orderId,status);
    }

    public int addOrderItem(Order_item order_item) {
        return ordermapper.addOrderItem (order_item);
    }

    public List<Order_item> queryOrderItemByOrderId(String orderId) {
        return ordermapper.queryOrderItemByOrderId (orderId);
    }
}
