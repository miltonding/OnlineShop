package com.milton.shop.util;

import com.milton.shop.constants.Constants;

public class StringUtil {

  //Deal with '%', '\', '_', '\%', '''
    public static String dealSpecial(String keyword) {
        if (Validator.isNullEmptyString(keyword)) {
            return Constants.BLANK;
        }

        StringBuffer stringBuffer = new StringBuffer();
        char[] keyArray = keyword.toCharArray();
        for (char key: keyArray) {
            String perKey = String.valueOf(key);
            if (perKey.equals("\\")) {
                perKey = "\\\\";
            }
            if (perKey.equals("%")) {
                perKey = "\\%";
            }
            if (perKey.equals("_")) {
                perKey = "\\_";
            }
            stringBuffer.append(perKey);
        }
        return stringBuffer.toString();
    }

    public static String simpfy(String information, int front, int end) {
        StringBuffer shortMessage = new StringBuffer();
        if (Validator.isNullEmptyString(information)) {
            return information;
        }

        int remain = information.length() - (front + end);
        if (remain <= 0) {
            return information;
        }

        int endIndex = (information.length() - end);
        shortMessage.append(information.substring(0, front));

        for (int i = 0; i < remain; i++) {
            shortMessage.append("*");
        }
        shortMessage.append(information.substring(endIndex));
        return shortMessage.toString();
    }
}
