<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
						<%@include file="message.jsp"%>
						<h3 class="card-title text-center">Add Books</h3>
						<form action="../AddBooks" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
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
								<label for="exampleInputEmail1">Book Categories</label> <select
									name="btype" class="form-control" id="inputState">
									<option selected>---Select---</option>
									<option value="New">New Book</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Book Status</label> <select
									name="bstatus" class="form-control" id="inputState">
									<option selected>---Select---</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Upload Photo</label> <input
									type="file" name="bimg" class="form-control-file"
									aria-describedby="emailHelp">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary bg-custom">Add</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 10px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>