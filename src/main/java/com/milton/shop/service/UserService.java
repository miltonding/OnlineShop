package com.milton.shop.service;

import java.util.List;

import javax.servlet.http.Cookie;

import org.springframework.web.multipart.MultipartFile;

import com.milton.shop.exception.NoSuchUserException;
import com.milton.shop.exception.ServiceException;
import com.milton.shop.model.Address;
import com.milton.shop.model.City;
import com.milton.shop.model.District;
import com.milton.shop.model.User;
import com.milton.shop.model.wrapper.AddressWrapper;

public interface UserService {
    public User getUserByUserName(String userName);

    public User login(String userName, String password)  
            throws NoSuchUserException, ServiceException;

    public Cookie getCookie(String nameSpace, String value);

    public boolean checkoutUserName(String username);

    public List<City> findCityByProvinceId(String provinceid);

    public List<District> findByCityId(String cityid);

    public void createUserAndAddress(User user, Address address) throws Exception;

    public String uploadHeader(MultipartFile file, int userid) throws ServiceException;

    public void updateProfile(User user);
 
    public void updatepwdByUserid(User user);

    public List<AddressWrapper> findAddressWrapper(int userid);

}
