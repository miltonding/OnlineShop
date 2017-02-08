package com.milton.shop.service;

import com.milton.shop.exception.ServiceException;
import com.milton.shop.model.Address;
import com.milton.shop.model.wrapper.AddressWrapper;

public interface AddressService {

    public AddressWrapper getByAddressid(Integer addressid, int userid) throws ServiceException;

    public void updateUserAddress(Address address);

    public void createAddress(Address address) throws ServiceException;

    public void deleteByPrimaryKey(Integer addressid);

    public void updateDefaultAddress(Integer addressid, Integer isDefault);
}
