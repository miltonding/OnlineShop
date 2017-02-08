package com.milton.shop.taglib;
import java.io.IOException;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class BlockTaglib extends TagSupport {

    private static final long serialVersionUID = 1L;
    //block id
    private String id;

    @Override
    public int doStartTag() throws JspTagException {
        //return TagSupport.EVAL_BODY_INCLUDE;//输出标签体内容  
        return TagSupport.SKIP_BODY;//不输出标签体内容  
    }

    @Override
    public int doEndTag() throws JspTagException {
        // Obtain from spring container
        /*ApplicationContext applicationContext = SpringUtil.getApplicationContext();
        BlockAbstract block = (BlockAbstract) applicationContext.getBean(name);*/

        // 生成html代码
        //String content = block.displayBlock(pageContext);
        String content = getContent();

        //然后在页面上输出
        JspWriter out = pageContext.getOut();
        try {
            out.println(content);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return EVAL_PAGE;
    }

    public String getContent() {
        StringBuffer blockBuffer = new StringBuffer();
      return blockBuffer.toString();
    }

    @Override
    public void release() {
        super.release();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
