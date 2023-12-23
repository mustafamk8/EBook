<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row mt-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<%@include file="all_component/message.jsp" %>
						<h3 class="card-title text-center">Register</h3>
						<form action="RegisterServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input type="text"
									name="name" class="form-control" aria-describedby="emailHelp"
									placeholder="Enter Name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email</label> <input
									type="email" name="email" class="form-control"
									aria-describedby="emailHelp" placeholder="Enter Email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Contact No</label> <input
									type="text" name="contact" class="form-control"
									aria-describedby="emailHelp" placeholder="Enter Phone number">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control" placeholder="Password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary bg-custom">Submit</button>
							</div>
						</form>
					</div>
				</div>

			</div>

		</div>
	</div>
</body>
</html>