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

						<h5 class="text-center">Please Login!</h5>
						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty succMsg}">
							<p class="text-center text-danger">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>


						<form action="login" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required
									name="email">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required name="password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button>

							</div>
							Not An User? <a href="register.jsp">Create Account</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<hr style="margin-top: 105px;">
	<%@include file="All-comp/footer.jsp"%>


</body>
</html>