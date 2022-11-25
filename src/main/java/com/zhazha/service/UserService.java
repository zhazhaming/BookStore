package com.zhazha.service;

import com.zhazha.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserService {

    public int addUser(User user);

    public int updateUser(User user);

    public User queryUserByName(String username);
    public User queryUserByNamePassword(@Param("username") String username, @Param ("password") String password);

}
