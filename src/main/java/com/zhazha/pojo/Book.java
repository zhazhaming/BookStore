package com.zhazha.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Book {

    private Integer id;
    private String name;
    private BigDecimal price;
    private String author;
    private Integer sales;
    private Integer stock;
    private String img_path = "stactic/img/default.jpg";
}
