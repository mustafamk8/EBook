<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
<%@include file="all_component/navbar.jsp"%>
	 <%
	User u = (User) session.getAttribute("userobj");
	 if(u==null){
		 session.setAttribute("message", "You are not loged in");
			response.sendRedirect("login.jsp");
			return;
	 }
	%> 
	<div class="container">
		<div class="row mt-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<%@include file="all_component/message.jsp" %>
						<h3 class="card-title text-center">Edit Profile</h3>
						<form action="UpdateProfile" method="post">
							<input type="hidden" name="id" value="<%=u.getId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input type="text"
									name="name" value="<%=u.getName() %>" class="form-control" aria-describedby="emailHelp"
									placeholder="Enter Name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email</label> <input
									type="email" name="email" value="<%=u.getEmail() %>" class="form-control"
									aria-describedby="emailHelp" placeholder="Enter Email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Contact No</label> <input
									type="text" name="contact" value="<%=u.getPhno() %>" class="form-control"
									aria-describedby="emailHelp" placeholder="Enter Phone number">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control" placeholder="Password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary bg-custom">Update</button>
							</div>
						</form>
					</div>
				</div>

			</div>

		</div>
	</div>
	
	
</body>
</html>