package com.milton.shop.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestJDBC {

    private static final String jarName = "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost:3306/onlineshop?useUnicode=true&characterEncoding=utf-8";
    private static final String username = "root";
    public static void main(String[] args) {
        try {
            Class.forName(jarName);
            Connection connection = DriverManager.getConnection(url, username, "");
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM user");
            while (rs.next()) {
                System.out.println(rs.getInt(1));
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        
    }
}
