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
    <style>
    .buy-btn {
        background-color: #3498db;
        color: #fff;
        border: none;
        padding: 10px;
        border-radius: 4px;
        cursor: pointer;
    }
    </style>
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
                                        <form class="propertyForm" action="<%= request.getContextPath() %>/buy" method="POST">
                                            <input type="hidden" name="propertyId" value="<%= property.getId() %>"/>
                                            <input type="button" class="buy-btn" data-price="<%= property.getPrice() %>" value="Buy"/>
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

    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
   
    <!-- DataTables Initialization Script -->
    <script>
        $(document).ready(function() {
            $('#propertiesTable').DataTable({
                "paging": true,
                "searching": true,
                "ordering": true
            });

            $('.buy-btn').click(function() {
                var price = $(this).data('price');
                buy(price, $(this).closest('form'));
            });
        });

        function buy(price, form) {
            console.log(price);

            var options = {
                "key": "rzp_test_H7BHZQXmJkTo3q", // Enter the Key ID generated from the Dashboard
                "amount": price * 100, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise or INR 500.
                "currency": "CAD",
                "name": "Real Estate System",
                "description": "payment",
                "handler": function (response) {
                    console.log(response);
                    form.submit();
                },
                "prefill": {
                    "name": "", 
                    "email": "",
                    "contact": ""
                },
                "notes": {
                    "address": ""
                },
                "theme": {
                    "color": "#092a37"
                }
            };
            var rzp1 = new Razorpay(options);
            rzp1.open();
        }
    </script>
</body>
</html>
