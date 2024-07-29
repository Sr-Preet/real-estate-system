<%@ include file="header/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.real_estate.model.Property" %>
<%@ page import="com.real_estate.model.User" %>
<%
    List<Property> properties = (List<Property>) request.getAttribute("properties");
    HttpSession sessionProp = request.getSession(false);
    User userProp = (session != null) ? (User) sessionProp.getAttribute("user") : null;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Properties</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
    <h1>List of Properties</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Location</th>
            <th>Price</th>
            <th>Description</th>
            <th>Image</th>
            <% if (userProp != null && "user".equals(userProp.getRole())) { %>
                <th>Action</th>
            <% } %>
        </tr>
        <% if (properties != null) {
            for (Property property : properties) { %>
        <tr>
            <td><%= property.getId() %></td>
            <td><%= property.getName() %></td>
            <td><%= property.getLocation() %></td>
            <td><%= property.getPrice() %></td>
            <td><%= property.getDescription() %></td>
            <td><img src="data:image/jpeg;base64,<%= property.getImage() %>" alt="Property Image" width="100"/></td>
            <% if (userProp != null && "user".equals(userProp.getRole())) { %>
                <td>
                    <% if ("available".equals(property.getStatus())) { %>
                         <form action="<%= request.getContextPath() %>/buy" method="post">
                    <input type="hidden" name="propertyId" value="<%= property.getId() %>"/>
                    <input type="submit" value="Buy"/>
                </form>
                    <% } else { %>
                        <span>Sold</span>
                    <% } %>
                </td>
            <% } %>
        </tr>
        <% } } %>
    </table>

    <% if (userProp != null && "admin".equals(userProp.getRole())) { %>
        <h2><a href="<%= request.getContextPath() %>/addproperty.jsp">Add New Property</a></h2>
    <% } %>

    <%@ include file="footer/footer.jsp" %>
</body>
</html>
