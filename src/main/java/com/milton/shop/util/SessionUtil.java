package com.milton.shop.util;

import java.lang.reflect.Method;
import com.milton.shop.common.ServiceContext;

public class SessionUtil {

    private static Object getSession() {
        return ServiceContext.getServiceContext().getHttpSession();
    }

    public static void addSession(String key, Object value) {
        Object session = getSession();
        try {
            Class[] param = {String.class, Object.class};
            Method method = session.getClass().getMethod("setAttribute", param);
            Object[] objects = {key, value};
            method.invoke(session, objects);
        } catch (Exception e) {
            throw new RuntimeException();
        }
    }

    public static Object getSession(String key) {
        Object object = null;
        Object session = getSession();
        try {
            Class[] param = {String.class};
            Method method = session.getClass().getMethod("getAttribute", param);
            Object[] objects = {key};
            object = method.invoke(session, objects);
            return object;
        } catch (Exception e) {
            throw new RuntimeException();
        }
    }

    public static void removeSession(String key) {
        Object session = getSession();
        try {
            Class[] param = {String.class};
            Method method = session.getClass().getMethod("removeAttribute", param);
            Object[] objects = {key};
            method.invoke(session, objects);
        } catch (Exception e) {
            throw new RuntimeException();
        }
    }

    public static void invalidate() {
        Object session = getSession();
        if (session != null) {
            try {
                Method method = session.getClass().getMethod("invalidate");
                method.invoke(session);
            } catch (Exception e) {
                throw new RuntimeException();
            }
        }
    }
}
