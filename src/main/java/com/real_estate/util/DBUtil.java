package com.real_estate.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/real_estate_db";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "12345";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new SQLException("Error connecting to database", e);
        }
    }

    // Add method to close connections, statements, and result sets if necessary
}
