package com.milton.shop.taglib.upload;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import com.milton.shop.constants.Constants;
import com.milton.shop.taglib.util.TagTemple;
import com.milton.shop.util.Validator;

public class Taglib extends TagSupport {

    private static final long serialVersionUID = 1L;

    // Required
    private String name;
    private String action;

    // Not Required
    private String type;
    private String src;
    private String tip;
    private String chooseText;
    private String uploadText;
    private String progress;

    private Map<String, Object> paramMap = new HashMap<>();

    private static final String COMMON = "common";
    private static final String IMAGE = "image";
    private static final String COMMON_TIP = "新选择文件";
    private static final String IMAGE_TIP = "仅支持JPG、GIF、PNG、JPEG、BMP格式，文件小于4M";
    private static final String CHOOSE_TEXT = "选择文件";
    private static final String UPLOAD_TEXT = "上传文件";
    private static final String PROGRESS = "20%";

    @Override
    public int doStartTag() throws JspTagException {
        //return TagSupport.EVAL_BODY_INCLUDE;//输出标签体内容  
        return TagSupport.SKIP_BODY;//不输出标签体内容  
    }

    public void init() {
        if (!Validator.isNullEmptyString(type) && 
                IMAGE.equals(type.trim().toLowerCase())) {
            type = IMAGE;
        } else {
            type = COMMON;
        }

        if (Validator.isNullEmptyString(src)) {
            src = Constants.BLANK;
        }

        if (Validator.isNullEmptyString(tip)) {
            if (COMMON.equals(type.toLowerCase())) {
                tip = COMMON_TIP;
            } else if (IMAGE.equals(type.toLowerCase())) {
                tip = IMAGE_TIP;
            }
        }
        if (Validator.isNullEmptyString(chooseText)) {
            chooseText = CHOOSE_TEXT;
        }
        if (Validator.isNullEmptyString(uploadText)) {
            uploadText = UPLOAD_TEXT;
        }
        if (Validator.isNullEmptyString(progress)) {
            progress = PROGRESS;
        }
        paramMap.put("name", name);
        paramMap.put("action", action);
        paramMap.put("type", type);
        paramMap.put("src", src);
        paramMap.put("tip", tip);
        paramMap.put("chooseText", chooseText);
        paramMap.put("uploadText", uploadText);
        paramMap.put("progress", progress);
    }
    @Override
    public int doEndTag() throws JspTagException {
        init();
        String content = getContent();
        try {
            //然后在页面上输出
            JspWriter out = pageContext.getOut();
            out.println(content);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return EVAL_PAGE;
    }

    public String getContent() {
        TagTemple tagTemple = new TagTemple();
        try {
            tagTemple.load(this.getClass(), "upload.ftl");
            tagTemple.process(paramMap);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tagTemple.getStringWriter().toString();
    }

    @Override
    public void release() {
        super.release();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String getChooseText() {
        return chooseText;
    }

    public void setChooseText(String chooseText) {
        this.chooseText = chooseText;
    }

    public String getUploadText() {
        return uploadText;
    }

    public void setUploadText(String uploadText) {
        this.uploadText = uploadText;
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }
}
