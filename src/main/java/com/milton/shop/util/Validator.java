package com.milton.shop.util;

import java.util.Collection;
import java.util.Map;

public class Validator {

    public static boolean isNull(Object param) {
        if (param == null) {
            return true;
        }
        return false;
    }

    public static boolean isNullEmptyString(String param) {
        if (param == null || param.trim().length() == 0) {
            return true;
        }
        return false;
    }

    public static boolean isNullEmptyArray(Object[] param) {
        if (param == null || param.length == 0) {
            return true;
        }
        return false;
    }

    public static boolean isNullEmptyCollection(Collection<?> param) {
        if (param == null || param.size() == 0) {
            return true;
        }
        return false;
    }

    public static boolean isNullEmptyMap(Map<Object, Object> param) {
        if (param == null || param.isEmpty()) {
            return true;
        }
        return false;
    }

    public static boolean isNumber(String param) {
        try {
            Integer.parseInt(param);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public static boolean isPositiveNumber(String param) {
        boolean success =false;
        try{
            if (Integer.parseInt(param) > 0) {
                success= true;
            }
        } catch (Exception e) {
        }
        return success;
    }
}
