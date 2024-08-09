package com.real_estate;

import com.real_estate.util.DBUtil;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebListener
public class AppInitializer implements ServletContextListener {
    private static final String ADMIN_USERNAME = "admin";
    private static final String ADMIN_EMAIL = "admin@email.com";
    private static final String ADMIN_PASSWORD = "admin";
    private static final String ADMIN_ROLE = "admin";

    public void contextInitialized(ServletContextEvent sce) {
        try (Connection connection = DBUtil.getConnection();
             Statement statement = connection.createStatement()) {
            // Create tables if they don't exist
            statement.execute("CREATE TABLE IF NOT EXISTS users (id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(50), email VARCHAR(50), password VARCHAR(50))");
            statement.execute("CREATE TABLE IF NOT EXISTS properties (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50), location VARCHAR(50), price DOUBLE)");
            statement.execute("CREATE TABLE IF NOT EXISTS transactions (id INT AUTO_INCREMENT PRIMARY KEY, user_id INT, property_id INT, amount DOUBLE, FOREIGN KEY (user_id) REFERENCES users(id), FOREIGN KEY (property_id) REFERENCES properties(id))");

            // Check if the admin user exists
            if (!adminUserExists(connection)) {
                createAdminUser(connection);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private boolean adminUserExists(Connection connection) throws SQLException {
        String query = "SELECT COUNT(*) FROM users WHERE username = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, ADMIN_USERNAME);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
                return false;
            }
        }
    }

    private void createAdminUser(Connection connection) throws SQLException {
        String query = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, ADMIN_USERNAME);
            pstmt.setString(2, ADMIN_EMAIL);
            pstmt.setString(3, ADMIN_PASSWORD);
            pstmt.setString(4, ADMIN_ROLE);
            pstmt.executeUpdate();
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {
        // Cleanup code
    }
}
