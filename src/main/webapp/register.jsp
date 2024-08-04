<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
<style>
/* Basic reset */
body, html {
    margin: 0;
    padding: 0;
    height: 100%;
    font-family: Arial, sans-serif;
}

/* Centering the container */
body {
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #e9ecef; /* Optional background color */
}

.container {
    width: 100%;
    max-width: 400px;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #fff; /* Change to suit your design */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    /* Optional shadow for a card-like effect */
}

h1 {
    font-size: 24px;
    text-align: center;
    margin-bottom: 20px;
}

form {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

label {
    font-weight: bold;
}

input[type="text"], input[type="password"], input[type="email"] {
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    width: 100%;
    box-sizing: border-box;
}

button {
    background-color: #3498db;
    color: #fff;
    border: none;
    padding: 10px;
    border-radius: 4px;
    cursor: pointer;
}

button:hover {
    background-color: #2980b9;
}

/* Styles for error messages */
.error-message {
    color: red;
    text-align: center;
}
</style>
</head>
<body>
    <div class="container">
        <h1>Register</h1>
        <%
        if (request.getParameter("error") != null) {
        %>
        <p class="error-message">Registration failed. Please try again.</p>
        <%
        }
        %>
        <form action="<%=request.getContextPath()%>/register" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <button type="submit">Register</button>
        </form>
        <div style="text-align: center; margin-top: 10px;">
            <a href="<%=request.getContextPath()%>/login.jsp">Already have an account? Login here</a>
        </div>
    </div>
</body>
</html>
