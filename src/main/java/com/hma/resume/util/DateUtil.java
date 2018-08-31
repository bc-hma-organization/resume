package com.hma.resume.util;

import java.util.Date;
import java.text.SimpleDateFormat;

/**
 * 日期工具类
 * Created by gun on 2018/8/31.
 */
public class DateUtil {

    /**
     * 根据规则转化时间
     * @param date
     * @param rule yyyy-MM-dd
     * @return
     */
    public static String format(Date date, String rule){
        if(null!=date){
            SimpleDateFormat format = new SimpleDateFormat(rule);
            return format.format(date);
        }
        return "";
    }

    /**
     * utilDate转为sqlDate
     * @param date
     * @return
     */
    public static java.sql.Date utilDateToSql(Date date){
        java.sql.Date target = new java.sql.Date(date.getTime());
        return target;
    }
}
