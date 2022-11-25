package com.zhazha.mapper;

import com.zhazha.pojo.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface Bookmapper {

    //查询所有书籍
    public List<Book> queryAllBook(Map<String, Integer> map);
    public Book queryBookById(int id);
    //增加图书
    public int addBook(Book book);
    //删除图书
    public int deleteBookById(int id);
    //修改图书
    public int updateBook(Book book);
    //查询所有图书数量
    public int countBook();
    //查询价格区间图书数量
    public int countBookByMoney(@Param ("min") int min, @Param ("max") int max);
    //查询价格区间图书
    public List<Book> queryBookByMoney(@Param ("min") int min, @Param ("max") int max,@Param ("currPage") int currPage,@Param ("pageSize") int pageSize);
    //查询图书图片地址
    public String queryBookImg(int id);
}
