package com.milton.shop.util;

import com.milton.shop.constants.Constants;

public class ParamUtil {

    public static Integer getInteger(String param) {
        if (Validator.isNullEmptyString(param)) {
            return 0;
        }
        param = param.trim();
        if (!Validator.isNumber(param)) {
            return 0;
        }

        return Integer.parseInt(param);
    }

    public static Integer getInteger(String param, Integer defaultValue) {
        if (Validator.isNullEmptyString(param)) {
            return defaultValue;
        }
        param = param.trim();
        if (!Validator.isNumber(param)) {
            return defaultValue;
        }

        return Integer.parseInt(param);
    }

    public static String getString (String param) {
        if (Validator.isNullEmptyString(param)) {
            return Constants.BLANK;
        }
        return param.trim();
    }

    public static String getString (String param, String initValue) {
        if (Validator.isNullEmptyString(param)) {
            return initValue;
        }
        return param.trim();
    }
}
