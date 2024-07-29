<%@ page import="com.real_estate.model.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    User user = (session != null) ? (User) session.getAttribute("user") : null;
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
</head>
<body>
    <h1>Welcome, <%= user.getUsername() %></h1>
    <p>Email: <%= user.getEmail() %></p>
    <p>Role: <%= user.getRole() %></p>
    <!-- Additional profile information and actions can go here -->
</body>
</html>
