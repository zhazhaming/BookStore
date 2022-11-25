package com.zhazha.controller;

import com.zhazha.pojo.Book;
import com.zhazha.pojo.Car;
import com.zhazha.pojo.Car_item;
import com.zhazha.pojo.User;
import com.zhazha.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/car")
public class CarController {

    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookServiceImpl;

    @RequestMapping("/goaddCar")
    public String goaddCar(HttpServletRequest req){
        return "/cart/cart";
    }

    @RequestMapping("/addCar")
    public String addCar(HttpServletRequest req ,int id,int pageNo){
        User user = (User) req.getSession ().getAttribute ("user");
        if (user == null){
            return "/user/login";
        }
        Book book = bookServiceImpl.queryBookById (id);
        Car_item car_item = new Car_item ( id,book.getName (),book.getPrice (),book.getPrice (),1 );
        Car cart = (Car) req.getSession ().getAttribute ("cart");
        if (cart==null){
            cart = new Car (  );
            req.getSession ().setAttribute ("cart",cart);
        }
        cart.addItem (car_item);
        System.out.println (cart );
        req.getSession ().setAttribute ("lastName",car_item.getName ());
        String ur = "redirect:/book/page?pageNo=%d";
        String url = String.format (ur,pageNo);
        return url;
    }
    @RequestMapping("/deleteCar")
    public String deleteCar(HttpServletRequest req ,int id){
        Car car = (Car) req.getSession ().getAttribute ("cart");
        car.deleteItem (id);
        return "/cart/cart";
    }
    @RequestMapping("/clearCar")
    public String clearCar(HttpServletRequest req ){
        Car car = (Car) req.getSession ().getAttribute ("cart");
        car.clear ();
        return "/cart/cart";
    }
}
