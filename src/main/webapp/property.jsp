<%@ include file="header/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.real_estate.model.Property" %>
<%@ page import="com.real_estate.model.User" %>
<%
    List<Property> properties = (List<Property>) request.getAttribute("properties");
    HttpSession sessionProp = request.getSession(false);
    User userProp = (sessionProp != null) ? (User) sessionProp.getAttribute("user") : null;
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Properties</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css">
    <!-- jQuery and DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
</head>
<body>
    <div class="dashboard-container">
        <h1 class="dashboard-header">Buy Properties</h1>
        
        <% if (properties == null || properties.isEmpty()) { %>
            <p class="no-properties-message">No properties available at the moment.</p>
        <% } else { %>
            <div class="properties-table-container">
                <table id="propertiesTable" class="display">
                    <thead>
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
                    </thead>
                    <tbody>
                        <% for (Property property : properties) {
                            if ("sold".equals(property.getStatus())) {
                                continue; // Skip sold properties
                            }
                        %>
                        <tr>
                            <td><%= property.getId() %></td>
                    <td><a href="<%= request.getContextPath() %>/view-property.jsp?id=<%= property.getId() %>"><%= property.getName() %></a></td>
                            <td><%= property.getLocation() %></td>
                            <td>$ <%= property.getPrice() %></td>
                            <td><%= property.getDescription() %></td>
                            <td><img src="data:image/jpeg;base64,<%= property.getImage() %>" alt="Property Image" class="property-image"/></td>
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
                        <% } %>
                    </tbody>
                </table>
            </div>
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
