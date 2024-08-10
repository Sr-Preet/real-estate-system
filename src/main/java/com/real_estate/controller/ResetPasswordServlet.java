package com.real_estate.controller;

import com.real_estate.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ResetPasswordServlet", urlPatterns = {"/reset-password"})
public class ResetPasswordServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");

        boolean isUpdated = userDAO.updateUserPassword(email, newPassword);

        if (isUpdated) {
            response.sendRedirect("login?reset=success");
        } else {
            response.sendRedirect("reset-password.jsp?error=true");
        }
    }
}
