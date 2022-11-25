package com.zhazha.mapper;

import com.zhazha.pojo.User;
import jdk.internal.org.objectweb.asm.tree.analysis.Value;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UsermapperTest {
    ApplicationContext context = new ClassPathXmlApplicationContext ("applicationContext.xml" );
    @Test
    public void addUser(){
        User user = new User ( 18,"zzm222","zzm222","zzm222@qq.com" );
        Usermapper bean = context.getBean (Usermapper.class);
        bean.addUser (user);
    }

    @Test
    public void updateUser(){
        User user = new User ( 18,"zjm123","zjm123","zjm123@qq.com" );
        Usermapper bean = context.getBean (Usermapper.class);
        bean.updateUser (user);
    }

    @Test
    public void queryUserByName(){
        String name = "zzm123";
        Usermapper bean = context.getBean (Usermapper.class);
        User user = bean.queryUserByName (name);
        System.out.println (user);
    }

    @Test
    public void queryUserByNamePassword(){
        String username = "zzm123";
        String password = "zzm123";
        Usermapper bean = context.getBean (Usermapper.class);
        User user = bean.queryUserByNamePassword (username, password);
        System.out.println (user);
    }
}
