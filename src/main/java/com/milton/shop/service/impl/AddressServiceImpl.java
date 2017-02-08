package com.milton.shop.service.impl;


import com.milton.shop.dao.AddressMapper;
import com.milton.shop.exception.ServiceException;
import com.milton.shop.model.Address;
import com.milton.shop.model.wrapper.AddressWrapper;
import com.milton.shop.service.AddressService;

public class AddressServiceImpl implements AddressService {

    private AddressMapper addressDao;

    public AddressWrapper getByAddressid(Integer addressid, int userid) throws ServiceException {
        Address address = new Address();
        address.setUserid(userid);
        address.setAddressid(addressid);
        AddressWrapper addressWrapper = addressDao.getUserAddress(address);
        if (addressWrapper == null) {
            throw new ServiceException(String.format(
                    "No address found (uerid = %s and addressid = %s)", userid, addressid));
        }
        return addressWrapper;
    }

    public void createAddress(Address address) throws ServiceException {
        int addressid = addressDao.createAddress(address);
        if (addressid == 0) {
            throw new ServiceException(String.format(
                    "Create address failed (uerid = %s)", address.getUserid()));
        }
    }

    public void updateDefaultAddress(Integer addressid, Integer userid) {
        // Change origin
        Address originDefaultAddress = addressDao.getDefaultAddress(userid);
        addressDao.updateDefaultAddress(originDefaultAddress.getAddressid(), 0);
        // Change new
        addressDao.updateDefaultAddress(addressid, 1);
    }

    public void deleteByPrimaryKey(Integer addressid) {
        addressDao.deleteByPrimaryKey(addressid);
    }

    public void updateUserAddress(Address address) {
        addressDao.updateAddress(address);
    }

    public void setAddressDao(AddressMapper addressDao) {
        this.addressDao = addressDao;
    }

}
