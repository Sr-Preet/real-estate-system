package com.real_estate.model;

public class PropertyTransactionDTO {
    private int propertyId;
    private String name;
    private String location;
    private double price;
    private String description;
    private String image;
    private String status;
    private String buyerName; // or any other relevant field

    public PropertyTransactionDTO(int propertyId, String name, String location, double price, String description, String image, String status, String buyerName) {
        this.propertyId = propertyId;
        this.name = name;
        this.location = location;
        this.price = price;
        this.description = description;
        this.image = image;
        this.status = status;
        this.buyerName = buyerName;
    }

    // Getters and Setters

    public int getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(int propertyId) {
        this.propertyId = propertyId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName;
    }
}
