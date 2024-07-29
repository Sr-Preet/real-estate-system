package com.real_estate.model;

public class Transaction {
    private int id;
    private int userId;
    private int propertyId;
    private double amount;

    // Default constructor
    public Transaction() {
    }

    // Constructor with all fields
    public Transaction(int id, int userId, int propertyId, double amount) {
        this.id = id;
        this.userId = userId;
        this.propertyId = propertyId;
        this.amount = amount;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(int propertyId) {
        this.propertyId = propertyId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
}
