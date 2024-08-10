package com.real_estate.dao;

import com.real_estate.model.User;
import com.real_estate.util.DBUtil; // Make sure this import is present
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private static final String INSERT_USER_SQL = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";
    private static final String SELECT_USER_BY_USERNAME_AND_PASSWORD = "SELECT * FROM users WHERE username = ? AND password = ?";
    private static final String SELECT_USER_BY_ID = "SELECT * FROM users WHERE id = ?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM users";
    private static final String UPDATE_USER_SQL = "UPDATE users SET username = ?, email = ?, role = ? WHERE id = ?";
    private static final String UPDATE_USER_PASSWORD = "UPDATE users SET password = ? WHERE email = ?";



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
                user = new User(id, username, password, role, email);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public User getUserById(int id) {
        User user = null;
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String role = rs.getString("role");
                    String email = rs.getString("email");
                    user = new User();
                    user.setId(id);
                    user.setUsername(username);
                    user.setPassword(password);
                    user.setEmail(email);
                    user.setRole(role);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String role = rs.getString("role");
                users.add(new User(id, username, role, email));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
    
    public void updateUser(User user) {
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_SQL)) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getRole());
            preparedStatement.setInt(4, user.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUserByEmail(String email) {
        String query = "SELECT * FROM users WHERE email = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    User user = new User();
                    user.setId(resultSet.getInt("id"));
                    user.setUsername(resultSet.getString("username"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPassword(resultSet.getString("password"));
                    user.setRole(resultSet.getString("role"));
                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;  // Return null if no user is found
    }
    
    
    public boolean updateUserPassword(String email, String newPassword) {
        boolean rowUpdated = false;
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_PASSWORD)) {
            preparedStatement.setString(1, newPassword);
            preparedStatement.setString(2, email);

            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }
}
