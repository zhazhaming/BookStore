package com.zhazha.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Car {
    private Integer totalcount;
    private BigDecimal totalprice;
    private Map<Integer,Car_item> items = new LinkedHashMap<Integer, Car_item> (  );

    //添加进购物车
    public void addItem(Car_item car_item){
        Car_item item = items.get (car_item.getId ());
        if (item==null){
            items.put (car_item.getId (),car_item);
        }else {
            item.setCount (item.getCount ()+1);
            item.setTotal_price (item.getPrice ().multiply (new BigDecimal (item.getCount ())));
        }
    }
    //删除购物车中一项
    public void deleteItem(int id ){
        items.remove ((id));
    }
    //清除购物车
    public void clear(){
        items.clear ();
    }
    //更新数量
    public void updatacount(Integer id, Integer count){
        Car_item item = items.get (id);
        if (item!=null){
            item.setCount (count);
            item.setTotal_price (item.getPrice ().multiply (new BigDecimal (item.getCount ())));
        }
    }
    // 获取所有书本数量
    public Integer getTotalcount() {
        Integer totalcount  = 0;
        for (Map.Entry<Integer,Car_item>entry:items.entrySet ()){
            totalcount += entry.getValue ().getCount ();
        }
        return totalcount;
    }
    //获取所有书本价格
    public BigDecimal getTotalprice() {
        BigDecimal totalprice = new BigDecimal (0);
        for (Map.Entry<Integer,Car_item>entry:items.entrySet ()){
            totalprice = totalprice.add(entry.getValue ( ).getTotal_price ());
        }
        return totalprice;
    }
}
