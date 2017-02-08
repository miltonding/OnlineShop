package com.milton.shop.test;

import java.io.File;
import java.io.IOException;

public class TestFile {

    public static void main(String[] args) {
        /*File newFile = null;
        File file = new File("G://123");
        try {
            newFile = new File(file.getAbsolutePath() ,"123.txt");
            newFile.createNewFile();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        System.out.println(newFile);*/
        String name = "G:\\apache-tomcat-7.0.56-windows-i64\\apache-tomcat-7.0.56\\webapps\\miltonshopn";
        File file = new File(name);
        File parentFile = file.getParentFile().getParentFile();
        System.out.println(parentFile.getAbsolutePath());
        file.mkdirs();
        
        
    }
}
