package com.milton.shop.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.milton.shop.constants.Constants;
import com.milton.shop.exception.ServiceException;
import com.milton.shop.model.Address;
import com.milton.shop.model.Province;
import com.milton.shop.model.wrapper.AddressWrapper;
import com.milton.shop.service.AddressService;
import com.milton.shop.service.ProvinceService;
import com.milton.shop.util.ParamUtil;

@Controller
@RequestMapping("page/address")
public class AddressController extends BaseController{
    private final Logger LOG = Logger.getLogger(AddressController.class);
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private AddressService addressService;

    public void goToAddressManage(ModelAndView modelAndView) {
        modelAndView.setView(this.getRedirectView(Constants.USER_PROFILE_PAGE,
                Constants.ADDRESS_OPTION_SUFIX));
    }

    public AddressWrapper isAddressExist(int addressid, int userid) {
        AddressWrapper addressWrapper = null;
        try {
            addressWrapper = addressService.getByAddressid(addressid, userid);
        } catch (ServiceException e) {
            LOG.error(e);
        }
        return addressWrapper;
    }

    @RequestMapping(value = "/createAddress", method = {RequestMethod.GET})
    public ModelAndView createAddress() {
        ModelAndView modelAndView = new ModelAndView();
        List<Province> provinceList = provinceService.findAllProvince();
        modelAndView.addObject(Constants.ADDRESS_CREATE, Constants.SUCCESS);
        modelAndView.addObject(Constants.PROVINCE_LIST, provinceList);
        modelAndView.setViewName(Constants.USER_ADDRESS_JSP);
        return modelAndView;
    }

    @RequestMapping(value = "/createAddress", method = {RequestMethod.POST})
    public ModelAndView createAddressSubmit(Address address) {
        ModelAndView modelAndView = new ModelAndView();
        try {
            address.setUserid(getUserid());
            address.setIsDefault(0);
            addressService.createAddress(address);
            addSession(Constants.CREATE_ADDRESS, Constants.SUCCESS);
        } catch (ServiceException e) {
            LOG.error(e);
        }
        goToAddressManage(modelAndView);
        return modelAndView;
    }

    @RequestMapping(value = "/editAddress", method = {RequestMethod.GET})
    public ModelAndView editAddress(String addressid) {
        ModelAndView modelAndView = new ModelAndView();
        int addressidInt = ParamUtil.getInteger(addressid, 0);
        if (addressidInt == 0) {
            goToAddressManage(modelAndView);
            return modelAndView;
        }

        AddressWrapper addressWrapper = isAddressExist(addressidInt, getUserid());
        // Address not exist
        if (addressWrapper == null) {
            goToAddressManage(modelAndView);
            return modelAndView;
        }

        List<Province> provinceList = provinceService.findAllProvince();
        modelAndView.addObject(Constants.ADDRESS_WRAPPER, addressWrapper);
        modelAndView.addObject(Constants.ADDRESS_EDIT, Constants.SUCCESS);
        modelAndView.addObject(Constants.PROVINCE_LIST, provinceList);
        modelAndView.setViewName(Constants.USER_ADDRESS_JSP);

        return modelAndView;
    }

    @RequestMapping(value = "/editAddress", method = {RequestMethod.POST})
    public ModelAndView editAddressSubmit(Address address) {
        ModelAndView modelAndView = new ModelAndView();
        try {
            addressService.getByAddressid(address.getAddressid(), getUserid());
            address.setUserid(getUserid());
            addressService.updateUserAddress(address);
            addSession(Constants.EDIT_ADDRESS, Constants.SUCCESS);
        } catch (ServiceException e) {
            LOG.error(e);
        }
        goToAddressManage(modelAndView);
        return modelAndView;
    }

    // Ajax
    @RequestMapping(value = "/deleteAddress", method = {RequestMethod.POST})
    @ResponseBody
    public boolean deleteAddress(String addressid) {
        int addressidInt = ParamUtil.getInteger(addressid, 0);
        if (addressidInt == 0) {
            return false;
        }

        AddressWrapper addressWrapper = isAddressExist(addressidInt, getUserid());
        // Address not exist
        if (addressWrapper == null) {
            return false;
        }

        // Is default
        if (addressWrapper.getIsDefault() == 1) {
            return false;
        }

        // Delete
        addressService.deleteByPrimaryKey(addressidInt);
        return true;
    }

    @RequestMapping(value = "/upadteDefault", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public boolean upadteDefault(String addressid) {
        int addressidInt = ParamUtil.getInteger(addressid, 0);
        if (addressidInt == 0) {
            return false;
        }

        AddressWrapper addressWrapper = isAddressExist(addressidInt, getUserid());
        // Address not exist and is default
        if (addressWrapper == null || addressWrapper.getIsDefault() == 1) {
            return false;
        }

        addressService.updateDefaultAddress(addressidInt, getUserid());
        return true;
    }

    public void setProvinceService(ProvinceService provinceService) {
        this.provinceService = provinceService;
    }

    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }

}
