<%@ include file="header/header.jsp" %>

<title>Register</title>
<h1>Register</h1>
<form action="register" method="post">
	Username: <input type="text" name="username" required><br>
	Email: <input type="email" name="email" required><br>
	Password: <input type="password" name="password" required><br>
	<button type="submit">Register</button>
</form>
<a href="login.jsp">Already have an account? Login</a>
<%@ include file="footer/footer.jsp" %>
