package com.zhazha.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Car_item {
    private Integer id;
    private String name;
    private BigDecimal price;
    private BigDecimal total_price;
    private Integer count;
}
