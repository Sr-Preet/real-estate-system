<%@ include file="header/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.real_estate.model.Property" %>
<%@ page import="com.real_estate.model.User" %>
<%
    List<Property> properties = (List<Property>) request.getAttribute("properties");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css">
    <!-- jQuery and DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
</head>
<body>
    <h1 class="dashboard-header">Admin Dashboard</h1>
    
    <div class="properties-table-container">
        <% if (properties == null || properties.isEmpty()) { %>
            <p class="no-properties-message">No properties available at the moment.</p>
        <% } else { %>
            <table id="propertiesTable" class="display">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Location</th>
                        <th>Price</th>
                        <th>Image</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Property property : properties) { %>
                    <tr>
                        <td><%= property.getId() %></td>
                        <td><a href="<%= request.getContextPath() %>/view-property.jsp?id=<%= property.getId() %>"><%= property.getName() %></a></td>
                        <td><%= property.getLocation() %></td>
                        <td>$ <%= property.getPrice() %></td>
                        <td><img src="data:image/jpeg;base64,<%= property.getImage() %>" alt="Property Image" width="100"/></td>
                        <td>
                            <%= "sold".equalsIgnoreCase(property.getStatus()) ? "Sold" : "Available" %>
                        </td>
                        <td>
                            <% if (!"sold".equalsIgnoreCase(property.getStatus())) { %>
                                <form action="<%= request.getContextPath() %>/admin" method="post">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="propertyId" value="<%= property.getId() %>">
                                    <button type="submit">Delete</button>
                                </form>
                            <% } %>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </div>

    <%@ include file="footer/footer.jsp" %>

    <!-- DataTables Initialization Script -->
    <script>
        $(document).ready(function() {
            $('#propertiesTable').DataTable({
                "paging": true,
                "searching": true,
                "ordering": true
            });
        });
    </script>
</body>
</html>
