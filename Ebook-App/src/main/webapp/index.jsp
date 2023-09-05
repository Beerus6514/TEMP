<%@page import="com.entity.User"%>
<%@page import="com.entity.Bookdetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook:index</title>
<%@include file="All-comp/Style.jsp"%>
<style type="text/css">
.button-13 {
	background-color: #fff;
	border: 1px solid #d5d9d9;
	border-radius: 8px;
	box-shadow: rgba(213, 217, 217, .5) 0 2px 5px 0;
	box-sizing: border-box;
	color: #FF7F50;
	cursor: pointer;
	display: inline-block;
	font-family: "Amazon Ember", sans-serif;
	font-size: 13px;
	line-height: 29px;
	padding: 0 10px 0 11px;
	position: relative;
	text-align: center;
	text-decoration: none;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
	vertical-align: middle;
	width: 125px;
}

.button-13:hover {
	background-color: #f7fafa;
}

.button-13:focus {
	border-color: #008296;
	box-shadow: rgba(213, 217, 217, .5) 0 2px 5px 0;
	outline: 0;
}
.back-img {
	/* background: url("Images/Banner2.jpg"); */
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	transition: 0.1s all ease-in-out
}

.crd-ho {
	transition: transform 0.2s ease-in-out;
	/* Adding a smooth transition effect */
}

.crd-ho:hover {
	transform: scale(1.05); /* Scaling the button up a bit on hover */
}
</style>
</head>
<body style="background-color: #F5FFFA;">
	<%@include file="All-comp/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userobj");
	%>


	<div class="container-fluid">

		<h1 class="text-center text-dark">
			<i class="fa-solid fa-book"></i>Book Management System
		</h1>
		<img class=" back-img" alt="Images/Banner.jpg" src="Images/Banner.jpg">
	</div>
	<hr>

	<!-- Recent Book start -->
	<div class="container-fluid">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			BookDAOimpl dao2 = new BookDAOimpl(DBconnect.getConn());
			List<Bookdetails> list2 = dao2.getrecentBooks();
			for (Bookdetails b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">

					<div class="card-body text-center">
						<img alt="" src="<%=b.getImageurl()%>"
							style="width: 100px; height: 100px" class="img-thumblin">
						<p>

							Title:<%=b.getBookname()%></p>
						<p>
							Author:<%=b.getAuthor()%></p>
							<p>
							Price:<a href="" class="button-13"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</p>
						
						
						<p>
							<%
							if (b.getBookcategory().equals("Old")) {
							%>
							Categories:<%=b.getBookcategory()%>
						</p>
						
						
							<a href="viewDetails.jsp?bid=<%=b.getBookid()%>"
								class="button-13"><i class="fa-solid fa-eye"></i>View Details</a>
						
						<%
						} else {
						%>
						Categories:<%=b.getBookcategory()%></p>
						
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="button-13">Add to Cart</a>
							<%
							} else {
							%>
							<a href="cart?bookid=<%=b.getBookid()%>&&userid=<%=u.getId()%>"
								class="button-13"><i
								class="fa-solid fa-cart-plus"></i>Add to Cart</a>
							<%
							}
							%>
							<a href="viewDetails.jsp?bid=<%=b.getBookid()%>"
								class="button-13"> <i class="fa-solid fa-eye"></i>View
								Details
							</a> 
						
						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="Recentbooks.jsp" class="btn btn-danger"><i
				class="fa-solid fa-eye"></i>View All</a>
		</div>

	</div>
	<!-- Recent Book End -->
	<hr>
	<!-- New Book start -->
	<div class="container-fluid">
		<h3 class="text-center">New Book</h3>
		<div class="row">
			<%
			BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn());
			List<Bookdetails> list = dao.getNewBooks();
			for (Bookdetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">

					<div class="card-body text-center">
						<img alt="" src="<%=b.getImageurl()%>"
							style="width: 100px; height: 100px" class="img-thumblin">
						<p>
							Title:<%=b.getBookname()%>
							<%
							b.getBookid();
							%>
						</p>
						<p>
							Author:<%=b.getAuthor()%></p>
							<p>
							Price:<a href="" class="button-13"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</p>
						<p>
							Categories:<%=b.getBookcategory()%></p>
						

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="button-13"><i
								class="fa-solid fa-cart-plus"></i>Add to Cart</a>
							<%
							} else {
							%>
							<a href="cart?bookid=<%=b.getBookid()%>&&userid=<%=u.getId()%>"
								class="button-13"><i
								class="fa-solid fa-cart-plus"></i>Add to Cart</a>
							<%
							}
							%>
							<a href="viewDetails.jsp?bid=<%=b.getBookid()%>"
								class="button-13"> <i class="fa-solid fa-eye"></i>View
								Details
							</a> 
						
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="Newbooks.jsp" class="btn btn-danger"><i
				class="fa-solid fa-eye"></i>View All</a>
		</div>

	</div>
	<!-- New Book End -->
	<hr>
	<!-- Old Book start -->
	<div class="container-fluid">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
			BookDAOimpl dao3 = new BookDAOimpl(DBconnect.getConn());
			List<Bookdetails> list3 = dao3.getoldBooks();
			for (Bookdetails b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="<%=b.getImageurl()%>"
							style="width: 100px; height: 100px" class="img-thumblin">
						<p>
							Title:<%=b.getBookname()%></p>
						<p>
							Author:<%=b.getAuthor()%></p>
							<p>
							Price:<a href="" class="button-13"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</p>
						<p>
							Categories:<%=b.getBookcategory()%>
						</p>
						
							<a href="viewDetails.jsp?bid=<%=b.getBookid()%>"
								class="button-13 ml-5"> <i class="fa-solid fa-eye"></i>View
								Details</a>
						
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
		<div class="text-center mt-2">
			<a href="Oldbooks.jsp" class="btn btn-danger"><i
				class="fa-solid fa-eye"></i>View All</a>
		</div>

	</div>
	<!-- Old Book End -->
	<hr>
	<%@include file="All-comp/footer.jsp"%>
</body>
</html>