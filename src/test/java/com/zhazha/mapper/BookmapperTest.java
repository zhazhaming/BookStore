package com.zhazha.mapper;

import com.zhazha.pojo.Book;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

public class BookmapperTest {
    ApplicationContext context = new ClassPathXmlApplicationContext ("applicationContext.xml" );
    Bookmapper bean = context.getBean (Bookmapper.class);

    @Test
    public void queryAllBook(){
        HashMap<String ,Integer> map = new HashMap<String, Integer> (  );
        map.put ("currIndex",16);
        map.put ("pageSize",4);
        List<Book> books = bean.queryAllBook (map);
        for (Book book : books) {
            System.out.println (book);
        }
    }

    @Test
    public void queryBook(){
        Book book = bean.queryBookById (1);
        System.out.println (book);
    }

    @Test
    public void addBook(){
        Book book = new Book ( null,"python入门",new BigDecimal (123),"渣渣",200,500,null);
        bean.addBook (book);
    }

    @Test
    public void deleteBookById(){
        bean.deleteBookById (64);
    }

    @Test
    public void update(){
        Book book = new Book ( 70,"python入门",new BigDecimal (123) ,"渣渣",200,500,"static/img/default.jpg");
        bean.updateBook (book);
    }

    @Test
    public void count(){
        int i = bean.countBook ( );
        System.out.println (i);
    }

    @Test
    public void queryBookByMoney(){
        List<Book> books = bean.queryBookByMoney (10, 100,0,4);
        for (Book book : books) {
            System.out.println (book);
        }
    }

    @Test
    public void countBookByMoney(){
        int i = bean.countBookByMoney (10, 100);
        System.out.println (i );
    }

    @Test
    public void queryBookImg(){
        String s = bean.queryBookImg (70);
        System.out.println (s);
    }
}
