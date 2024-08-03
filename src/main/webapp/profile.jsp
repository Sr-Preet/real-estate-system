<%@ page import="com.real_estate.model.User"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
HttpSession sessionObj2 = request.getSession(false);
User user2 = (sessionObj2 != null) ? (User) sessionObj2.getAttribute("user") : null;
if (user2 == null) {
	response.sendRedirect(request.getContextPath() + "/login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Profile</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
	<%@ include file="header/header.jsp"%>

	<div class="profile-container">
		<h1 class="profile-header">
			Welcome, <span class="capitalize"><%=user.getUsername()%></span>
		</h1>
		<p class="profile-info">
			Email:
			<%=user.getEmail()%></p>
		<p class="profile-info">
			Role:
			<%=user.getRole()%></p>
	</div>

	<%@ include file="footer/footer.jsp"%>
</body>
</html>
