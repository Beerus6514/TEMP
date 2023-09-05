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
<title>View Details</title>
<%@include file="All-comp/Style.jsp"%>
</head>
<body>
	<%@include file="All-comp/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	     <%
       int bid = Integer.parseInt(request.getParameter("bid")); 
	   BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn()); 
	   Bookdetails b = dao.getBookbyid(bid);
        %>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="<%=b.getImageurl()%>"
					style="height: 150px; width: 100px"><br>
				<h4 class="mt-3">
					Book Name: <span class="text-success"> <%=b.getBookname()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"><%=b.getAuthor () %></span>
				</h4>
				<h4>
					Category: <span class="text-success"> <%=b.getBookcategory()%></span>
				</h4>

			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookname()%></h2>
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<div class=" text-center p-3">

					<a href="cart?bookid=<%=b.getBookid()%>&&userid=<%=u.getId()%>" class="btn btn-primary"><i class="fas fa-cart-plus"></i>
						Add Cart</a> <a href="" class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i>200</a>

				</div>



			</div>
		</div>
	</div>
	<%@include file="All-comp/footer.jsp"%>
</body>
</html>