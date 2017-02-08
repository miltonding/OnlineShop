package com.milton.shop.test;

import com.milton.shop.util.CookieUtil;

public class TestCookie {

    public static void main(String[] args) {
        System.out.println(CookieUtil.encodeCookie("admin.milton@shop.com"));
        System.out.println(CookieUtil.decodeCookie("WUPrYU2sZUjqbE7sOFLmZ1.sW07r"));
    }
}
