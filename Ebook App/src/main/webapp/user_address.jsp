<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Address</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
<%@include file="all_component/navbar.jsp"%>
	<%-- <%
	User u = (User) session.getAttribute("userobj");
	%> --%>
	
	<div class="container">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					<%@include file="all_component/message.jsp" %>
						<h3 class="card-title text-center">Edit Address</h3>
						<form action="#" method="post">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Address</label> <input
										type="text"  
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">landmark</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
							</div>


							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputEmail4">city</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">State</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">Pin</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="text-center">
								<button class="btn btn-warning">Update</button>
								
							</div>
						</form>
					</div>
				</div>

			</div>

		</div>
	</div>
	
</body>
</html>