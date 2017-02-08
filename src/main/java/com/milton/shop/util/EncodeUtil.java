package com.milton.shop.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

public class EncodeUtil {

    public static String htmlEncode(String txt) {
        if (txt != null || !"".equals(txt)) {
            txt = txt.replace("&", "&amp;");
            txt = txt.replace("&amp;amp;", "&amp;");
            txt = txt.replace("&amp;quot;", "&quot;");
            txt = txt.replace("\"", "&quot;");
            txt = txt.replace("&amp;lt;", "&lt;");
            txt = txt.replace("<", "&lt;");
            txt = txt.replace("&amp;gt;", "&gt;");
            txt = txt.replace(">", "&gt;");
            txt = txt.replace("&amp;nbsp;", "&nbsp;");
        }
        return txt;
    }
    
    public static String getSetter(String fieldName) {
        return "set"+ fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
    }

    public static String getGetter(String fieldName) {
        return "get"+ fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
    }

    public static void encode(Object object) {
        Class<?> clazz = null;
        try {
            clazz = Class.forName(object.getClass().getName());
            while (Object.class != clazz) {
                Field[] fields = clazz.getDeclaredFields();
                if (Validator.isNullEmptyArray(fields)) {
                    return;
                }

                for (Field field : fields) {
                    if (String.class == field.getType()) {
                        Method getMethod = clazz.getMethod(getGetter(field.getName()));
                        Method setMethod = clazz.getMethod(getSetter(field.getName()), String.class);
                        if (getMethod != null && setMethod != null) {
                            String originValue = (String) getMethod.invoke(object, null);
                            if (originValue != null) {
                                setMethod.invoke(object, htmlEncode(originValue));
                            }
                        }
                    }
                }

                clazz = clazz.getSuperclass();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void encodeList(List<?> list) {
        for (Object object : list) {
            encode(object);
        }
    }
}
