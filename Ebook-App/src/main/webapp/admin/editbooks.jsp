<%@page import="com.DAO.BookDAOimpl"%>
<%@page import="com.entity.Bookdetails"%>
<%@page import="com.DB.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:addbooks</title>
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="col-md-4 offset-md-4 mt-2">
		<div class="card">

			<div class="container">
				<div class="row">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn());
						Bookdetails b = dao.getBookbyid(id);
						%>
						<form action="../editbook" method="post">
						<input name="id" type="hidden" value="<%=b.getBookid()%>">

							<div class="form-group p-2">
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getBookname()%>">
							</div>
							<div class="form-group p-2">

								<label for="exampleInputEmail1">Author Name*</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getAuthor()%>">
							</div>

							<div class="form-group p-2">

								<label for="exampleInputPassword1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1" value="<%=b.getPrice()%>">
							</div>
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>			
									<option value="Active">Active</option>
									
									<%
									}
									%>
								</select>

							</div>

							<div class="form-group p-2">
                       <label for="exampleInputPassword1">Image url*</label> <input
									name="bimg"  class="form-control"
									id="exampleInputPassword1" value="<%=b.getImageurl()%>">
							</div>

							<button type="submit" class="btn btn-primary">Update</button>

						</form>

					</div>

				</div>
			</div>
		</div>
	</div>
	<div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>