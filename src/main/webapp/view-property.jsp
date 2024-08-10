<%@ page import="com.real_estate.dao.DAOFactory" %>
<%@ page import="com.real_estate.dao.IPropertyDAO" %>
<%@ page import="com.real_estate.model.Property" %>
<%@ include file="header/header.jsp" %>
<%
    int propertyId = Integer.parseInt(request.getParameter("id"));
    IPropertyDAO propertyDAO = DAOFactory.getPropertyDAO();
    Property property = propertyDAO.getPropertyById(propertyId);
    
    // Get the previous page URL from the Referer header
    String previousPage = request.getHeader("Referer");
    if (previousPage == null || previousPage.isEmpty()) {
        previousPage = request.getContextPath() + "/property";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= property.getName() %></title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .property-card {
            border: 1px solid #ddd;
            border-radius: .25rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
        }
        .property-card img {
            border-radius: .25rem;
        }
        .btn-back {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: .75rem 1.5rem;
            font-size: 1rem;
            border-radius: .25rem;
            transition: background-color 0.3s ease;
        }
        .btn-back:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <div class="property-card">
                    <h1 class="mb-4"><%= property.getName() %></h1>
                    <div class="row">
                        <div class="col-md-6">
                            <p><strong>Location:</strong> <%= property.getLocation() %></p>
                            <p><strong>Price:</strong> $<%= property.getPrice() %></p>
                            <p><strong>Description:</strong> <%= property.getDescription() %></p>
                        </div>
                        <div class="col-md-6">
                            <img src="data:image/jpeg;base64,<%= property.getImage() %>" alt="Property Image" class="img-fluid"/>
                        </div>
                    </div>
                </div>
                <div class="text-center mt-4">
                    <a href="<%= previousPage %>" class="btn btn-back">Back to Properties</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Include footer -->
    <%@ include file="footer/footer.jsp" %>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
