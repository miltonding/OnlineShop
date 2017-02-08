package com.milton.shop.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import com.milton.shop.constants.Constants;


public class PropertyUtil {

    public static final String STATIC_URL = "static_url";
    public static final String APACHE_URL = "apache_url";
    private static Properties property = null;

    static {
        InputStream appPropertyStream = null;
        try {
            property = new Properties();
            appPropertyStream = PropertyUtil.class.getClassLoader()
                    .getResourceAsStream("app.properties");
            property.load(appPropertyStream);
        } catch (Exception e) {
            property = null;
            e.printStackTrace();
        } finally {
            try {
                appPropertyStream.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    public static String getStaticUrl() {
        return property.getProperty(STATIC_URL);
    }

    public static String getApacheUrl() {
        return property.getProperty(APACHE_URL);
    }

    public static String getProperty(String propertyName) {
        return property.getProperty(propertyName);
    }
}
