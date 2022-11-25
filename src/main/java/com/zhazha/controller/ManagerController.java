package com.zhazha.controller;


import com.zhazha.pojo.Manager;
import com.zhazha.pojo.User;
import com.zhazha.service.ManagerService;
import com.zhazha.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    @Qualifier("ManagerServiceImpl")
    private ManagerService managerServiceImpl;

    @RequestMapping("/gologin")
    public String gologin(){
        return "/manager/login";
    }

    @RequestMapping("login")
    public String login(HttpServletRequest req,String username, String password){
        Manager manager = managerServiceImpl.queryUserByNamePassword (username, password);
        if (manager==null){
            req.setAttribute ("msg","管理员名或密码错误");
            req.setAttribute ("username",username);
            System.out.println ("管理员名或密码错误导致登录失败" );
        }else {
            System.out.println ("登录成功" );
            req.getSession().setAttribute ("manager",manager);
            return "/manager/manager";
        }
        return "/manager/login";
    }

    @RequestMapping("logout")
    public String logout(HttpServletRequest req){
        req.getSession ().invalidate ();
        return "redirect:/book/page?action=page&pageNo=1";
    }

    @RequestMapping("/goregist")
    public String goregist(){
        return "/manager/regist";
    }

    @RequestMapping("/regist")
    public String regist(HttpServletRequest req,String username,String password,String email,String code){
        Manager manager = managerServiceImpl.queryUserByName (username);
        if (code!=null&&code.equalsIgnoreCase ("abcd")){
            if (manager!=null){
                req.setAttribute ("msg","该用户已被注册");
                req.setAttribute ("username",username);
                req.setAttribute ("email",email);
                System.out.println ("用户已存在，注册失败" );
            }else {
                managerServiceImpl.addUser (new User (null, username, password, email));
                System.out.println ("注册成功" );
                return "/manager/login";
            }
        }
        return "/manager/regist";
    }

    @RequestMapping("/manager")
    public String manager(HttpServletRequest req){
        System.out.println (req.getSession (  ).getAttribute ("manager") );
        if (req.getSession ().getAttribute ("manager")!=null){
            return "/manager/manager";
        }
        return "/manager/login";
    }
}
