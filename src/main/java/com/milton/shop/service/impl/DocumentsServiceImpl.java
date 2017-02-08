package com.milton.shop.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.milton.shop.constants.Constants;
import com.milton.shop.dao.CategoryMapper;
import com.milton.shop.dao.DLFileEntryMapper;
import com.milton.shop.dao.DLFileFolderMapper;
import com.milton.shop.dao.KindMapper;
import com.milton.shop.dao.ProductMapper;
import com.milton.shop.dao.UserMapper;
import com.milton.shop.exception.ServiceException;
import com.milton.shop.model.Category;
import com.milton.shop.model.DLFileEntry;
import com.milton.shop.model.DLFileFolder;
import com.milton.shop.model.Kind;
import com.milton.shop.model.Product;
import com.milton.shop.model.User;
import com.milton.shop.model.wrapper.ProductWrapper;
import com.milton.shop.service.DocumentsService;
import com.milton.shop.util.FileUtil;
import com.milton.shop.util.PropertyUtil;
import com.milton.shop.util.Validator;

public class DocumentsServiceImpl implements DocumentsService {

    private DLFileFolderMapper dLFileFolderDao;
    private DLFileEntryMapper dLFileEntryDao;
    private KindMapper kindDao;
    private CategoryMapper categoryDao;
    private ProductMapper productDao;
    private UserMapper userDao;

