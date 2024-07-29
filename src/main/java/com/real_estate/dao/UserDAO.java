package com.real_estate.dao;

import com.real_estate.model.User;
import com.real_estate.util.DBUtil; // Make sure this import is present
import java.sql.*;

public class UserDAO {
    private static final String INSERT_USER_SQL = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";
    private static final String SELECT_USER_BY_USERNAME_AND_PASSWORD = "SELECT * FROM users WHERE username = ? AND password = ?";

    public void addUser(User user) {
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getRole());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUserByUsernameAndPassword(String username, String password) {
        User user = null;
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERNAME_AND_PASSWORD)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String email = rs.getString("email");
                String role = rs.getString("role");
                user = new User(id, username, email, password, role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
