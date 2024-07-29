<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.real_estate.model.User" %>
<%
    HttpSession sessionObj = request.getSession(false); // Rename the variable to avoid duplication
    User user = (sessionObj != null) ? (User) sessionObj.getAttribute("user") : null;
    if (user != null) {
        response.sendRedirect(user.getRole().equals("admin") ? "admin-dashboard.jsp" : "user-dashboard.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    <% if (request.getParameter("error") != null) { %>
        <p style="color: red;">Invalid username or password</p>
    <% } %>
    <form action="${pageContext.request.contextPath}/login" method="post">
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        <button type="submit">Login</button>
    </form>
</body>
</html>
