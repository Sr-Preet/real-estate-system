<%@ page import="java.util.List" %>
<%@ page import="com.real_estate.model.User" %>
<%@ page import="com.real_estate.dao.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>List of Users</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="header/header.jsp" %>

    <div class="container mt-4">
        <h1 class="mb-4">List of Users</h1>
        
        <% 
            UserDAO userDAO = new UserDAO();
            List<User> users = userDAO.getAllUsers();
        %>
        
        <% if (users == null || users.isEmpty()) { %>
            <p class="alert alert-info">No users found.</p>
        <% } else { %>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (User userProp : users) { %>
                    <tr>
                        <td><%= userProp.getId() %></td>
                        <td><%= userProp.getUsername() %></td>
                        <td><%= userProp.getEmail() %></td>
                        <td><%= userProp.getRole() %></td>
                        <td>
                            <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editUserModal" 
                                    data-id="<%= userProp.getId() %>" 
                                    data-username="<%= userProp.getUsername() %>" 
                                    data-email="<%= userProp.getEmail() %>" 
                                    data-role="<%= userProp.getRole() %>">
                                Edit
                            </button>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </div>

    <!-- Edit User Modal -->
    <div class="modal fade" id="editUserModal" tabindex="-1" role="dialog" aria-labelledby="editUserModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editUserForm" action="<%= request.getContextPath() %>/admin" method="post">
                        <input type="hidden" name="action" value="updateUser" />
                        <input type="hidden" name="userId" id="userId" />
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" id="username" name="username" required />
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required />
                        </div>
                        <div class="form-group">
                            <label for="role">Role</label>
                            <select class="form-control" id="role" name="role" required>
                                <option value="admin">Admin</option>
                                <option value="user">User</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer/footer.jsp" %>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Script to populate the modal with user data -->
    <script>
        $('#editUserModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var userId = button.data('id');
            var username = button.data('username');
            var email = button.data('email');
            var role = button.data('role');
            
            var modal = $(this);
            modal.find('#userId').val(userId);
            modal.find('#username').val(username);
            modal.find('#email').val(email);
            modal.find('#role').val(role);
        });
    </script>
</body>
</html>
