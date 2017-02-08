package com.milton.shop.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.milton.shop.exception.ServiceException;
import com.milton.shop.model.Category;
import com.milton.shop.model.DLFileEntry;
import com.milton.shop.model.Kind;
import com.milton.shop.model.Product;

public interface DocumentsService {
    public DLFileEntry uploadHeader(MultipartFile file, Integer userid, String description) 
            throws ServiceException;

    public DLFileEntry uploadGoods(MultipartFile file, Integer productid,  String description)
            throws ServiceException;

    public DLFileEntry getEntryByUserid(Integer userid) throws ServiceException;

    public DLFileEntry getEntryByPrimarykey(Integer entryid) throws ServiceException;

    public List<Kind> findKindList();

    public List<Category> findCategoryList(Integer kindid);

    public List<Product> findProductList(Integer categoryid);

    public List<DLFileEntry> findGoodsEntry(Integer productid);
}
