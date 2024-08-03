<%@ page import="com.real_estate.model.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
    <%@ include file="header/header.jsp" %>
    <%
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

    <div class="dashboard-container">
        <h1 class="dashboard-header">User Dashboard</h1>
    </div>

    <%@ include file="footer/footer.jsp" %>
</body>
</html>
