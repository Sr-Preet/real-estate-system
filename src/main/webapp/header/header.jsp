<%@ page import="com.real_estate.model.User" %>
<%
    User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Header</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
    <div class="header">
        <h1>Real Estate Management System</h1>
        <div class="navigation">
            <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
            <% if (user != null) { %>
                <a href="<%= request.getContextPath() %>/profile.jsp" style="text-transform: capitalize;"><%= user.getUsername() %></a>
                <a href="<%= request.getContextPath() %>/logout">Logout</a>
                <% if ("admin".equals(user.getRole())) { %>
                    <a href="<%= request.getContextPath() %>/admin">Dashboard</a>
                <% } else { %>
                    <a href="<%= request.getContextPath() %>/user-dashboard.jsp">Dashboard</a>
                <% } %>
            <% } else { %>
                <a href="<%= request.getContextPath() %>/login">Login</a>
            <% } %>
        </div>
    </div>
</body>
</html>
