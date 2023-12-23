<%
User user3 = (User) session.getAttribute("userobj");
if (user3 == null) {
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

<%@page import="com.entity.User"%>
<div class="container-fluid bg-custom" style="height:10px; background-color:#303f9"></div>
<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3><i class="fas fa-book"></i>Ebooks</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary bg-custom my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<div class="col-md-3">
		
		
		<a href="#" class="btn btn-success"><i class="fas fa-user-plus m-1"></i><%=user3.getName() %></a>
		<a href="../LogoutServlet" class="btn btn-primary bg-custom text-white"><i class="fas fa-sign-in-alt m-1"></i>Logout</a>
		
		
		</div>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="home.jsp">E-Book</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"> <i class="fas fa-home"></i> Home
					<span class="sr-only">(current)</span>
			</a></li>
		</ul>
		
	</div>
</nav>