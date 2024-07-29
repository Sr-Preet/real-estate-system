<%@ page import="com.real_estate.model.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sessionObj = request.getSession(false); // Renamed the variable to avoid duplication
    User user = (sessionObj != null) ? (User) sessionObj.getAttribute("user") : null;
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h1>User Dashboard</h1>
    <p>Welcome, <%= user.getUsername() %></p>
    
    <p><a href="property">View Properties</a></p>
    <!-- User dashboard content here -->
</body>
</html>

