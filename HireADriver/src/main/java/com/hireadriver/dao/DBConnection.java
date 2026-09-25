package com.hireadriver.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/hireadriver?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Kolkata";

    private static final String USER = "root";

    private static final String PASSWORD = "root";

    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection =
                    DriverManager.getConnection(URL, USER, PASSWORD);

            System.out.println("MySQL Connected Successfully!");

            return connection;

        } catch (ClassNotFoundException e) {

            System.out.println("MySQL Driver Not Found!");
            e.printStackTrace();

        } catch (SQLException e) {

            System.out.println("MySQL Connection Failed!");
            e.printStackTrace();
        }

        return null;
    }
}