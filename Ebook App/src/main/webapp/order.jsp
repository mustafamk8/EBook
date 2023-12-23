<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My orders</title>
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
<h3 class="text-center text-primary">Your Order</h3>
<table class="table mt-3">
  <thead class="thead-light">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
  <%
  BookOrderImpl dao = new BookOrderImpl(DBConnect.getConnection());
  List<BookOrder> list = dao.getBook(u.getEmail());
  for(BookOrder b : list){
  %>
    <tr>
      <th scope="row"><%=b.getOrderId() %></th>
      <td><%=b.getUsername() %></td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getPayment() %></td>
    </tr>
  <%
  }
  %>  
  </tbody>
</table>
</div>
</body>
</html>