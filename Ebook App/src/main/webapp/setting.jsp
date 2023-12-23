<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting</title>
<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
a{
text-decoration:none;
}
</style>

</head>
<body style="background-color: #f7f7f7">
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%if(u==null){
		session.setAttribute("message", "You are not loged in");
		response.sendRedirect("login.jsp");
		return;
	}
	%>
	<div class="container">
		<h3 class="text-center">
			Hello,
			<%=u.getName()%></h3>
	
		<div class="row p-5">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-primary">
						<i class="fas fa-book-open fa-3x"></i>
						</div>
						<h4>Sell Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-primary">
						<i class="fas fa-book-open fa-3x"></i>
						</div>
						<h4>Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-primary">
						<i class="fas fa-edit fa-3x"></i>
						</div>
						<h4>Login & Security(Edit Profile)</h4>
						</div>
					</div>
				</a>
			</div>
			
		</div>
		
		
		<div class="row p-3">
			
			
			<div class="col-md-6">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-danger">
						<i class="fas fa-box-open fa-3x"></i>
						</div>
						<h4>My Order</h4>
						<p>Track your order</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-primary">
						<i class="fas fa-user-circle fa-3x"></i>
						</div>
						<h4>Help Service</h4>
						<p>24X7 Service</p>
						</div>
					</div>
				</a>
			</div>
			
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>