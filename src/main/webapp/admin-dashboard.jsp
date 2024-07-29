<%@ include file="header/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.real_estate.model.Property" %>
<%
    List<Property> properties = (List<Property>) request.getAttribute("properties");
%>
<h1>Admin Dashboard</h1>
<p>Welcome, <%= user.getUsername() %></p>

<h2>Properties List</h2>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Location</th>
            <th>Price</th>
            <th>Image</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <% if (properties != null) { 
            for (Property property : properties) { %>
        <tr>
            <td><%= property.getId() %></td>
            <td><%= property.getName() %></td>
            <td><%= property.getLocation() %></td>
            <td>$ <%= property.getPrice() %></td>
            <td><img src="data:image/jpeg;base64,<%= property.getImage() %>" alt="Property Image" width="100"/></td>
            <td>
                <form action="<%= request.getContextPath() %>/admin" method="post">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="propertyId" value="<%= property.getId() %>">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
        <% } } %>
    </tbody>
</table>

<p><a href="<%= request.getContextPath() %>/addProperty.jsp">Add New Property</a></p>
<%@ include file="footer/footer.jsp" %>
