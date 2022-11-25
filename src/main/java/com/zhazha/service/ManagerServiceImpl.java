package com.zhazha.service;

import com.zhazha.mapper.Managermapper;
import com.zhazha.pojo.Manager;
import com.zhazha.pojo.User;

public class ManagerServiceImpl implements ManagerService{

    private Managermapper managermapper;

    public void setManagermapper(Managermapper managermapper) {
        this.managermapper = managermapper;
    }

    public int addUser(User user) {
        return managermapper.addUser (user);
    }

    public int updateUser(User user) {
        return managermapper.updateUser (user);
    }

    public Manager queryUserByName(String username) {
        return managermapper.queryUserByName (username);
    }

    public Manager queryUserByNamePassword(String username, String password) {
        return managermapper.queryUserByNamePassword (username,password);
    }
}
