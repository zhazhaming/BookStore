package com.zhazha.controller;

import com.zhazha.pojo.Book;
import com.zhazha.service.BookService;
import com.zhazha.service.UserService;
import com.zhazha.service.UserServiceImpl;
import com.zhazha.utils.WebUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    int pageSize = 4;
    int pageTotal = 0;
    int bookTotal = 0;

    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookServiceImpl;

    //首页分页实现
    @RequestMapping("/page")
    public String queryallbook(HttpServletRequest req,@Param ("pageNo") int pageNo){
        StringBuilder sb = new StringBuilder ( "/book/page?action=page");
        bookTotal = bookServiceImpl.countBook ( );
        if (bookTotal%pageSize!=0){
            pageTotal = bookTotal/pageSize+1;
        }else{
            pageTotal = bookTotal/pageSize;
        }
        List<Book> books = bookServiceImpl.queryAllBook (pageNo, pageSize);
        req.setAttribute ("url",sb);
        req.setAttribute ("book",books);
        req.setAttribute ("pageNo",pageNo);
        req.setAttribute ("pageTotal",pageTotal);
        req.setAttribute ("pageTotalCount",bookTotal);
        return "client/index";
    }
    //管理员分页实现
    @RequestMapping("/managerpage")
    public String managerqueryallBook(HttpServletRequest req,@Param ("pageNo") int pageNo){
        StringBuilder sb = new StringBuilder ( "/book/managerpage?action=page");
        bookTotal = bookServiceImpl.countBook ( );
        if (bookTotal%pageSize!=0){
            pageTotal = bookTotal/pageSize+1;
        }else {
            pageTotal = bookTotal/pageSize;
        }
        List<Book> books = bookServiceImpl.queryAllBook (pageNo, pageSize);
        req.setAttribute ("url",sb);
        req.setAttribute ("book",books);
        req.setAttribute ("pageNo",pageNo);
        req.setAttribute ("pageTotal",pageTotal);
        req.setAttribute ("pageTotalCount",bookTotal);
        return "/manager/book_manager";
    }
    //查询价格区间分页实现
    @RequestMapping("/querybookByMoney")
    public String querybookByMoney(HttpServletRequest req,int pageNo){
        String min = req.getParameter ("min");
        String max = req.getParameter ("max");
        int min_price = Integer.parseInt (min);
        int max_price = Integer.parseInt (max);
        String sb =  "/book/querybookByMoney?action=querybookByMoney&min=%d&max=%d";
        String url = String.format (sb,min_price,max_price);
        List<Book> books = bookServiceImpl.queryBookByMoney (min_price, max_price,pageNo,pageSize);
        int BookCount = bookServiceImpl.countBookByMoney (min_price,max_price);
        if (BookCount%pageSize!=0){
            pageTotal = BookCount/pageSize+1;
        }else {
            pageTotal = BookCount/pageSize;
        }
        req.setAttribute ("url",url);
        req.setAttribute ("book",books);
        req.setAttribute ("pageNo",pageNo);
        req.setAttribute ("pageTotal",pageTotal);
        req.setAttribute ("pageTotalCount",BookCount);
        return "client/index";
    }
    //管理员删除图书实现
    @RequestMapping("/deleteBook")
    public String deletebook(HttpServletRequest req,int id,int pageNo){
        bookServiceImpl.deleteBookById (id);
        String ur = "redirect:/book/managerpage?pageNo=%d";
        String url = String.format (ur,pageNo);
        return url;
    }
    //管理员添加去图书
    @RequestMapping("/goaddBook")
    public String goaddBook(HttpServletRequest req,int pageNo){
        String action = "addBook";
        req.setAttribute ("action",action);
        req.setAttribute ("pageNo",pageNo);
        return "/manager/book_edit";
    }
    //管理员添加图书
    @RequestMapping("/addBook")
    public String addBook(int pageNo, String name, BigDecimal price,String author,int sales,int stock){
        String img_path = "stactic/img/default.jpg";
        bookServiceImpl.addBook (new Book ( null,name,price,author,sales,stock,img_path ));
        String ur = "redirect:/book/managerpage?action=page&pageNo=%d";
        String url = String.format (ur,pageNo);
        return url;
    }
    //管理员去更新图书
    @RequestMapping("/goupdateBook")
    public String goupdate(HttpServletRequest req, int pageNo,int id){
        String action = "updateBook";
        req.setAttribute ("action",action);
        req.setAttribute ("book_id",id);
        req.setAttribute ("pageNo",pageNo);
        return "/manager/book_edit";
    }
    //管理员修改图书实现
    @RequestMapping("/updateBook")
    public String updatebook(int pageNo, int id, String name, BigDecimal price,String author,int sales,int stock){
        String img_path = bookServiceImpl.queryBookImg (id);
        bookServiceImpl.updateBook (new Book ( id,name,price,author,sales,stock,img_path ));
        String ur = "redirect:/book/managerpage?action=page&pageNo=%d";
        String url = String.format (ur,pageNo);
        return url;
    }

}
