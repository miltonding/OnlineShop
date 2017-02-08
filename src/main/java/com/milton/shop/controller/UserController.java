package com.milton.shop.controller;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.milton.shop.constants.Constants;
import com.milton.shop.dao.mybatis.UserDaoImpl;
import com.milton.shop.exception.ServiceException;
import com.milton.shop.model.Address;
import com.milton.shop.model.Cart;
import com.milton.shop.model.City;
import com.milton.shop.model.District;
import com.milton.shop.model.Province;
import com.milton.shop.model.User;
import com.milton.shop.model.UserRole;
import com.milton.shop.model.wrapper.AddressWrapper;
import com.milton.shop.service.CartService;
import com.milton.shop.service.GoodsService;
import com.milton.shop.service.ProvinceService;
import com.milton.shop.service.UserRoleService;
import com.milton.shop.service.UserService;
import com.milton.shop.util.CookieUtil;
import com.milton.shop.util.DocumentsUtil;
import com.milton.shop.util.FileUtil;
import com.milton.shop.util.Validator;

@Controller
@RequestMapping("page/user")
public class UserController extends BaseController {
    private final Logger LOG = Logger.getLogger(UserController.class);
    @Autowired
    private UserService userService;
    @Autowired
    private ProvinceService provinceService;
    @Autowired 
    private GoodsService goodsService;
    @Autowired
    private CartService cartService;
    @Autowired
    private UserRoleService userRoleService;

    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public ModelAndView login(String history) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(Constants.USER_LOGIN_JSP);
        return modelAndView;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView loginSubmit(String userName, String password, String rememberPassword) {
        ModelAndView modelAndView = new ModelAndView();
        userName = userName.trim();
        password = password.trim();
        try {
            // Logined in
            if (getUser() != null) {
                modelAndView.setView(getRedirectView(Constants.USER_LOGIN_PAGE));
                return modelAndView;
            }

            User user = userService.login(userName.trim(), password.trim());
            // Remember me
            if (!Validator.isNullEmptyString(rememberPassword)) {
                Cookie userNameCookie = userService.getCookie(Constants.USER_NAME, userName);
                Cookie passwordCookie = userService.getCookie(Constants.PASSWORD, password);
                CookieUtil.setCookie(userNameCookie, getRequest().getServerName(),
                        getRequest().getContextPath());
                CookieUtil.setCookie(passwordCookie, getRequest().getServerName(),
                        getRequest().getContextPath());
                this.getResponse().addCookie(userNameCookie);
                this.getResponse().addCookie(passwordCookie);
            } else {
                Cookie[] cookies = getRequest().getCookies();
                for (Cookie cookie: cookies) {
                    if (Constants.USER_NAME.equals(cookie.getName()) || 
                            Constants.PASSWORD.equals(cookie.getName())) {
                        cookie.setMaxAge(0);
                        this.getResponse().addCookie(cookie);
                    }
                }
            }

            // Set header src path
            user.setSrcPath(DocumentsUtil.getHeaderByEntryid(user.getHeaderEntryid()));
            addSession(Constants.USER, user);
            setUser(user);

            // Add cookie cart
            Class<?> clazz = Class.forName(CartController.class.getName());
            Method setGoodsServiceMethod = clazz.getMethod(Constants.SET_GOODS_SERVICE, GoodsService.class);
            Method setCartServiceMethod = clazz.getMethod(Constants.SET_CART_SERVICE, CartService.class);
            Method addCartWhenLoginmethod = clazz.getMethod(Constants.ADD_CART_WHEN_LOGIN, null);
            Object cartController = clazz.newInstance();
            setGoodsServiceMethod.invoke(cartController, goodsService);
            setCartServiceMethod.invoke(cartController, cartService);
            addCartWhenLoginmethod.invoke(cartController, null);

            // Update quantity
            List<Cart> cartList = cartService.findByUserid(getUserid());
            if (cartList == null || cartList.size() == 0) {
                addSession(Constants.CART_QUANTITY, 0);
            } else {
                addSession(Constants.CART_QUANTITY, cartList.size());
            }

            // Find role
            List<Integer> roleList = userRoleService.findRoleByUserid(user.getUserid());
            if (Validator.isNullEmptyCollection(roleList)) {
                UserRole userRole = new UserRole();
                userRole.setUserid(user.getUserid());
                userRole.setRoleid(Constants.ROLE_CUSTOMER);
                userRoleService.insert(userRole);
                roleList = new ArrayList<>();
                roleList.add(Constants.ROLE_CUSTOMER);
            }

            addSession(Constants.ROLE_LIST, roleList);
            modelAndView.setView(getRedirectView(Constants.DASHBOARD_PAGE));
        } catch (Exception e) {
            modelAndView.addObject(Constants.USER_NAME, userName);
            modelAndView.addObject(Constants.ERROR_MESSAGE, "账号或密码错误");
            modelAndView.setViewName(Constants.USER_LOGIN_JSP);
        } 
        return modelAndView;
    }

