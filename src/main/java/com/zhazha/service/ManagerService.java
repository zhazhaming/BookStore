package com.zhazha.service;

import com.zhazha.pojo.Manager;
import com.zhazha.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface ManagerService {
    public int addUser(User user);

    public int updateUser(User user);

    public Manager queryUserByName(String username);
    public Manager queryUserByNamePassword(@Param("username") String username, @Param ("password") String password);
}
