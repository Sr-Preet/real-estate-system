package com.real_estate.dao;

import com.real_estate.model.Transaction;
import com.real_estate.model.PropertyTransactionDTO;

import com.real_estate.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {
    private static final String INSERT_TRANSACTION_SQL = "INSERT INTO transactions (user_id, property_id, amount) VALUES (?, ?, ?)";
    private static final String SELECT_TRANSACTIONS_BY_PROPERTY_ID_SQL = "SELECT * FROM transactions WHERE property_id = ?";
    private static final String SELECT_TRANSACTIONS_BY_USER_ID_SQL = "SELECT * FROM transactions WHERE user_id = ?";
    private static final String GET_ALL_SOLD_PROPERTIES_SQL = 
            "SELECT p.id AS property_id, p.name, p.location, p.price, p.description, p.image, p.status, u.username " +
            "FROM transactions t " +
            "JOIN properties p ON t.property_id = p.id " +
            "JOIN users u ON t.user_id = u.id " +
            "WHERE p.status = 'sold'";

    public void addTransaction(Transaction transaction) {
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TRANSACTION_SQL)) {
            preparedStatement.setInt(1, transaction.getUserId());
            preparedStatement.setInt(2, transaction.getPropertyId());
            preparedStatement.setDouble(3, transaction.getAmount());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Transaction> getTransactionsByPropertyId(int propertyId) {
        List<Transaction> transactions = new ArrayList<>();
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TRANSACTIONS_BY_PROPERTY_ID_SQL)) {
            preparedStatement.setInt(1, propertyId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    int userId = rs.getInt("user_id");
                    double amount = rs.getDouble("amount");
                    transactions.add(new Transaction(id, userId, propertyId, amount));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }

    public List<Transaction> getTransactionsByUserId(int userId) {
        List<Transaction> transactions = new ArrayList<>();
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TRANSACTIONS_BY_USER_ID_SQL)) {
            preparedStatement.setInt(1, userId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    int propertyId = rs.getInt("property_id");
                    double amount = rs.getDouble("amount");
                    transactions.add(new Transaction(id, userId, propertyId, amount));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }

    public List<PropertyTransactionDTO> getAllSoldProperties() {
        List<PropertyTransactionDTO> propertyTransactionList = new ArrayList<>();
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_SOLD_PROPERTIES_SQL);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                int propertyId = rs.getInt("property_id");
                String name = rs.getString("name");
                String location = rs.getString("location");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                String image = rs.getString("image");
                String status = rs.getString("status");
                String buyerName = rs.getString("username");

                PropertyTransactionDTO dto = new PropertyTransactionDTO(
                    propertyId, name, location, price, description, image, status, buyerName);
                propertyTransactionList.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return propertyTransactionList;
    }
}
