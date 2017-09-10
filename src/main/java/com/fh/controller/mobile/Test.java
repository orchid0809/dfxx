package com.fh.controller.mobile;

import java.util.Arrays;

/**
 * Created by orchid0809 on 2017/9/10.
 */
public class Test {

    public static void main(String[] args){
        String phone = "19311,1233";
        String reg = "[\u4e00-\u9fa5]";
        phone  = reg.replaceAll(reg,"");
        phone.replaceAll("[\\pP\\p{Punct}]", "-");
        String phones [] = phone.split("-");
        if(phones != null && phones.length > 0){
            System.out.println(Arrays.toString(phones));
        }
    }
}
