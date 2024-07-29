package com.real_estate.controller;

import com.real_estate.dao.PropertyDAO;
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !"user".equals(user.getRole())) {
            response.sendRedirect("login");
            return;
        }

        String propertyIdStr = request.getParameter("propertyId");
        if (propertyIdStr != null && !propertyIdStr.trim().isEmpty()) {
            try {
                int propertyId = Integer.parseInt(propertyIdStr);
                propertyDAO.markAsSold(propertyId);
                response.sendRedirect("property");
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("property?error=invalid");
            }
        } else {
            response.sendRedirect("property?error=missingId");
        }
    }
}
