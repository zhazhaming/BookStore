package com.zhazha.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class WebUtils {

    public static int paraseInt(String strInt,int defaultValue){
        try {
            if (strInt!=null) {
                return Integer.parseInt (strInt);
            }
        } catch (Exception e) {
            e.printStackTrace ( );
        }
        return defaultValue;
    }

    public static String checkDate(Date str){
        String format1 = null;
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            format1 = format.format(str);
        } catch (Exception e) {
           e.printStackTrace ();
        }
        return format1;
    }

}
