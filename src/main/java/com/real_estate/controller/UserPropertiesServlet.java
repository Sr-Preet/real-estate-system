package com.real_estate.controller;

import com.real_estate.dao.PropertyDAO;
import com.real_estate.dao.TransactionDAO;
import com.real_estate.model.Property;
import com.real_estate.model.Transaction;
import com.real_estate.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/user-properties")
public class UserPropertiesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TransactionDAO transactionDAO = new TransactionDAO();
    private PropertyDAO propertyDAO = new PropertyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Fetch transactions for the logged-in user
        List<Transaction> transactions = transactionDAO.getTransactionsByUserId(user.getId());
        List<Property> properties = new ArrayList<>();

        for (Transaction transaction : transactions) {
            Property property = propertyDAO.getPropertyById(transaction.getPropertyId());
            properties.add(property);
        }

        // Set properties in request scope
        request.setAttribute("properties", properties);
        request.getRequestDispatcher("/user-properties.jsp").forward(request, response);
    }
}
