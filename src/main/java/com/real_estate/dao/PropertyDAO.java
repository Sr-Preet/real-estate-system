package com.real_estate.dao;

import com.real_estate.model.Property;
import com.real_estate.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PropertyDAO {
	private static final String INSERT_PROPERTY_SQL = "INSERT INTO properties (name, location, price, description, image, status) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_PROPERTIES = "SELECT * FROM properties";
    private static final String DELETE_PROPERTY_SQL = "DELETE FROM properties WHERE id = ?";
    private static final String UPDATE_PROPERTY_SQL = "UPDATE properties SET name = ?, location = ?, price = ?, description = ?, image = ?, status = ? WHERE id = ?";
    private static final String UPDATE_PROPERTY_STATUS_SQL = "UPDATE properties SET status = 'sold' WHERE id = ?";
    
    public void addProperty(Property property) {
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PROPERTY_SQL)) {
            preparedStatement.setString(1, property.getName());
            preparedStatement.setString(2, property.getLocation());
            preparedStatement.setDouble(3, property.getPrice());
            preparedStatement.setString(4, property.getDescription());
            preparedStatement.setString(5, property.getImage());
            preparedStatement.setString(6, property.getStatus());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Property> getAllProperties() {
        List<Property> properties = new ArrayList<>();
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PROPERTIES);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String location = rs.getString("location");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                String image = rs.getString("image");
                String status = rs.getString("status");
                properties.add(new Property(id, name, location, price, description, image, status));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return properties;
    }

    public void deleteProperty(int id) {
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PROPERTY_SQL)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProperty(Property property) {
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PROPERTY_SQL)) {
            preparedStatement.setString(1, property.getName());
            preparedStatement.setString(2, property.getLocation());
            preparedStatement.setDouble(3, property.getPrice());
            preparedStatement.setString(4, property.getDescription());
            preparedStatement.setString(5, property.getImage());
            preparedStatement.setString(6, property.getStatus()); // Set status
            preparedStatement.setInt(7, property.getId());
            
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void markAsSold(int id) {
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PROPERTY_STATUS_SQL)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
