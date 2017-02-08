package com.milton.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.milton.shop.constants.Constants;
import com.milton.shop.model.wrapper.ProductWrapper;
import com.milton.shop.service.ProductService;

@Controller
@RequestMapping("page/dashboard")
public class DashBoardController extends BaseController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/dashboard")
    public ModelAndView dashboard() {
        ModelAndView modelAndView = new ModelAndView();
        List<Integer> roleList = (List<Integer>) getSession(Constants.ROLE_LIST);
        if (getUser() != null && roleList != null 
                && !roleList.contains(Constants.ROLE_CUSTOMER)) {
            modelAndView.setViewName(Constants.ADMIN_JSP);
        } else {
            List<ProductWrapper> productList = productService.findByKindid(1, 10);
            modelAndView.addObject(Constants.PRODUCT_LIST, productList);
            modelAndView.setViewName(Constants.DASHBOARD_JSP);
        }
        return modelAndView;
    }

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }
}
