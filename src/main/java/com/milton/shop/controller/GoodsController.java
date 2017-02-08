package com.milton.shop.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.milton.shop.constants.Constants;
import com.milton.shop.model.DLFileEntry;
import com.milton.shop.model.Goods;
import com.milton.shop.model.Kind;
import com.milton.shop.model.Pagination;
import com.milton.shop.model.wrapper.GoodsWrapper;
import com.milton.shop.service.DocumentsService;
import com.milton.shop.service.GoodsService;
import com.milton.shop.util.EncodeUtil;
import com.milton.shop.util.ParamUtil;
import com.milton.shop.util.StringUtil;
import com.milton.shop.util.Validator;

@Controller
@RequestMapping(value = "page/goods")
public class GoodsController extends BaseController{
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private DocumentsService documentsService;

    @RequestMapping(value = "goodsList", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView goodsList(String keyword, String goalPage, String order,
            String kindid, String categoryid, String productid) {
        ModelAndView modelAndView = new ModelAndView();

        // Default page size is 10
        int pageSize = 10;
        Integer goalPageInt = ParamUtil.getInteger(goalPage, 0);
        int kindidInt = ParamUtil.getInteger(kindid, 0);
        int categoryidInt = ParamUtil.getInteger(categoryid, 0);
        int productidInt = ParamUtil.getInteger(productid, 0);
        try {
            keyword = ParamUtil.getString(keyword, Constants.BLANK);
            keyword = new String(keyword.getBytes("ISO-8859-1"), "UTF-8");
        } catch (Exception e) {
            
        }
        String outputKeyword = Constants.BLANK;
        order = ParamUtil.getString(order, Constants.BLANK);

        Pagination pagination = new Pagination();
        if (!Validator.isNullEmptyString(keyword)) {
            pagination.setKeyword(StringUtil.dealSpecial(keyword.trim()));
            outputKeyword = keyword.trim();
        }
        if (!Validator.isNullEmptyString(order)) {
            pagination.setOrder(order.trim());
        }
        if (kindidInt != 0) {
            pagination.setKindid(kindidInt);
        }
        if (categoryidInt != 0) {
            pagination.setCategoryid(categoryidInt);
        }
        if (productidInt != 0) {
            pagination.setProductid(productidInt);
        }
        // Default is 1
        if (goalPageInt == 0) {
            goalPageInt = 1;
        }
        // total count
        int goodsQuantity = goodsService.getGoodsQuantity(pagination);
        if (goodsQuantity == 0) {
            pagination.setGoalPage(1);
        } else {
            pagination.setQuantity(goodsQuantity);
            pagination.setPageSize(pageSize);
            if (goalPageInt > pagination.getPageCount()) {
                goalPageInt = pagination.getPageCount();
            }
            pagination.setGoalPage(goalPageInt);
            List<GoodsWrapper> goodsList = goodsService.findGoodsDynamic(pagination);
            EncodeUtil.encodeList(goodsList);
            modelAndView.addObject(Constants.GOODS_LIST, goodsList);
        }

        modelAndView.addObject(Constants.PAGINATION, pagination);
        modelAndView.addObject(Constants.OUTPUT_KEYWORD, outputKeyword);
        modelAndView.setViewName(Constants.GOODS_LIST_JSP);
        return modelAndView;
    }

    @RequestMapping(value = "goodsCreate", method = {RequestMethod.GET})
    public ModelAndView goodsCreate() {
        ModelAndView modelAndView = new ModelAndView();
        List<Kind> kindList = documentsService.findKindList();
        modelAndView.addObject(Constants.KIND_LIST, kindList);
        modelAndView.setViewName(Constants.GOODS_CREATE_JSP);
        return modelAndView;
    }

    //Ajax
    @RequestMapping(value = "/goodsCreate", method = {RequestMethod.POST})
    @ResponseBody
    public boolean createGoodsSubmit(GoodsWrapper goodsWrapper) {
        boolean result = false;
        goodsWrapper.setInSale(1);
        goodsWrapper.setIsDelete(0);
        try {
            goodsService.createGoodsAndInventory(goodsWrapper);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @RequestMapping(value = "goodsDetail", method = {RequestMethod.GET})
    public ModelAndView goodsDetail(String goodsid) {
        ModelAndView modelAndView = new ModelAndView();
        Integer goodsidInt = ParamUtil.getInteger(goodsid, 0);
        if (goodsidInt == 0) {
            modelAndView.setView(this.getRedirectView(Constants.DASHBOARD_PAGE));
            return modelAndView;
        }
        GoodsWrapper goodsWrapper = goodsService.getByPrimaryKey(goodsidInt);
        if (Validator.isNull(goodsWrapper)) {
            modelAndView.setView(this.getRedirectView(Constants.DASHBOARD_PAGE));
            return modelAndView;
        }
        EncodeUtil.encode(goodsWrapper);
        modelAndView.addObject(Constants.GOODS_WRAPPER, goodsWrapper);
        modelAndView.setViewName(Constants.GOODS_DETAIL_JSP);
        return modelAndView;
    }

    @RequestMapping(value = "goodsDetail", method = {RequestMethod.POST})
    public ModelAndView test() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(Constants.GOODS_CREATE_JSP);
        return modelAndView;
    }

    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    public void setDocumentsService(DocumentsService documentsService) {
        this.documentsService = documentsService;
    }
}
