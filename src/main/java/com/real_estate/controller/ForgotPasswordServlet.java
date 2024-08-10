package com.real_estate.controller;

import com.real_estate.dao.UserDAO;
import com.real_estate.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ForgotPasswordServlet", urlPatterns = {"/forgot-password"})
public class ForgotPasswordServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        User user = userDAO.getUserByEmail(email);

        if (user != null) {
            request.setAttribute("email", email);
            request.getRequestDispatcher("/reset-password.jsp").forward(request, response);
        } else {
            response.sendRedirect("forgot-password.jsp?error=notfound");
        }
    }
}
