package com.zhazha.mapper;

import com.sun.org.apache.xpath.internal.operations.Or;
import com.zhazha.pojo.Order;
import com.zhazha.pojo.Order_item;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class OrdermapperTest {
    ApplicationContext context = new ClassPathXmlApplicationContext ("applicationContext.xml" );

    @Test
    public void addOrder(){
        Integer userId = 17;
        String orderId = System.currentTimeMillis ()+""+userId;
        Order order = new Order(orderId,new Date (),new BigDecimal (123), 0,userId);
        Ordermapper bean = context.getBean (Ordermapper.class);
        bean.addOrder (order);
    }

    @Test
    public void queryOrderByuserId(){
        Ordermapper bean = context.getBean (Ordermapper.class);
        List<Order> orders = bean.queryOrderByuserId (13);
        for (Order order : orders) {
            System.out.println (order );
        }
    }

    @Test
    public void queryOrder(){
        Ordermapper bean = context.getBean (Ordermapper.class);
        List<Order> orders = bean.queryOrder ( );
        for (Order order : orders) {
            System.out.println (order);
        }
    }

    @Test
    public void updateOrderByUserId(){
        Ordermapper bean = context.getBean (Ordermapper.class);
        bean.updateOrderByUserId ("166365838494917", 1);
    }

    @Test
    public void queryOrderItemByOrderId(){
        Ordermapper bean = context.getBean (Ordermapper.class);
        List<Order_item> order_items = bean.queryOrderItemByOrderId ("166365838494917");
        for (Order_item order_item : order_items) {
            System.out.println (order_item);
        }
    }
    @Test
    public void  addOrderItem(){
        Order_item order_item = new Order_item ( 20,"python3",1,new BigDecimal (123),new BigDecimal (123),"166372982145217" );
        Ordermapper bean = context.getBean (Ordermapper.class);
        bean.addOrderItem (order_item);
    }
}
