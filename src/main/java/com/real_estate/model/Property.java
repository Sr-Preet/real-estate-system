package com.real_estate.model;

public class Property {
    private int id;
    private String name;
    private String location;
    private double price;
    private String description;
    private String image; // Base64 encoded image string
    private String status;  // New field

    public Property(int id, String name, String location, double price, String description, String image, String status) {
        this.id = id;
        this.name = name;
        this.location = location;
        this.price = price;
        this.description = description;
        this.image = image;
        this.status = status;
    }

    // Constructor for adding a new property
    public Property(String name, String location, double price, String description, String image) {
        this.name = name;
        this.location = location;
        this.price = price;
        this.description = description;
        this.image = image;
        this.status = "available"; // Default status
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
}
