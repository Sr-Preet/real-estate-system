<%@ page import="java.util.List" %>
<%@ page import="com.real_estate.model.Property" %>
<%@ page import="com.real_estate.model.Transaction" %>
<%@ page import="com.real_estate.model.User" %>
<%@ page import="com.real_estate.dao.TransactionDAO" %>
<%@ page import="com.real_estate.dao.PropertyDAO" %>
<%@ page import="com.real_estate.dao.UserDAO" %>

<%
    PropertyDAO propertyDAO = new PropertyDAO();
    TransactionDAO transactionDAO = new TransactionDAO();
    UserDAO userDAO = new UserDAO();
    
    List<Property> soldProperties = propertyDAO.getSoldProperties();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Sold Properties</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css">
    <!-- jQuery and DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
</head>
<body>
    <%@ include file="header/header.jsp" %>

    <h1 class="dashboard-header">Sold Properties</h1>
    
    <div class="properties-table-container">
        <% if (soldProperties == null || soldProperties.isEmpty()) { %>
            <p class="no-properties-message">No sold properties available at the moment.</p>
        <% } else { %>
            <table id="soldPropertiesTable" class="display" border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Location</th>
                        <th>Price</th>
                        <th>Description</th>
                        <th>Image</th>
                        <th>Buyer</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Property property : soldProperties) { 
                        List<Transaction> transactions = transactionDAO.getTransactionsByPropertyId(property.getId());
                        for (Transaction transaction : transactions) {
                            User buyer = userDAO.getUserById(transaction.getUserId()); %>
                            <tr>
                                <td><%= property.getId() %></td>
                                <td><a href="<%= request.getContextPath() %>/view-property.jsp?id=<%= property.getId() %>"><%= property.getName() %></a></td>
                                <td><%= property.getLocation() %></td>
                                <td>$ <%= property.getPrice() %></td>
                                <td><%= property.getDescription() %></td>
                                <td><img src="data:image/jpeg;base64,<%= property.getImage() %>" alt="Property Image" width="100"/></td>
                                <td><%= buyer.getUsername() %></td>
                                <td><%= buyer.getEmail() %></td>
                            </tr>
                    <% } 
                    } %>
                </tbody>
            </table>
        <% } %>
    </div>

    <%@ include file="footer/footer.jsp" %>

    <!-- DataTables Initialization Script -->
    <script>
        $(document).ready(function() {
            $('#soldPropertiesTable').DataTable({
                "paging": true,
                "searching": true,
                "ordering": true
            });
        });
    </script>
</body>
</html>
