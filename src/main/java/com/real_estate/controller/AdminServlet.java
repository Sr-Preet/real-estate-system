package com.real_estate.controller;

import com.real_estate.dao.PropertyDAO;
import com.real_estate.model.Property;
import com.real_estate.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminServlet", urlPatterns = {"/admin"})
public class AdminServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = -7796934002334217858L;
	private PropertyDAO propertyDAO = new PropertyDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !"admin".equals(user.getRole())) {
            response.sendRedirect("login");
            return;
        }

        List<Property> properties = propertyDAO.getAllProperties();

        request.setAttribute("properties", properties);
        request.getRequestDispatcher("admin-dashboard.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int propertyId = Integer.parseInt(request.getParameter("propertyId"));
            propertyDAO.deleteProperty(propertyId);
        }

        response.sendRedirect("admin");
    }
}
