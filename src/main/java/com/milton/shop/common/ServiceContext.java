package com.milton.shop.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.milton.shop.constants.Constants;
import com.milton.shop.model.User;
import com.milton.shop.util.Validator;

public class ServiceContext {
    private static ThreadLocal<ServiceContext> threadLocal = new ThreadLocal<ServiceContext>();
    private static Map<String, Object> attributes = new HashMap<String, Object>();

    private ServiceContext() {
    }

    public static ServiceContext getServiceContext() {
        if (threadLocal.get() == null) {
            threadLocal.set(new ServiceContext());
        } 
        return threadLocal.get();
    }

    public HttpServletRequest getHttpServletRequest() {
        return (HttpServletRequest) getAttribute(Constants.HTTP_SERVLET_REQUEST);
    }

    public HttpServletResponse getHttpServletResponse() {
        return (HttpServletResponse) getAttribute(Constants.HTTP_SERVLET_RESPONSE);
    }

    public HttpSession getHttpSession() {
        return (HttpSession) getAttribute(Constants.HTTP_SESSION);
    }
    
    public User getUser() {
        return (User) getAttribute(Constants.USER);
    }
    
    public int getUserId() {
        return getUser().getUserid();
    }
    
    public void setContextPath(String contextPath) {
        if (!Validator.isNullEmptyString(contextPath)) {
            addAttribute(Constants.SERVICE_CONTEXT_PATH, contextPath);
        }
    }

    public static String getContextPath() {
        String contextPath = Constants.BLANK;
        if (!Validator.isNullEmptyString((String) attributes.get(Constants.SERVICE_CONTEXT_PATH))) {
            contextPath = (String) attributes.get(Constants.SERVICE_CONTEXT_PATH);
        }
        return contextPath;
    }
    
    public Map<String, Object> getAttributes() {
        return attributes;
    }

    public void clear() {
        attributes.clear();
    }

    public void addAttribute(String key, Object value) {
        attributes.put(key, value);
    }

    public void removeAttribute(String key) {
        attributes.remove(key);
    }

    public Object getAttribute(String key) {
        return attributes.get(key);
    }
}
