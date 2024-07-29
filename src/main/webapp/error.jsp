<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
    <h1>Error</h1>
    <p><%= request.getAttribute("errorMessage") %></p>
    <a href="index.jsp">Go Back to Home</a>
</body>
</html>
