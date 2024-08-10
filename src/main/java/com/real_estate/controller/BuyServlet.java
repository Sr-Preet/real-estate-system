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

@WebServlet("/buy")
public class BuyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PropertyDAO propertyDAO = new PropertyDAO();
    private TransactionDAO transactionDAO = new TransactionDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int propertyId = Integer.parseInt(request.getParameter("propertyId"));
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user != null && "user".equals(user.getRole())) {
            Property property = propertyDAO.getPropertyById(propertyId);
            if (property != null && "available".equals(property.getStatus())) {
                double amount = property.getPrice(); // Assuming the amount to be the property price
                Transaction transaction = new Transaction(user.getId(), propertyId, amount);
                transactionDAO.addTransaction(transaction);
                
                // Update property status
                property.setStatus("sold");
                propertyDAO.updateProperty(property);

                response.sendRedirect("user-properties");
            } else {
                response.sendRedirect("error.jsp"); // Or some error handling
            }
        } else {
            response.sendRedirect("login"); // Redirect to login if not authenticated
        }
    }
}
