package com.real_estate;

import com.real_estate.util.DBUtil;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebListener
public class AppInitializer implements ServletContextListener {
    public void contextInitialized(ServletContextEvent sce) {
        try (Connection connection = DBUtil.getConnection();
             Statement statement = connection.createStatement()) {
            // Create tables if they don't exist
            statement.execute("CREATE TABLE IF NOT EXISTS users (id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(50), email VARCHAR(50), password VARCHAR(50))");
            statement.execute("CREATE TABLE IF NOT EXISTS properties (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50), location VARCHAR(50), price DOUBLE)");
            statement.execute("CREATE TABLE IF NOT EXISTS transactions (id INT AUTO_INCREMENT PRIMARY KEY, user_id INT, property_id INT, amount DOUBLE, FOREIGN KEY (user_id) REFERENCES users(id), FOREIGN KEY (property_id) REFERENCES properties(id))");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {
        // Cleanup code if necessary
    }
}