    @RequestMapping(value= "/logout", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView logout() {
        ModelAndView modelAndView = new ModelAndView();
        this.inValidateSession();
        modelAndView.setView(this.getRedirectView(Constants.USER_LOGIN_PAGE));
        return modelAndView;
    }

    @RequestMapping(value= "/register", method = {RequestMethod.GET})
    public ModelAndView register() {
        ModelAndView modelAndView = new ModelAndView();
        List<Province> provinceList = provinceService.findAllProvince();
        modelAndView.addObject(Constants.PROVINCE_LIST, provinceList);
        modelAndView.setViewName(Constants.USER_REGISTER_JSP);
        return modelAndView;
    }

    @RequestMapping(value= "/register", method = {RequestMethod.POST})
    public ModelAndView registerSubmit(String username, String password, String repeatPassword,
                                       String phone, int selectProvince, int selectCity,
                                       int selectDistrict, String receiverName,
                                       int addressCode, String detailAddress
                                       ) {
        ModelAndView modelAndView = new ModelAndView();
        repeatPassword = repeatPassword.trim();

        // Create user
        User user = new User();
        user.setUsername(username.trim());
        user.setPassword(CookieUtil.encodeCookie(password.trim()));
        user.setPhoneNumber(phone.trim());
        user.setScreenName(username.trim());
        user.setCreateTime(new Date());
        user.setIsEncypted(1);
        user.setIsDelete(0);
        // Create Address
        Address address = new Address();
        address.setProvinceid(selectProvince);
        address.setCityid(selectCity);
        address.setDistrictid(selectDistrict);
        address.setReceiverName(receiverName);
        address.setZipCode(addressCode);
        address.setDetailAddress(detailAddress.trim());
        address.setIsDefault(1);

        try {
            userService.createUserAndAddress(user, address);
            addSession(Constants.FIXED_MESSAGE, Constants.REGISTER_SUCCESS);
        } catch (Exception e) {
            addSession(Constants.FIXED_MESSAGE, Constants.REGISTER_FAILED);
            e.printStackTrace();
        }

        modelAndView.setView(this.getRedirectView(Constants.USER_LOGIN_PAGE));
        return modelAndView;
    }

    @RequestMapping(value= "/profile", method = {RequestMethod.GET})
    public ModelAndView profile() {
        ModelAndView modelAndView = new ModelAndView();
        List<AddressWrapper> addressList = userService.findAddressWrapper(getUserid());
        modelAndView.addObject(Constants.ADDRESS_LIST, addressList);
        modelAndView.setViewName(Constants.USER_PROFILE_JSP);
        return modelAndView;
    }

    @RequestMapping(value= "/profile", method = {RequestMethod.POST})
    public ModelAndView profileSubmit(String screenName, String phone, String email) {
        ModelAndView modelAndView = new ModelAndView();
        User user = getUser();
        if (!Validator.isNullEmptyString(screenName)) {
            user.setScreenName(screenName.trim());
        }
        if (!Validator.isNullEmptyString(phone)) {
            user.setPhoneNumber(phone.trim());
        }
        if (!Validator.isNullEmptyString(email)) {
            user.setEmail(email.trim());
        }
        userService.updateProfile(user);
        addSession(Constants.USER, user);
        addSession(Constants.UPDATE_PROFILE, Constants.SUCCESS);
        modelAndView.setView(this.getRedirectView(Constants.USER_PROFILE_PAGE));
        return modelAndView;
    }

    @RequestMapping(value= "/updatePwd", method = {RequestMethod.POST})
    public ModelAndView updatePwdSubmit(String password, String repeatPassword) {
        ModelAndView modelAndView = new ModelAndView();
        User user = getUser();
        if (!Validator.isNullEmptyString(password) && !Validator.isNullEmptyString(repeatPassword) 
                && password.equals(repeatPassword)) {
            user.setPassword(password);
            userService.updatepwdByUserid(user);
            addSession(Constants.USER, user);
        }
        modelAndView.setView(this.getRedirectView(Constants.USER_LOGOUT_PAGE));
        return modelAndView;
    }

    @RequestMapping(value= "/forgetPassword", method = {RequestMethod.GET})
    public ModelAndView forgetPassword() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(Constants.USER_FORGET_PASSWORD_JSP);
        return modelAndView;
    }

