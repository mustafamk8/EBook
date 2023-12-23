
<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%
User u2 = (User) session.getAttribute("userobj");
if (u2 == null) {
	session.setAttribute("message", "Login First");
	response.sendRedirect("login.jsp");
	return;
}
%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.CartDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Cart</title>
<%@include file="all_component/allCss.jsp"%>
</head>

<body style="background-color: #f7f7f7">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 mt-5">
				<div class="card bg-white p-2">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						<%@include file="all_component/message.jsp"%>
						<table class="table table-striped">
							<thead class="bg-dark text-white">
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								CartDaoImpl dao = new CartDaoImpl(DBConnect.getConnection());
								List<Cart> cart = dao.getBookByUser(u2.getId());
								Double totalPrice = 0.0;
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>

								<tr>
									<td><%=c.getBookName()%></td>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="RemoveBook?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- first col-md-6 close -->

			<!-- second col-md-6 start -->
			<div class="col-md-6 mt-5">
				<div class="card">
					<div class="card-body">
						
						<h3 class="text-center text-success">Your details order</h3>
						<form action="OrderServlet" method="post">

							<input type="hidden" name="id" value="<%=u2.getId()%>">

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										name="name" value="<%=u2.getName()%>" class="form-control"
										id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										name="email" value="<%=u2.getEmail()%>" class="form-control"
										id="inputPassword4">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
										type="text" name="phno" value="<%=u2.getPhno()%>"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										name="address" class="form-control" id="inputPassword4">
								</div>
							</div>


							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										name="state" class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pincode</label> <input type="text"
										name="pincode" class="form-control" id="inputPassword4">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">City</label> <input type="text"
										name="city" class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Landmark</label> <input
										name="landmark" type="text" class="form-control"
										id="inputPassword4">
								</div>
							</div>

							<div class="form-group">
								<label for="inputState">Payment type</label> <select
									name="payment" id="inputState" class="form-control">
									<option value="noselect">Choose...</option>
									<option value="Cod">Cash on delivery</option>
									<option value="Upi">Upi</option>
								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success m-2">Continue
									Shopping</a>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>