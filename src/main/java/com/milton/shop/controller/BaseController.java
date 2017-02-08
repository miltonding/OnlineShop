package com.milton.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.milton.shop.common.ServiceContext;
import com.milton.shop.constants.Constants;
import com.milton.shop.model.User;
import com.milton.shop.util.SessionUtil;

public class BaseController {
    private final Logger LOG = Logger.getLogger(BaseController.class);

    @ExceptionHandler(Exception.class)
    protected ModelAndView handleException(Exception e) {
        LOG.error(e.getMessage(), e);
        ModelAndView modelAndView = new ModelAndView(this.getRedirectView("static/500.html"));
        return modelAndView;
    }

    protected RedirectView getRedirectView(String path) {
        return new RedirectView(String.format("%s/%s", ServiceContext.getContextPath(), path));
    }

    protected RedirectView getRedirectView(String path, String sufix) {
        return new RedirectView(String.format("%s/%s%s", ServiceContext.getContextPath(), path, sufix));
    }

    protected HttpServletRequest getRequest() {
        return ServiceContext.getServiceContext().getHttpServletRequest();
    }

    protected HttpServletResponse getResponse() {
        return ServiceContext.getServiceContext().getHttpServletResponse();
    }

    protected Integer getSessionCartQty() {
        return (Integer) SessionUtil.getSession(Constants.CART_QUANTITY);
    }

    protected void setSessionCartQty(Integer quantity) {
        if (quantity < 0) {
            SessionUtil.addSession(Constants.CART_QUANTITY, 0);
        } else {
            SessionUtil.addSession(Constants.CART_QUANTITY, quantity);
        }
    }

    protected void addSession(String key, Object object) {
        SessionUtil.addSession(key, object);
    }

    protected Object getSession(String key) {
        return SessionUtil.getSession(key);
    }

    protected void removeSession(String key) {
        SessionUtil.removeSession(key);
    }

    protected void inValidateSession() {
        SessionUtil.invalidate();
    }

    protected User getUser() {
        return ServiceContext.getServiceContext().getUser();
    }

    protected Integer getUserid() {
        return getUser().getUserid();
    }

    protected void setUser(User user) {
        ServiceContext.getServiceContext().addAttribute(Constants.USER, user);
    }
}