    @RequestMapping(value= "/forgetPassword", method = {RequestMethod.POST})
    public ModelAndView forgetPasswordSubmit(String username, String phone, 
            String password, String repeatPassword) {
        ModelAndView modelAndView = new ModelAndView();
        // Whether login
        if (getUser() == null) {
            User OriginUser = userService.getUserByUserName(username);
            if (!OriginUser.getPhoneNumber().equals(phone)) {
                modelAndView.addObject(Constants.ERROR_MESSAGE, "请输入正确的手机号码");
                modelAndView.setViewName(Constants.USER_FORGET_PASSWORD_JSP);
                return modelAndView;
            }
            OriginUser.setPassword(password);
            userService.updatepwdByUserid(OriginUser);
            addSession(Constants.UPDATE_PWD_SUCCESS, Constants.SUCCESS);
            modelAndView.setView(this.getRedirectView(Constants.USER_LOGIN_PAGE));
        } else {
            User user = getUser();
            user.setPassword(password);
            userService.updatepwdByUserid(user);
            modelAndView.setView(this.getRedirectView(Constants.USER_LOGOUT_PAGE));
        }
        return modelAndView;
    }

    //Ajax
    @RequestMapping(value = "/checkoutUserName", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> checkoutUserName(
           @RequestParam(value = "username", defaultValue = Constants.BLANK) String username) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("valid", userService.checkoutUserName(username));
        return map;
    }

    @RequestMapping(value = "/checkUserName", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> checkUserName(
           @RequestParam(value = "username", defaultValue = Constants.BLANK) String username) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("valid", !userService.checkoutUserName(username));
        return map;
    }

    @RequestMapping(value = "/findCityList", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public List<City> findCityList(
           @RequestParam(value = "provinceid", defaultValue = Constants.BLANK) String provinceid) {
        List<City> cityList = null;
        boolean getProvinceid = !Validator.isNullEmptyString(provinceid) && Validator.isNumber(provinceid);
        if (getProvinceid) {
            cityList = userService.findCityByProvinceId(provinceid);
        }
        return cityList;
    }

    @RequestMapping(value = "/findDistrictList", method = {RequestMethod.POST})
    @ResponseBody
    public List<District> findDistrictList(
           @RequestParam(value = "cityid", defaultValue = Constants.BLANK) String cityid) {
        List<District> districtList = null;
        boolean getCityid = !Validator.isNullEmptyString(cityid) && Validator.isNumber(cityid);
        if (getCityid) {
            districtList = userService.findByCityId(cityid);
        }
        return districtList;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setProvinceService(ProvinceService provinceService) {
        this.provinceService = provinceService;
    }

    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    public void setUserRoleService(UserRoleService userRoleService) {
        this.userRoleService = userRoleService;
    }
}
