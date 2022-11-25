package com.zhazha.service;

import com.zhazha.mapper.Usermapper;
import com.zhazha.pojo.User;
import com.zhazha.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    private Usermapper usermapper;

    public void setUsermapper(Usermapper usermapper) {
        this.usermapper = usermapper;
    }

    public int addUser(User user) {

        return usermapper.addUser (user);
    }

    public int updateUser(User user) {
        return usermapper.updateUser (user);
    }

    public User queryUserByName(String username) {
        return usermapper.queryUserByName (username);
    }

    public User queryUserByNamePassword(String username, String password) {
        return usermapper.queryUserByNamePassword (username,password);
    }
}
