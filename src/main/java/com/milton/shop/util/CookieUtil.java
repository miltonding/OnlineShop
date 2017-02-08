package com.milton.shop.util;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {


    /**
     *
     * @param response HttpServletResponse类型的响应
     * @param cookie 要设置httpOnly的cookie对象
     */
    public static void addHttpOnlyCookie(HttpServletResponse response,
            Cookie cookie) {
        // 判断对象是否存在null的情况
        if (checkObjIsNull(response) || checkObjIsNull(cookie)) {
            return;
        }

        //依次取得cookie中的名称、值、最大生存时间、路径、域和是否为安全协议信息
        String cookieName = cookie.getName();
        String cookieValue = cookie.getValue();
        int maxAge = cookie.getMaxAge();
        String path = cookie.getPath();
        String domain = cookie.getDomain();
        boolean isSecure = cookie.getSecure();

        StringBuffer strBufferCookie = new StringBuffer();
        strBufferCookie.append(cookieName + "=" + cookieValue + ";");

        if (maxAge >= 0) {
            strBufferCookie.append("Max-Age=" + maxAge + ";");
        } else {
            strBufferCookie.append("Max-Age=25;");
        }

        if (!checkObjIsNull(domain)) {
            strBufferCookie.append("domain=" + domain + ";");
        }

        if (!checkObjIsNull(path)) {
            strBufferCookie.append("path=" + path + ";");
        }

        if (isSecure) {
            strBufferCookie.append("HttpOnly;Secure;");
        } else {
            strBufferCookie.append("HttpOnly;");
        }

        response.addHeader("Set-Cookie", strBufferCookie.toString());
    }

    public static void setCookie(Cookie cookie, String domain, String path) {
        if (cookie == null || Validator.isNullEmptyString(domain) 
                || Validator.isNullEmptyString(path)) {
            return;
        }
        cookie.setDomain(domain);
        cookie.setPath(path);
    }

    private static boolean checkObjIsNull(Object obj) {
        if (obj == null) {
            return true;
        }
        return false;
    }

    /**
     * cookie中的值加密
     */
    public static String encodeCookie(String value){
        String encode = "";
        byte bytes[];
        try {
            bytes = value.getBytes("utf-8");
            encode = encode_base64(bytes,bytes.length);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return encode;
    }
    /**
     * cookie中值解密
     */
    public static String decodeCookie(String value){
        byte bytes[];
        String decode = "";
        try {
            bytes = decode_base64(value, 64);
            decode = new String(bytes,"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return decode;
    }

    static private final char base64_code[] = {
        '.', '/', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
        'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
        'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
        'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
        'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5',
        '6', '7', '8', '9'
    };

    // Table for Base64 decoding
    static private final byte index_64[] = {
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
        -1, -1, -1, -1, -1, -1, 0, 1, 54, 55,
        56, 57, 58, 59, 60, 61, 62, 63, -1, -1,
        -1, -1, -1, -1, -1, 2, 3, 4, 5, 6,
        7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
        17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
        -1, -1, -1, -1, -1, -1, 28, 29, 30,
        31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
        41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
        51, 52, 53, -1, -1, -1, -1, -1
    };
    private static String encode_base64(byte d[], int len)  throws IllegalArgumentException {
        int off = 0;
        StringBuffer rs = new StringBuffer();
        int c1, c2;

        if (len <= 0 || len > d.length)
            throw new IllegalArgumentException ("Invalid len");

        while (off < len) {
            c1 = d[off++] & 0xff;
            rs.append(base64_code[(c1 >> 2) & 0x3f]);
            c1 = (c1 & 0x03) << 4;
            if (off >= len) {
                rs.append(base64_code[c1 & 0x3f]);
                break;
            }
            c2 = d[off++] & 0xff;
            c1 |= (c2 >> 4) & 0x0f;
            rs.append(base64_code[c1 & 0x3f]);
            c1 = (c2 & 0x0f) << 2;
            if (off >= len) {
                rs.append(base64_code[c1 & 0x3f]);
                break;
            }
            c2 = d[off++] & 0xff;
            c1 |= (c2 >> 6) & 0x03;
            rs.append(base64_code[c1 & 0x3f]);
            rs.append(base64_code[c2 & 0x3f]);
        }
        return rs.toString();
    }
    private static byte char64(char x) {
        if (x < 0 || x > index_64.length)
            return -1;
        return index_64[x];
    }
    private static byte[] decode_base64(String s, int maxolen) throws IllegalArgumentException {
        StringBuffer rs = new StringBuffer();
        int off = 0, slen = s.length(), olen = 0;
        byte ret[];
        byte c1, c2, c3, c4, o;

        if (maxolen <= 0)
            throw new IllegalArgumentException ("Invalid maxolen");
        while (off < slen - 1 && olen < maxolen) {
            c1 = char64(s.charAt(off++));
            c2 = char64(s.charAt(off++));
            if (c1 == -1 || c2 == -1)
                break;
            o = (byte)(c1 << 2);
            o |= (c2 & 0x30) >> 4;
            rs.append((char)o);
            if (++olen >= maxolen || off >= slen)
                break;
            c3 = char64(s.charAt(off++));
            if (c3 == -1)
                break;
            o = (byte)((c2 & 0x0f) << 4);
            o |= (c3 & 0x3c) >> 2;
            rs.append((char)o);
            if (++olen >= maxolen || off >= slen)
                break;
            c4 = char64(s.charAt(off++));
            o = (byte)((c3 & 0x03) << 6);
            o |= c4;
            rs.append((char)o);
            ++olen;
        }

        ret = new byte[olen];
        for (off = 0; off < olen; off++)
            ret[off] = (byte)rs.charAt(off);
        return ret;
    }

    public static Cookie getCookie(HttpServletRequest request, String key) {
        Cookie returnCookie = null;
        Cookie[] cookies = request.getCookies();
        if (Validator.isNullEmptyArray(cookies) || Validator.isNullEmptyString(key)) {
            return null;
        }

        for (Cookie cookie : cookies) {
            if (key.equals(cookie.getName())) {
                returnCookie = cookie;
                break;
            }
        }
        return returnCookie;
    }

    public static void main(String[] args) {
        System.out.println(encodeCookie("abc123_"));
        for (int i = 46; i <= 116; i++) {
            String sql = "insert into inventory (goodsid, quantity) "
                    + "values (%d, %d);";
            System.out.println(String.format(sql, i, 100));
        }
    }
}
