package com.real_estate.dao;

import com.real_estate.model.Transaction;
import com.real_estate.utils.DBUtil;

import java.sql.*;

public class TransactionDAO {
    private static final String INSERT_TRANSACTION_SQL = "INSERT INTO transactions (user_id, property_id, amount) VALUES (?, ?, ?)";

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
}
