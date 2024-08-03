package com.real_estate.dao;

import com.real_estate.model.Property;
import java.util.List;

public interface IPropertyDAO {
    void addProperty(Property property);
    List<Property> getAllProperties();
    void deleteProperty(int id);
    void updateProperty(Property property);
    void markAsSold(int id);
    Property getPropertyById(int id);
    List<Property> getSoldProperties();
}
