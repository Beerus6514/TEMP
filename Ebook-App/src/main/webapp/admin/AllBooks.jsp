
<%@page import="com.entity.Bookdetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Allbooks</title>
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<h3 class="text-center">Hello Admin</h3>

	<c:if test="${not empty succmsg}">
		<p class="text-center text-success">${succmsg}</p>
		<c:remove var="succmsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedmsg}">
		<p class="text-center text-danger">${failedmsg}</p>
		<c:remove var="failedmsg" scope="session" />
	</c:if>
	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn());
			List<Bookdetails> list = dao.getAllBooks();
			for (Bookdetails b : list) {
			%>
			<tr>
				<td><%=b.getBookid()%></td>
				<td><img src="<%=b.getImageurl()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookcategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="editbooks.jsp?id=<%=b.getBookid()%>"
					class="btn btn-sm btn-primary">Edit</a> 
					<a href="../delete?id=<%=b.getBookid()%>"
					class="btn btn-sm btn-danger">Delete</a></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
	<div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>