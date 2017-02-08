package com.milton.shop.util;

import java.io.File;
import java.io.UnsupportedEncodingException;

import com.milton.shop.constants.Constants;
import com.milton.shop.exception.ServiceException;
import com.milton.shop.model.User;

public class FileUtil {

    public static void clearDir(File directory) throws ServiceException {
        if (!directory.exists()) {
            throw new ServiceException("File does not exist");
        }

        File[] fileList = directory.listFiles();
        if (!Validator.isNullEmptyArray(fileList)) {
            for (File file : fileList) {
                file.delete();
            }
        }
    }

    public static String toUTF8(String absolutePath) {
        String result = Constants.BLANK;
        try {
            result = new String(absolutePath.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static String formatFilePath(String absolutePath) {
        if (absolutePath.contains(Constants.REVRSE_SLASH)) {
            absolutePath = absolutePath.replace(Constants.REVRSE_SLASH, Constants.SLASH);
        }
        if (absolutePath.contains(PropertyUtil.getApacheUrl())) {
            absolutePath = absolutePath.replace(PropertyUtil.getApacheUrl(), PropertyUtil.getStaticUrl());
        }
        return absolutePath;
    }
}
