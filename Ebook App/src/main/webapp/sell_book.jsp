<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
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
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
						<%@include file="all_component/message.jsp"%>
						<h3 class="card-title text-center">Sell Old Book</h3>
						<form action="AddBookss" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<input
									type="hidden" name="btype" value="Old" class="form-control"
									aria-describedby="emailHelp" placeholder="Enter Book Name">
							
								<input
									type="hidden" name="bstatus" value="Active" class="form-control"
									aria-describedby="emailHelp" placeholder="Enter Book Name">
							
								<input
									type="hidden" name="seller" value="<%=u.getEmail() %>" class="form-control"
									aria-describedby="emailHelp" placeholder="Enter Book Name">
							
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" name="bname" class="form-control"
									aria-describedby="emailHelp" placeholder="Enter Book Name">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" name="author" class="form-control"
									aria-describedby="emailHelp" placeholder="Enter Author Name">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" name="price" class="form-control"
									aria-describedby="emailHelp" placeholder="Enter Price">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Upload Photo</label> <input
									type="file" name="bimg" class="form-control-file"
									aria-describedby="emailHelp">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary bg-custom">Sell Book</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 10px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>