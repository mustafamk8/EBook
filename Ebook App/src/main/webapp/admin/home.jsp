
<%@page import="com.entity.User"%>
<%
User user = (User) session.getAttribute("userobj");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! login First");
	response.sendRedirect("../login.jsp");
	return;
}
%>
<%
response.addHeader("pragma", "no-cache");
response.addHeader("cache-control", "no-store");
response.addHeader("expire", "0");
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@include file="allCss.jsp"%>

<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: blue;
}
</style>


</head>
<body style="background-color: #f0f1f2">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-plus-square fa-3x text-primary"></i> <br>
							<h4>Add Books</h4>
							---------------
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-book-open fa-3x text-danger"></i> <br>
							<h4>All Books</h4>
							---------------
						</div>
					</div>
				</a>
			</div>



			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-box-open fa-3x text-warning"></i> <br>
							<h4>Orders</h4>
							---------------
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<i class="fas fa-sign-out-alt fa-3x text-primary"></i> <br>
					<a href="../LogoutServlet">	<h4>Logout</h4></a>
						---------------
					</div>
				</div>
			</div>


		</div>
	</div>
	
<div style="margin-top: 290px">
<%@include file="footer.jsp" %>
</div>	
</body>
</html>