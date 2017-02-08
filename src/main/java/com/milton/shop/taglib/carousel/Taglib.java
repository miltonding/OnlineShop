package com.milton.shop.taglib.carousel;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.milton.shop.constants.Constants;
import com.milton.shop.util.Validator;

public class Taglib extends BodyTagSupport {

    /** 
     * 修改标签体内容 
     * 
     */ 
    private String id;

    @Override  
    public int doEndTag() throws JspException {
        //获取标签体内容对象  
        BodyContent bodyContent = this.getBodyContent();
        String content = bodyContent.getString();

        List<Map<String, String>> imageList = new ArrayList<>();

        Document doc = Jsoup.parse(content);
        Elements imgArray = doc.select("img");
        if (imgArray != null && imgArray.size() > 0) {
            for (Element image : imgArray) {
                Map<String, String> imageMap = new HashMap<>();
                String src = image.attr("src");
                String link = image.attr("link");
                String title = image.attr("title");
                if (Validator.isNullEmptyString(src)) {
                    src = Constants.BLANK;
                }
                if (Validator.isNullEmptyString(link)) {
                    link = Constants.VOID_ZERO;
                }
                if (Validator.isNullEmptyString(title)) {
                    title = Constants.VOID_ZERO;
                }
                imageMap.put("src", src);
                imageMap.put("link", link);
                imageMap.put("title", link);
                imageList.add(imageMap);
            }
            content = getContent(imageList);
        }

        try {  
            this.pageContext.getOut().write(content);//在将转化之后的内容输出到浏览器中  
        } catch (IOException e) {  
            throw new RuntimeException(e);  
        }  

        return BodyTagSupport.EVAL_BODY_INCLUDE;  
    }  
 
    public String getContent(List<Map<String, String>> imageList) {
        StringBuffer blockBuffer = new StringBuffer();
        blockBuffer.append("<div id='" + id + "' role='plain-carousel' class='carousel-wrapper'>\n");
        blockBuffer.append("  <div id='item-animation'>\n");

        blockBuffer.append("    <!-- main part-->\n");
        blockBuffer.append("      <ul class='slider_item' id='move_block'>\n");

        int i = 0;
        for (Map<String, String> image :imageList) {
            if (i == 0) {
                blockBuffer.append("        <li class='slider_item slider_show'>\n");
            } else {
                blockBuffer.append("        <li class='slider_item slider_hide'>\n");
            }

            blockBuffer.append("          <a href='" + image.get("link") + "' title = '" + image.get("title") + "'target='_blank'>\n");
            blockBuffer.append(String.format("            <img src='%s' alt='%s' class='slider_item'/>\n",
                                        image.get("src"), image.get("src")));
            blockBuffer.append("          </a>\n");
            blockBuffer.append("        </li>\n");
            i++;
        }


        blockBuffer.append("    <!-- indicator-->\n");
        blockBuffer.append("      <ul class='slider_indicator'>\n");
        if (imageList.size() == 1) {
            blockBuffer.append("        <li class='slider_indicator_btn slider_indicator_active slider_indicator_btn_last'></li>\n");
        } else {
            int index = 0;
            for (Map<String, String> image :imageList) {
                if (index == 0) {
                    blockBuffer.append("        <li class='slider_indicator_btn slider_indicator_active'></li>\n");
                } else if (index == (imageList.size() - 1)) {
                    blockBuffer.append("        <li class='slider_indicator_btn slider_indicator_btn_last'></li>\n");
                } else {
                    blockBuffer.append("        <li class='slider_indicator_btn'></li>\n");
                }
                index++;
            }
        }
        blockBuffer.append("      </ul>\n");

        blockBuffer.append("    <!-- prev-->\n");
        blockBuffer.append("    <a href='javascript:void(0);' class='slider_control_prev slider_control_font'>&lt;</a>\n");
        blockBuffer.append("    <!-- next-->\n");
        blockBuffer.append("    <a href='javascript:void(0);' class='slider_control_next slider_control_font'>&gt;</a>\n");
        blockBuffer.append("  </div>\n");
        blockBuffer.append("</div>\n");
      return blockBuffer.toString();
    }

    @Override  
    public int doStartTag() throws JspException {
        //这里返回缓存标签体内容常量  
        return BodyTagSupport.EVAL_BODY_BUFFERED;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
