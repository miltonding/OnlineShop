package com.milton.shop.taglib.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.StringWriter;
import java.util.Map;

import com.milton.shop.constants.Constants;
import com.milton.shop.taglib.upload.Taglib;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class TagTemple {
    //模版配置对象
    private Configuration configuration;
    private Template template;
    private StringWriter stringWriter = new StringWriter();

    public TagTemple() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void load(Class<?> clazz, String fileName) throws Exception {
        String rootPath = clazz.getResource(Constants.BLANK).getPath().substring(1);
        //初始化FreeMarker配置
        //创建一个Configuration实例
        configuration = new Configuration();
        //设置FreeMarker的模版文件夹位置
        configuration.setDirectoryForTemplateLoading(new File(rootPath));
        template = configuration.getTemplate(fileName);
    }

    public void process(Map<String, Object> paramMap) throws Exception {
        template.setEncoding("UTF-8");
        //在模版上执行插值操作，并输出到制定的输出流中
        BufferedWriter writer = new BufferedWriter(stringWriter);
        template.process(paramMap, writer);
    }

    public static void main(String[] args) throws Exception {
        /*TagTemple tagTemple = new TagTemple();
        tagTemple.load(rootPath, fileName);*/
        String rootPath = Taglib.class.getResource(Constants.BLANK).getPath().substring(1);
        rootPath = rootPath.substring(0, rootPath.length() - 1);
        System.out.println(rootPath);
    }

    public Configuration getConfiguration() {
        return configuration;
    }

    public void setConfiguration(Configuration configuration) {
        this.configuration = configuration;
    }

    public Template gettemplate() {
        return template;
    }

    public void settemplate(Template template) {
        this.template = template;
    }

    public StringWriter getStringWriter() {
        return stringWriter;
    }

    public void setStringWriter(StringWriter stringWriter) {
        this.stringWriter = stringWriter;
    }
}
