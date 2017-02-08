package com.milton.shop.util;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

import com.milton.shop.constants.Constants;
import com.milton.shop.exception.ServiceException;
import com.milton.shop.model.DLFileEntry;
import com.milton.shop.service.DocumentsService;

public class DocumentsUtil {

     private static DocumentsService documentsService;

     static {
         documentsService = (DocumentsService) SpringUtil.getBean("documentsService");
     }

     public static DLFileEntry uploadHeader(MultipartFile file, Integer userid, String description) throws ServiceException {
         return documentsService.uploadHeader(file, userid, description);
     }

     public static DLFileEntry uploadGoods(MultipartFile file, Integer productid, String description) throws ServiceException {
         return documentsService.uploadGoods(file, productid, description);
     }

     public static String getHeaderByUserid(Integer userid) {
         String headerPath = Constants.BLANK;
         try {
            DLFileEntry entry = documentsService.getEntryByUserid(userid);
            headerPath = entry.getDisplayPath();
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return headerPath;
     }

     public static String getHeaderByEntryid(Integer entryid) {
         String headerPath = Constants.BLANK;
         try {
            DLFileEntry entry = documentsService.getEntryByPrimarykey(entryid);
            headerPath = entry.getDisplayPath();
        } catch (ServiceException e) {
            //e.printStackTrace();
        }
        return headerPath;
     }
     
     public static void main(String[] args) {
        File file = new File("http:\\\\static.webapp.com\\documents\\header\\28\\5c769dea-b739-4ba0-935c-01093223ff4f.jpg");
        
        System.out.println(file);
    }
}
