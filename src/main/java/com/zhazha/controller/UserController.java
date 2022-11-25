package com.zhazha.controller;

import com.zhazha.pojo.User;
import com.zhazha.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userServiceImpl;

    //跳转登录
    @RequestMapping("/gologin")
    public String gologin(){
        return "/user/login";
    }
    //实现登录
    @RequestMapping("/login")
    public String login(HttpServletRequest req,HttpServletRequest resp, Model model, String username, String password){
        User user = userServiceImpl.queryUserByNamePassword (username, password);
        if (user==null){
            req.setAttribute ("msg","用户名或密码错误");
            req.setAttribute ("username",username);
            System.out.println ("用户名或密码错误导致登录失败" );
        }else {
            System.out.println ("登录成功" );
            req.getSession().setAttribute ("user",user);
            return "/user/login_success";
        }
        return "/user/login";
    }

    @RequestMapping("logout")
    public String logout(HttpServletRequest req){
        req.getSession ().invalidate ();
        return "redirect:/book/page?action=page&pageNo=1";
    }

    //跳转注册
    @RequestMapping("/goregist")
    public String goregist(){
        return "/user/regist";
    }

    //实现注册
    @RequestMapping("/regist")
    public String regist(HttpServletRequest req,String username,String password,String email,String code){
        User user = userServiceImpl.queryUserByName (username);
        //获取验证码
//        String tooken = (String) req.getSession ( ).getAttribute (KAPTCHA_SESSION_KEY);
        System.out.println (code );
        if (code!=null&&code.equalsIgnoreCase ("abcd")){
            if (user!=null){
                req.setAttribute ("msg","该用户已被注册");
                req.setAttribute ("username",username);
                req.setAttribute ("email",email);
                System.out.println ("用户已存在，注册失败" );
            }else {
                userServiceImpl.addUser (new User (null, username, password, email));
                System.out.println ("注册成功" );
                return "/user/login";
            }
        }
        return "/user/regist";
    }
}
