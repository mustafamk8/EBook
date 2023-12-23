<%
response.addHeader("pragma", "no-cache");
response.addHeader("cache-control", "no-store");
response.addHeader("expire", "0");
%>
<%@page import="com.entity.User"%>
<div class="container-fluid bg-custom"
	style="height: 10px; background-color: #303f9"></div>
<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fas fa-book"></i>Ebooks
			</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" >
				<input class="form-control mr-sm-2" name="ch" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary bg-custom my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>

		<%
		User u1 = (User) session.getAttribute("userobj");
		%>

		<%
		if (u1 != null) {
		%>
		<div class="col-md-3">
			<a href = "checkout.jsp" ><i class="fas fa-cart-plus fa-2x "></i></a> 
			<a href="#" class="btn btn-success"><i
				class="fas fa-user-plus m-1"></i><%=u1.getName() %></a> <a href="LogoutServlet"
				class="btn btn-primary bg-custom text-white"><i
				class="fas fa-sign-in-alt m-1"></i>Logout</a>
		</div>		

		<%
		}else{
		%>
		<div class="col-md-3">
			<a href="login.jsp" class="btn btn-success"><i
				class="fas fa-sign-in-alt m-1"></i>Login</a> <a href="register.jsp"
				class="btn btn-primary bg-custom text-white"><i
				class="fas fa-user-plus m-1"></i>Register</a>
		</div>
		<%
		}
		%>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="index.jsp">E-Book</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">
					<i class="fas fa-home"></i> Home <span class="sr-only">(current)</span>
			</a></li>

			<li class="nav-item active"><a class="nav-link"
				href="all_recent_books.jsp"><i class="fas fa-book-open p-1"></i>Recent
					Book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_new_books.jsp"><i class="fas fa-book-open p-1"></i>New
					Book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_old_books.jsp"><i class="fas fa-book p-1"></i>Old Book</a>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0 m-2" type="submit">
				<i class="fas fa-cog p-1"></i>Setting
			</a>
			<button class="btn btn-light my-2 my-sm-0 m-2" type="submit">
				<i class="fas fa-phone-square-alt p-1"></i>Contact Us
			</button>
		</form>
	</div>
</nav>