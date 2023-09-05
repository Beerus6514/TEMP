<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Home</title>
<%@include file="allcss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a: hover {
	text-decoration: none;
	color: #fce4ec;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-4">
				<a href="addbooks.jsp">
					<div class="card">
						<div class="card-body text-center text-primary">
							<i class="fas fa-plus-square fa-3x "></i><br>
							<h4>Add Books</h4>
							--------------
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="AllBooks.jsp">

					<div class="card">
						<div class="card-body text-center text-danger">

							<i class="fas fa-book-open fa-3x "></i><br>
							<h4>All Books</h4>
							--------------

						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center text-warning">
							<i class="fas fa-box-open fa-3x "></i><br>
							<h4>Order</h4>
							--------------

						</div>
					</div>
				</a>
			</div>
			
		</div>
	</div>
	<div class="modal fade" id="exampleModal Center" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<h4>Do You want logout</h4>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="../Logout" type="button"
						class="btn btn-primary text-white">Logout</a>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
	 <div style="margin-top:250px">
 <%@include file="footer.jsp" %>
 </div> 
 </body>
</html>