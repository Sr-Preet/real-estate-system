package com.real_estate.controller;

import com.real_estate.dao.TransactionDAO;
import com.real_estate.model.PropertyTransactionDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/sold_properties")
public class AdminSoldPropertiesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TransactionDAO transactionDAO = new TransactionDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<PropertyTransactionDTO> soldProperties = transactionDAO.getAllSoldProperties();
        request.setAttribute("soldProperties", soldProperties);
        request.getRequestDispatcher("/admin-sold-properties.jsp").forward(request, response);
    }
}
