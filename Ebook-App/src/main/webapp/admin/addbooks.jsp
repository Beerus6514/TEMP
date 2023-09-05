<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
						<h4 class="text-center">Add Books</h4>
						<c:if test="${not empty succmsg}">
							<p class="text-center text-success">${succmsg}</p>
							<c:remove var="succmsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedmsg}">
							<p class="text-center text-danger">${failedmsg}</p>
							<c:remove var="failedmsg" scope="session" />
						</c:if>
						<form action="../addbook" method="post"
							enctype="multipart/form-data">

							<div class="form-group p-2">
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>

							<div class="form-group p-2">

								<label for="exampleInputEmail1">Author Name*</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>

							<div class="form-group p-2">

								<label for="exampleInputPassword1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1">

							</div>
							<div class="form-group p-2">
								<label for="inputState">Book Categories</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>--select--</option>
									<option value="New">NewBook</option>

								</select>

							</div>

							<div class="form-group p-2">

								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>

								</select>

							</div>
							<div class="form-group p-2">

								<label for="exampleFormControlFile1">Image url *</label> <input
									name="bimg" type="text" class="form-control"
									id="exampleFormControlFile1">

							</div>

							<button type="submit" class="btn btn-primary">Add</button>

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