package com.zhazha.mapper;

import com.zhazha.pojo.Manager;
import com.zhazha.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface Managermapper {
    //    增加用户
    public int addUser(User user);
    //    修改用户
    public int updateUser(User user);
    //    查询用户
    public Manager queryUserByName(String username);
    public Manager queryUserByNamePassword(@Param("username") String username, @Param ("password") String password);
}
