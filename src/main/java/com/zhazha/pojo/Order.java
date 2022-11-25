package com.zhazha.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private String orderId;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createTime;

    private BigDecimal price;

    //0 代表为发货，1代表发货 2代表已经签收
    private Integer status=0;

    private  Integer userId;

}
