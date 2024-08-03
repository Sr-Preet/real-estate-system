<%@ page import="java.util.List" %>
<%@ page import="com.real_estate.model.PropertyTransactionDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sold Properties</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
    <h1>Sold Properties</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Location</th>
            <th>Price</th>
            <th>Description</th>
            <th>Image</th>
            <th>Buyer</th>
        </tr>
        <% 
        List<PropertyTransactionDTO> soldProperties = (List<PropertyTransactionDTO>) request.getAttribute("soldProperties");
        if (soldProperties != null) {
            for (PropertyTransactionDTO dto : soldProperties) { 
        %>
        <tr>
            <td><%= dto.getPropertyId() %></td>
            <td><a href="<%= request.getContextPath() %>/view-property.jsp?id=<%= dto.getPropertyId() %>"><%= dto.getName() %></a></td>
            <td><%= dto.getLocation() %></td>
            <td><%= dto.getPrice() %></td>
            <td><%= dto.getDescription() %></td>
            <td><img src="data:image/jpeg;base64,<%= dto.getImage() %>" alt="Property Image" width="100"/></td>
            <td><%= dto.getBuyerName() %></td>
        </tr>
        <% 
            } 
        } 
        %>
    </table>
</body>
</html>
