package com.milton.shop.filter;

import java.io.IOException;
import java.net.URL;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.milton.shop.constants.Constants;
import com.milton.shop.model.User;
public class SessionFilter implements Filter {

    public SessionFilter() {
    }

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        HttpSession session = request.getSession();
           String uri = request.getRequestURI();
           String path = request.getContextPath();
           uri = uri.substring(path.length() + 1);
           String[] parts = uri.split(Constants.SLASH);
           String controllerName = parts[1];
           String methodName = parts[2];
           /*System.out.println("controllerName = " + controllerName 
                   + ", methodName = " + methodName);*/

           boolean invoke = false;
           User user = (User)session.getAttribute(Constants.USER);
           if (user == null) {
               if (Constants.USER.equals(controllerName)) {
                   // can do
                   if (!("profile").equals(methodName) && !("updatePwd").equals(methodName)) {
                       invoke = true;
                   }
               } else if (Constants.GOODS.equals(controllerName)) {
                   if (!("goodsCreate").equals(methodName)) {
                       invoke = true;
                   }
               } else if (Constants.CART.equals(controllerName)
                       || Constants.DASHBOARD.equals(controllerName)) {
                   invoke = true;
               } else if (Constants.DOCUMENTS.equals(controllerName)) {
                   if (!("documentsAndMedia").equals(methodName) &&
                           !("uploadHeader").equals(methodName) &&
                           !("uploadGoods").equals(methodName)) {
                       invoke = true;
                   }
               }
           } else {
               invoke = true;
           }

           if (invoke) {
               chain.doFilter(request, response);
           } else {
               response.sendRedirect(request.getContextPath() + "/page/user/login");
           }
           /*if (uri.endsWith("showLogin") || uri.endsWith("login")) {
               chain.doFilter(request, response);
           } else {
               User user = (User)session.getAttribute(Constants.USER);
               if (user == null){
                   //session fail
                   if (request.getMethod().toUpperCase().equals("GET")) {
                         String go= "";
                         String queryString = request.getQueryString();
                         if (StringUtil.validateParam(queryString)) {
                             go = uri + "@" + queryString;
                         }
                       response.sendRedirect(request.getContextPath() + "/page/user/showLogin?go=" + go);
                   } else {
                       response.sendRedirect(request.getContextPath() + "/page/user/showLogin");
                   }
               } else {
                   chain.doFilter(request, response);
               }
           }*/
    }

    @Override
    public void init(FilterConfig fConfig) throws ServletException {
    }

}
