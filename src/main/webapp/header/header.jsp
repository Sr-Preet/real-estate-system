<%@ page import="com.real_estate.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return; // Ensure that no further code is executed
    }
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    
</head>
<body>
    <div class="header">
        <h1>Real Estate Management System</h1>
        <div class="navigation">
            <div class="nav-left">
                <%-- <a href="<%= request.getContextPath() %>/index.jsp">Home</a> --%>
                <% if (user != null) { %>
                    <% if ("admin".equals(user.getRole())) { %>
                        <a href="<%= request.getContextPath() %>/admin">Dashboard</a>
                        <a href="<%= request.getContextPath() %>/addProperty.jsp">Add New Property</a>
                        <a href="<%= request.getContextPath() %>/sold_properties.jsp">Sold Properties</a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/list-users.jsp">List Users</a>
                    <% } else { %>
                        <%-- <a href="<%= request.getContextPath() %>/user-dashboard.jsp">Dashboard</a> --%>
                        <a href="<%= request.getContextPath() %>/property">Buy Properties</a>
                        <a href="<%= request.getContextPath() %>/user-properties">My Purchased Properties</a>
                    <% } %>
                <% } %>
            </div>
            <div class="nav-right">
                <% if (user != null) { %>
                    <a href="<%= request.getContextPath() %>/profile.jsp" style="text-transform: capitalize;">Hi <%= user.getUsername() %>!</a>
                    <a href="<%= request.getContextPath() %>/logout">Logout</a>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>
