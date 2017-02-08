package com.milton.shop.dao;

import com.milton.shop.model.DLFileFolder;

public interface DLFileFolderMapper {

    public DLFileFolder getByPrimarykey(Integer folderid);

    public DLFileFolder getByTitle(String title);
}
