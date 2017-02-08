package com.milton.shop.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.milton.shop.constants.Constants;
import com.milton.shop.model.Cart;
import com.milton.shop.model.util.CartGoods;
import com.milton.shop.model.wrapper.GoodsWrapper;
import com.milton.shop.service.CartService;
import com.milton.shop.service.GoodsService;
import com.milton.shop.util.CookieUtil;
import com.milton.shop.util.ParamUtil;
import com.milton.shop.util.Validator;

@Controller
@RequestMapping(value = "page/cart")
public class CartController extends BaseController {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private CartService cartService;
    private static final String CART = "cart";

    @RequestMapping(value = "cartList", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView cartList() {
        ModelAndView modelAndView = new ModelAndView();
        // Not login
        if (getSession(Constants.USER) == null) {
            Cookie cartCookie = CookieUtil.getCookie(getRequest(), CART);
            if (cartCookie != null) {
                Map<String, Integer> cartMap = (Map) JSONObject.parse(cartCookie.getValue());
                List<GoodsWrapper>  goodsList = goodsService.findGoodsWrapper(cartMap);
                modelAndView.addObject(Constants.GOODS_LIST, goodsList);
            }
        } else {
            List<Cart> cartList = cartService.findByUserid(getUserid());
            if (!Validator.isNullEmptyCollection(cartList)) {
                List<GoodsWrapper> goodsList = goodsService.findGoodsOnline(cartList);
                modelAndView.addObject(Constants.GOODS_LIST, goodsList);
            }
        }
        modelAndView.setViewName(Constants.CART_LISTL_JSP);
        return modelAndView;
    }

    public int getCartQuantity() {
        if (getSession(Constants.USER) == null) {
            Cookie cartCookie = CookieUtil.getCookie(getRequest(), CART);
            if (cartCookie == null) {
                return 0;
            }
            Map<String, Integer> cartMap = (Map) JSONObject.parse(cartCookie.getValue());
            return cartMap.size();
        }
        return 0;
    }

    public Cookie updateCookie(Map<String, Integer> cartMap) {
        Cookie latestCookie = new Cookie(CART, null);

        // Update or delete
        if (cartMap != null && cartMap.size() > 0) {
            latestCookie.setValue(JSONObject.toJSON(cartMap).toString());
            latestCookie.setMaxAge(8 * 2400);
        } else {
            latestCookie.setMaxAge(0);
        }
        CookieUtil.setCookie(latestCookie, getRequest().getServerName(),
                getRequest().getContextPath());
        int mapSize = 0;
        if (cartMap == null) {
            mapSize = 0;
        } else {
            mapSize = cartMap.size();
        }
        addSession(Constants.CART_QUANTITY, mapSize);
        return latestCookie;
    }

    public void addCartWhenLogin() {
        Cookie cartCookie = CookieUtil.getCookie(getRequest(), CART);
        Map<String, Integer> cartMap = null;
        if (cartCookie != null) {
            cartMap = (Map) JSONObject.parse(cartCookie.getValue());
        }
        // Add cookie cart
        if (cartMap != null && cartMap.size() > 0) {
            Set<String> cartKeySet = cartMap.keySet();
            for (String goodsid : cartKeySet) {
                int goodsidInt = Integer.parseInt(goodsid);
                 int quantity = cartMap.get(goodsid);
                GoodsWrapper goodsWrapper = goodsService.getByPrimaryKey(goodsidInt);
                CartGoods addGoods = new CartGoods(goodsidInt, quantity);
                addCartOnline(goodsWrapper, addGoods);
            }
            // Clear Cookie
            Cookie updateCookie = updateCookie(null);
            getResponse().addCookie(updateCookie);
        }
    }

    //Ajax
    @RequestMapping(value = "/addCart", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public boolean addCart(String goodsid, String quantity) {
        Integer quantityInt = ParamUtil.getInteger(quantity, 0);
        if (!Validator.isPositiveNumber(goodsid) || quantityInt == 0) {
            return false;
        }
        int goodsidInt = Integer.parseInt(goodsid);
        CartGoods addGoods = new CartGoods(goodsidInt, quantityInt);
        GoodsWrapper goodsWrapper = goodsService.getByPrimaryKey(goodsidInt);
        if (goodsWrapper == null || goodsWrapper.getQuantity() <= 0) {
            return false;
        }

        // Whether overFlow
        boolean notOverFlow = false;
        if (getSession(Constants.USER) == null) {
            notOverFlow = addCartCookie(goodsWrapper, addGoods);
        } else {
            notOverFlow = addCartOnline(goodsWrapper, addGoods);
        }

        if (!notOverFlow) {
            return false;
        }
        return true;
    }

    public boolean addCartCookie(GoodsWrapper goodsWrapper, CartGoods addGoods) {
        boolean notOverFlow = true;
        String goodsid = String.valueOf(addGoods.getGoodsid());
        Cookie cartCookie = CookieUtil.getCookie(getRequest(), CART);
        Map<String, Integer> cartMap = null;
        if (cartCookie == null) {
            cartCookie = new Cookie(CART, null);
            cartMap = new HashMap<String, Integer>();
        } else {
            cartMap = (Map) JSONObject.parse(cartCookie.getValue());
        }

        Integer inventory = goodsWrapper.getQuantity();
        Integer newQty = null;
        if (!cartMap.isEmpty() && cartMap.containsKey(goodsid)) {
            // Confirm quantity
            newQty = cartMap.get(goodsid) + addGoods.getQuantity();
        } else {
            newQty = addGoods.getQuantity();
            // Update session qty
            setSessionCartQty(getSessionCartQty() + 1);
        }

        // Update cart
        if (newQty >  inventory) {
            addGoods.setQuantity(inventory);
            notOverFlow = false;
        } else {
            addGoods.setQuantity(newQty);
        }
        cartMap.put(goodsid, addGoods.getQuantity());

        // Update cookie
        Cookie latestCookie = updateCookie(cartMap);
        getResponse().addCookie(latestCookie);
        return notOverFlow;
    }

    public boolean addCartOnline(GoodsWrapper goodsWrapper, CartGoods addGoods) {
        boolean notOverFlow = true;
        Cart conditionCart = new Cart();
        conditionCart.setUserid(getUserid());
        conditionCart.setGoodsid(addGoods.getGoodsid());
        Cart originCart = cartService.getByUseridAndGoodsid(conditionCart);

        Integer inventory = goodsWrapper.getQuantity();
        Integer newQty = null;
        if (originCart == null) {
            // Insert
            newQty = addGoods.getQuantity();
            if (newQty > inventory) {
                addGoods.setQuantity(inventory);
                notOverFlow = false;
            } else {
                addGoods.setQuantity(newQty);
            }
            conditionCart.setQuantity(addGoods.getQuantity());
            conditionCart.setIsPay(0);
            conditionCart.setIsDelete(0);
            cartService.addCart(conditionCart);
            // Update session qty
            setSessionCartQty(getSessionCartQty() + 1);
        } else {
            // Update
            newQty = addGoods.getQuantity() + originCart.getQuantity();
            if (newQty >  inventory) {
                addGoods.setQuantity(inventory);
                notOverFlow = false;
            } else {
                addGoods.setQuantity(newQty);
            }
            originCart.setQuantity(addGoods.getQuantity());
            cartService.updateCart(originCart);
        }
        return notOverFlow;
    }

    @RequestMapping(value = "/deleteCart", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public boolean deleteCart(String goodsid, String quantity) {
        Integer quantityInt = ParamUtil.getInteger(quantity, 0);
        if (!Validator.isPositiveNumber(goodsid) || quantityInt == 0) {
            return false;
        }
        int goodsidInt = Integer.parseInt(goodsid);

        CartGoods deleteGood = new CartGoods(goodsidInt, quantityInt);
        Map<String, Integer> cartMap = null;
        // Not login
        if (getSession(Constants.USER) == null) {
            Cookie cartCookie = CookieUtil.getCookie(getRequest(), CART);
            if (cartCookie == null) {
                return false;
            }
            cartMap = (Map) JSONObject.parse(cartCookie.getValue());
            if (!cartMap.containsKey(goodsid)) {
                return false;
            }

            Integer originQty = cartMap.get(goodsid);
            if (deleteGood.getQuantity() >= originQty) {
                cartMap.remove(goodsid);
            } else {
                cartMap.put(goodsid, originQty - deleteGood.getQuantity());
            }
            // Update cookie
            Cookie latestCookie = updateCookie(cartMap);
            getResponse().addCookie(latestCookie);
        } else {
            Cart conditionsCart = new Cart();
            conditionsCart.setUserid(getUserid());
            conditionsCart.setGoodsid(goodsidInt);
            Cart originCart = cartService.getByUseridAndGoodsid(conditionsCart);
            if (originCart == null) {
                return false;
            }
            Integer originQty = originCart.getQuantity();
            if (deleteGood.getQuantity() >= originQty) {
                cartService.deleteCart(originCart.getCartid());
            } else {
                originCart.setQuantity(originQty - deleteGood.getQuantity());
                cartService.updateCart(originCart);
            }
        }
        return true;
    }

    @RequestMapping(value = "/removeCart", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public boolean removeCart(String goodsid) {
        if (!Validator.isPositiveNumber(goodsid)) {
            return false;
        }
        int goodsidInt = Integer.parseInt(goodsid);

        Map<String, Integer> cartMap = null;
        // Not login
        if (getSession(Constants.USER) == null) {
            Cookie cartCookie = CookieUtil.getCookie(getRequest(), CART);
            if (cartCookie == null) {
                return false;
            }
            cartMap = (Map) JSONObject.parse(cartCookie.getValue());
            if (cartMap == null || cartMap.isEmpty() ||
                    !cartMap.containsKey(goodsid)) {
                return false;
            }

            cartMap.remove(goodsid);
            // Update cookie
            Cookie latestCookie = updateCookie(cartMap);
            getResponse().addCookie(latestCookie);
        } else {
            Cart conditionsCart = new Cart();
            conditionsCart.setUserid(getUserid());
            conditionsCart.setGoodsid(goodsidInt);
            Cart originCart = cartService.getByUseridAndGoodsid(conditionsCart);
            if (originCart == null) {
                return false;
            }
            cartService.deleteCart(originCart.getCartid());
        }
        setSessionCartQty(getSessionCartQty() - 1);
        return true;
    }

    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

}
