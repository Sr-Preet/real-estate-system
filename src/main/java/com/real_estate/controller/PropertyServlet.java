package com.real_estate.controller;

import com.real_estate.dao.PropertyDAO;
import com.real_estate.model.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;

//@WebServlet("/property")
public class PropertyServlet extends HttpServlet {
    private static final long serialVersionUID = 3207005023808446852L;
    private PropertyDAO propertyDAO = new PropertyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Property> properties = propertyDAO.getAllProperties();
        request.setAttribute("properties", properties);
        request.getRequestDispatcher("/property.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");

        Part filePart = request.getPart("image");
        String base64Image = "";
        if (filePart != null) {
            InputStream inputStream = filePart.getInputStream();
            byte[] bytes = inputStream.readAllBytes();
            base64Image = Base64.getEncoder().encodeToString(bytes);
        }

        Property property = new Property(name, location, price, description, base64Image);
        propertyDAO.addProperty(property);

        response.sendRedirect("property.jsp");
    }
}
