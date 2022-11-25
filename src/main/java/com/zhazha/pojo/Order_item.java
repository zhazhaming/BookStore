package com.zhazha.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order_item {
    private Integer id;
    private String name;
    private Integer count;
    private BigDecimal price;
    private BigDecimal total_price;
    private String orderId;
}
