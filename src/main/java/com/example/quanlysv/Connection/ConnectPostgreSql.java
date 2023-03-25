package com.example.quanlysv.Connection;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectPostgreSql {
    public static Connection Conn = null;
    private static String filePathEnv = "C:\\Users\\Admins\\OneDrive\\Desktop\\Self_Learn\\quanlysv\\src\\main\\resources\\dataConnection.env"; // copy path của file dataConnection.env
    public static void ConnectDatabase() {
        // Load the environment file
        Properties props = new Properties();
        try {
            FileInputStream envFile = new FileInputStream(filePathEnv);
            props.load(envFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // Get the properties
        String url = props.getProperty("URL");
        String user = props.getProperty("USER");
        String password = props.getProperty("PASSWORD");
        String driver=props.getProperty("DRIVER");
        // Connect to PostgreSQL
        try {
            Class.forName( driver);
            Conn = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
