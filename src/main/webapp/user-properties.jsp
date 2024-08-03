<%@ include file="header/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.real_estate.model.Property" %>
<%
    List<Property> properties = (List<Property>) request.getAttribute("properties");
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Purchased Properties</title>
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
        <h1 class="dashboard-header">My Purchased Properties</h1>
        
        <% if (properties == null || properties.isEmpty()) { %>
            <p class="no-properties-message">No properties purchased yet.</p>
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
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Property property : properties) { %>
                        <tr>
                            <td><%= property.getId() %></td>
                            <td><a href="<%= request.getContextPath() %>/view-property.jsp?id=<%= property.getId() %>"><%= property.getName() %></a></td>
                            <td><%= property.getLocation() %></td>
                            <td>$ <%= property.getPrice() %></td>
                            <td><%= property.getDescription() %></td>
                            <td><img src="data:image/jpeg;base64,<%= property.getImage() %>" alt="Property Image" class="property-image"/></td>
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
