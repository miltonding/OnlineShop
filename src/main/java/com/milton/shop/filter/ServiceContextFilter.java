package com.milton.shop.filter;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.milton.shop.common.ServiceContext;
import com.milton.shop.constants.Constants;
import com.milton.shop.controller.CartController;
import com.milton.shop.model.User;

public class ServiceContextFilter implements Filter {

    public ServiceContextFilter() {
    }

    public void init(FilterConfig fConfig) throws ServletException {
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
            FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String contextPath = request.getContextPath();

        ServiceContext serviceContext = ServiceContext.getServiceContext();
        serviceContext.addAttribute(Constants.SERVICE_CONTEXT_PATH, contextPath);

        HttpSession session = request.getSession();
        serviceContext.addAttribute(Constants.HTTP_SERVLET_REQUEST, request);
        serviceContext.addAttribute(Constants.HTTP_SERVLET_RESPONSE, response);
        serviceContext.addAttribute(Constants.HTTP_SESSION, session);

        User user = (User) session.getAttribute(Constants.USER);
        serviceContext.addAttribute(Constants.USER, user);
        try {
            Integer quantity = (Integer)session.getAttribute(Constants.CART_QUANTITY);
            if (quantity == null && user == null) {
                // Get cart quantity
                Class<?> clazz = Class.forName(CartController.class.getName());
                Object cartController = clazz.newInstance();
                Method method = clazz.getMethod("getCartQuantity", null);
                int cartQuantity = (Integer) method.invoke(cartController, null);
                session.setAttribute(Constants.CART_QUANTITY, cartQuantity);
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        try {
            chain.doFilter(request, response);
        } finally {
            serviceContext.clear();
        }
    }

}
