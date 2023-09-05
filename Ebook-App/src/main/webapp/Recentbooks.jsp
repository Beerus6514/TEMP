<%@page import="com.entity.User"%>
<%@page import="com.entity.Bookdetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recent Books</title>
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
<body>

	<%@include file="All-comp/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<div class="container-fluid">
		<h3 class="text-center">All Recent Books</h3>

		<div class="row">

			<%
			BookDAOimpl dao2 = new BookDAOimpl(DBconnect.getConn());
			List<Bookdetails> list2 = dao2.getallRecentBooks();
			for (Bookdetails b : list2) {
			%>
			<div class="col-md-3 mb-4">
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
						</P>
						<p>
							<%
							if (b.getBookcategory().equals("Old")) {
							%>
								Categories:<%=b.getBookcategory()%>
							</p>
							
								<a href="viewDetails.jsp" class="button-13"><i
								class="fa-solid fa-eye"></i>View Details</a> 
							
							<%
							} else {
							%>
							Categories:<%=b.getBookcategory()%></p>
						
							
								<a href="cart?bookid=<%=b.getBookid()%>&&userid=<%=u.getId()%>"
							class="button-13"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a> <a
							href="viewDetails.jsp" class="button-13"> <i
							class="fa-solid fa-eye"></i>View Details
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
	</div>
	<%@include file="All-comp/footer.jsp"%>
</body>
</html>