package com.milton.shop.test;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import com.milton.shop.model.Goods;
import com.milton.shop.model.wrapper.GoodsWrapper;
import com.milton.shop.util.Validator;

public class TestReflect {

    public static String getSetter(String fieldName) {
        return "set"+ fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
    }
    
    public static String getGetter(String fieldName) {
        return "get"+ fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
    }

    public static void main(String[] args) {
        try {
            Goods goods = new Goods();
            goods.setGoodsid(1);
            goods.setBrand("1234");
            Class<?> clazz = Class.forName(GoodsWrapper.class.getName()).getSuperclass();
            System.out.println(clazz);
            System.out.println(clazz.getSuperclass() == Object.class);
            Field[] fields = clazz.getDeclaredFields();
            /*if (Validator.isNullEmptyArray(fields)) {
                return;
            }*/

            Method method = clazz.getMethod(getGetter("brand"));
            Object invoke = method.invoke(goods, null);
            System.out.println(invoke);
            /*for (Field field : fields) {
                if (String.class == field.getType()) {
                    Method method = clazz.getMethod(getGetter(field.getName()));
                    System.out.println(method.getName());*/
                    /*Method method = clazz.getMethod(getSetter(field.getName()), String.class);
                    //if (method.getName().equals(set))
                    //method.invoke(goods, "new...")
                    if (method != null && "setBrand".equals(method.getName())) {
                        method.invoke(goods, "new........");
                    }*/
             /*   }
            }*/
            //System.out.println(goods.getBrand());
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
