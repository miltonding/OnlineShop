package com.milton.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.milton.shop.constants.Constants;
import com.milton.shop.exception.ServiceException;
import com.milton.shop.model.Category;
import com.milton.shop.model.DLFileEntry;
import com.milton.shop.model.Kind;
import com.milton.shop.model.Product;
import com.milton.shop.service.DocumentsService;
import com.milton.shop.util.ParamUtil;

@Controller
@RequestMapping("page/documents")
public class DocumentsController extends BaseController {

    @Autowired
    private DocumentsService documentsService;

    @RequestMapping(value= "/documentsAndMedia", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView documentsAndMedia() {
        ModelAndView modelAndView = new ModelAndView();
        List<Kind> kindList = documentsService.findKindList();
        modelAndView.addObject(Constants.KIND_LIST, kindList);
        modelAndView.setViewName(Constants.DOCUMENTS_MEDIA_JSP);
        return modelAndView;
    }

    //Ajax
    @RequestMapping(value= "/uploadHeader", method = {RequestMethod.POST})
    @ResponseBody
    public String uploadHeader(@RequestParam(value = "file") MultipartFile file) {
        if (file == null || getUserid() == null) {
            return Constants.BLANK;
        }
        try {
            DLFileEntry entry = documentsService.uploadHeader(file, getUserid(), null);
            String srcPath = entry.getDisplayPath();
            // Update user in session
            getUser().setSrcPath(srcPath);
            return srcPath;
        } catch (ServiceException e) {
            return Constants.BLANK;
        }
    }

    //Ajax
    @RequestMapping(value= "/uploadGoods", method = {RequestMethod.POST})
    @ResponseBody
    public String uploadHeader(@RequestParam(value = "file") MultipartFile file,
                              Integer productid, String description) {
        String path = Constants.BLANK;
        try {
            DLFileEntry entry = documentsService.uploadGoods(file, productid, description);
            path = entry.getDisplayPath();
        } catch (ServiceException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return path;
    }

    //Ajax
    @RequestMapping(value = "/findCategoryList", method = {RequestMethod.POST})
    @ResponseBody
    public List<Category> findCategoryList(String kindid) {
        Integer kindInt = ParamUtil.getInteger(kindid, 0);
        if (kindInt == 0) {
            return null;
        }
        return documentsService.findCategoryList(kindInt);
    }

    //Ajax
    @RequestMapping(value = "/findProductList", method = {RequestMethod.POST})
    @ResponseBody
    public List<Product> findProductList(String categoryid) {
        Integer categoryidInt = ParamUtil.getInteger(categoryid, 0);
        if (categoryidInt == 0) {
            return null;
        }
        return documentsService.findProductList(categoryidInt);
    }

    //Ajax
    @RequestMapping(value = "/findGoodsEntry", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public List<DLFileEntry> findGoodsEntry(String productid) {
        Integer productidInt = ParamUtil.getInteger(productid, 0);
        if (productidInt == 0) {
            return null;
        }
        return documentsService.findGoodsEntry(productidInt);
    }

    public void setDocumentsService(DocumentsService documentsService) {
        this.documentsService = documentsService;
    }
}
