package com.zhazha.service;

import com.zhazha.mapper.Bookmapper;
import com.zhazha.pojo.Book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BookServiceImpl implements BookService{

    private Bookmapper bookmapper ;

    public void setBookmapper(Bookmapper bookmapper) {
        this.bookmapper = bookmapper;
    }

    public List<Book> queryAllBook(int currPage, int pageSize) {
        Map<String,Integer> map = new HashMap<String, Integer> (  );
        map.put ("currIndex",(currPage-1)*pageSize);
        map.put ("pageSize",pageSize);
        return bookmapper.queryAllBook (map);
    }

    public Book queryBookById(int id) {
        return bookmapper.queryBookById (id);
    }

    public int addBook(Book book) {
        return bookmapper.addBook (book);
    }

    public int deleteBookById(int id) {
        return bookmapper.deleteBookById (id);
    }

    public int updateBook(Book book) {
        return bookmapper.updateBook (book);
    }

    public int countBook() {
        return bookmapper.countBook ();
    }


    public List<Book> queryBookByMoney(int min, int max,int currPage,int pageSize) {
        return bookmapper.queryBookByMoney (min, max,currPage,pageSize);
    }

    public int countBookByMoney(int min, int max) {
        return bookmapper.countBookByMoney (min, max);
    }

    public String queryBookImg(int id) {
        return bookmapper.queryBookImg (id);
    }
}
