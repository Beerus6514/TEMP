<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook:Login</title>
<%@include file="All-comp/Style.jsp"%>

</head>
<body style="background-color: #e3f2fd;">
	<%@include file="All-comp/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3 p-4">
					<div class="card-body">
					
							<h5 class="text-center">Registration Page</h5>


							<c:if test="${not empty successMsg}">
								<p class="text-center text-success">${successMsg}</p>
								<c:remove var="successMsg" scope="session" />
							</c:if>
							<c:if test="${not empty failMsg }">
								<p class="text-center text-danger">${failMsg}</p>
								<c:remove var="failMsg" scope="session" />

							</c:if>

	                       <form action="register" method="post">
							<div class="mb-3 form-group">
								<label for="exampleInputEmail1" class="form-label">Enter
									full Name </label> <input type="text" class="form-control" id="name"
									name="fname" required>

							</div>
							<div class="mb-3 form-group">
								<label for="exampleInputEmail1" class="form-label">Enter
									Phone Number</label> <input type="number" class="form-control"
									id="phoneno" name="mobile_no" required>

							</div>
							<div class="mb-3 form-group">
								<label for="exampleInputEmail1" class="form-label">Enter
									Email address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" name="email" required>

							</div>
							<div class="mb-3 form-group">
								<label for="exampleInputPassword1" class="form-label">Enter
									Password</label> <input type="password" class="form-control"
									id="exampleInputPassword1" name="password" required>
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="check"> <label
									class="form-check-label" for="exampleCheck1">Agree Our
									Terms & Conditions</label>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<hr>
	<%@include file="All-comp/footer.jsp"%>


</body>
</html>