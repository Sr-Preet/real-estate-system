package com.real_estate.dao;

public class DAOFactory {

    public static IPropertyDAO getPropertyDAO() {
        return new PropertyDAO();
    }
}