    @Override
    /**
     * @param file
     * @param description
     * @throws ServiceException
     * This method is used to upload header.
     */
    public DLFileEntry uploadHeader(MultipartFile file, Integer userid, String description) throws ServiceException {
        DLFileEntry fileEntry = null;
        if (file == null) {
            throw new ServiceException("Upload file does not exist");
        }
        DLFileFolder dlFolder = dLFileFolderDao.getByTitle(Constants.HEADER_FOLDER);
        if (dlFolder == null) {
            throw new ServiceException(String.format("DLFilefolder does not exist [title = %s]", 
                    Constants.HEADER_FOLDER));
        }

        String originalFilename = file.getOriginalFilename();
        String fileName = Constants.BLANK;
        String mimeType = Constants.BLANK;
        String path = Constants.SLASH + userid;
        String uuid = UUID.randomUUID().toString();
        if (!Validator.isNullEmptyString(originalFilename) && 
                originalFilename.contains(Constants.POINT)) {
            String[] names = originalFilename.split("\\.");
            fileName = names[0];
            mimeType = names[1];
        }

        // 1. Upload File
        String parentPath = PropertyUtil.getApacheUrl() +
                dlFolder.getParentPath() + dlFolder.getPath() + path;
        File saveFile = new File(parentPath, uuid + Constants.POINT + mimeType);
        File parentDir = new File(parentPath);
        if (!parentDir.exists()) {
            parentDir.mkdirs();
        } else {
         // Clean 
            FileUtil.clearDir(parentDir);
        }

        OutputStream outputStream = null;
        InputStream inputStream = null;

        try {
            outputStream = new FileOutputStream(saveFile);
            inputStream = file.getInputStream();
            byte[] buffer = new byte[1024 * 8];
            int length = 0;
            while((length = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, length);
            }
        } catch (Exception e) {
            throw new ServiceException(String.format("Upload file [title = %s] failed",
                    file.getOriginalFilename()));
        } finally {
            try {
                outputStream.close();
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 2. Create or Update DLFileEntry
        boolean isInsert = false;
        fileEntry = dLFileEntryDao.getByUserid(userid);
        if (fileEntry == null) {
            isInsert = true;
            fileEntry = new DLFileEntry();
            fileEntry.setFolderid(dlFolder.getFolderid());
            fileEntry.setUserid(userid);
            fileEntry.setPath(path);
        }
        fileEntry.setFileName(fileName);
        fileEntry.setMimeType(mimeType);
        fileEntry.setUuid(uuid);
        fileEntry.setTitle(originalFilename);
        fileEntry.setDescription(description);
        fileEntry.setDisplayPath(FileUtil.formatFilePath(saveFile.getAbsolutePath()));

        if (isInsert) {
            int entryid = dLFileEntryDao.insert(fileEntry);
            fileEntry.setEntryid(entryid);
            if (entryid <= 0) {
                throw new ServiceException(String.format("Insert DLFileEntry "
                        + "failed [filename = %s]", originalFilename));
            }
        } else {
            int result = dLFileEntryDao.update(fileEntry);
            if (result <= 0) {
                throw new ServiceException(String.format("Update DLFileEntry "
                        + "failed [entryid = %s]", fileEntry.getEntryid()));
            }
        }

        // 3. Update user
        User user = new User();
        user.setUserid(userid);
        user.setHeaderEntryid(fileEntry.getEntryid());
        userDao.updateHeader(user);
        return fileEntry;
    }

    @Override
    /**
     * @param file
     * @param productid 
     * @param description
     * @throws ServiceException
     * This method is used to upload Goods.
     */
    public DLFileEntry uploadGoods(MultipartFile file, Integer productid, String description) throws ServiceException {
        DLFileEntry fileEntry = null;
        if (file == null) {
            throw new ServiceException("Upload file does not exist");
        }

        DLFileFolder dlFolder = dLFileFolderDao.getByTitle(Constants.GOODS_FOLDER);
        if (dlFolder == null) {
            throw new ServiceException(String.format("DLFilefolder does not exist [title = %s]",
                    Constants.GOODS_FOLDER));
        }

        fileEntry = new DLFileEntry();
        fileEntry.setFolderid(dlFolder.getFolderid());
        // set path
        ProductWrapper product = productDao.selectByPrimaryKey(productid);
        if (product == null) {
            throw new ServiceException(String.format("Product does not exist "
                    + "[productid = %s]", productid));
        }
        fileEntry.setPath(String.format("/%s/%s/%s", product.getKindid(),
                product.getCategoryid(), product.getProductid()));

        fileEntry.setUuid(UUID.randomUUID().toString());
        String originalFilename = file.getOriginalFilename();
        fileEntry.setTitle(originalFilename);
        if (!Validator.isNullEmptyString(originalFilename) && 
                originalFilename.contains(Constants.POINT)) {
            String[] names = originalFilename.split("\\.");
            fileEntry.setFileName(names[0]);
            fileEntry.setMimeType(names[1]);
        }
        fileEntry.setDescription(description);

        // 1. Upload File
        String parentPath = PropertyUtil.getApacheUrl() +
                dlFolder.getParentPath() + dlFolder.getPath() + fileEntry.getPath();
        File saveFile = new File(parentPath, fileEntry.getUuid() + Constants.POINT + 
                fileEntry.getMimeType());
        File parentDir = new File(parentPath);
        if (!parentDir.exists()) {
            parentDir.mkdirs();
        }

        OutputStream outputStream = null;
        InputStream inputStream = null;

        try {
            outputStream = new FileOutputStream(saveFile);
            inputStream = file.getInputStream();
            byte[] buffer = new byte[1024 * 8];
            int length = 0;
            while((length = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, length);
            }
        } catch (Exception e) {
            throw new ServiceException(String.format("Upload file [title = %s] failed",
                    file.getOriginalFilename()));
        } finally {
            try {
                outputStream.close();
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 1. Create DLFileEntry
        int result = dLFileEntryDao.insert(fileEntry);
        if (result <= 0) {
            throw new ServiceException(String.format("Insert DLFileEntry "
                    + "failed [filename = %s]", originalFilename));
        }

        fileEntry.setDisplayPath(saveFile.getAbsolutePath());
        return fileEntry;
    }

    @Override
    public DLFileEntry getEntryByUserid(Integer userid) throws ServiceException {
        DLFileEntry entry = null;
        entry = dLFileEntryDao.getByUserid(userid);
        if (entry == null) {
            throw new ServiceException(String.format("Get DLFileEntry "
                    + "failed [userid = %s]", userid));
        }
        String absolutePath = PropertyUtil.getStaticUrl() + entry.getSrcPath();
        entry.setDisplayPath(absolutePath);
        return entry;
    }

    @Override
    public DLFileEntry getEntryByPrimarykey(Integer entryid) throws ServiceException {
        DLFileEntry entry = null;
        entry = dLFileEntryDao.getByPrimarykey(entryid);
        if (entry == null) {
            throw new ServiceException(String.format("Get DLFileEntry "
                    + "failed [entryid = %s]", entryid));
        }
        String absolutePath = PropertyUtil.getStaticUrl() + entry.getSrcPath();
        entry.setDisplayPath(absolutePath);
        return entry;
    }

    @Override
    public List<Kind> findKindList() {
        return kindDao.selectAll();
    }

    @Override
    public List<Category> findCategoryList(Integer kindid) {
        return categoryDao.selectByKindid(kindid);
    }

    @Override
    public List<Product> findProductList(Integer categoryid) {
        return productDao.selectByCategoryid(categoryid);
    }

    @Override
    public List<DLFileEntry> findGoodsEntry(Integer productid) {
        DLFileFolder folder = dLFileFolderDao.getByTitle(Constants.GOODS_FOLDER);
        if (folder == null) {
            return null;
        }
        return dLFileEntryDao.findGoodsEntry(folder.getFolderid(), productid);
    }

    public void setdLFileFolderDao(DLFileFolderMapper dLFileFolderDao) {
        this.dLFileFolderDao = dLFileFolderDao;
    }

    public void setdLFileEntryDao(DLFileEntryMapper dLFileEntryDao) {
        this.dLFileEntryDao = dLFileEntryDao;
    }

    public void setProductDao(ProductMapper productDao) {
        this.productDao = productDao;
    }

    public void setKindDao(KindMapper kindDao) {
        this.kindDao = kindDao;
    }

    public void setCategoryDao(CategoryMapper categoryDao) {
        this.categoryDao = categoryDao;
    }

    public void setUserDao(UserMapper userDao) {
        this.userDao = userDao;
    }
}
