package com.zhazha.mapper;

import com.zhazha.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface Usermapper {

//    增加用户
    public int addUser(User user);
//    修改用户
    public int updateUser(User user);
//    查询用户
    public User queryUserByName(String username);
    public User queryUserByNamePassword(@Param ("username") String username, @Param ("password") String password);

}
