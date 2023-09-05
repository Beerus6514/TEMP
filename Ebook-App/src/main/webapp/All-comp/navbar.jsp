<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="Container-fluid p-2" style="background-color: #87CEFA;"></div>
<div class="Container-fluid p-3">
	<div class="row">
		<div class="col-md-2 text-success">
			<h1>
				<i class="fa-solid fa-book"></i>
			</h1>
		</div>
		<div class="col-md-4">
			<form class="d-flex">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
				
			</form>
		</div>
		<div class="col-md-2"></div>

		<div class="col-md-4">
			<c:if test="${not empty userobj}">
				<a href="checkout.jsp" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i></a>
					<a href="" class="btn btn-success">  <i
						class="fas fa-user-plus"></i>${userobj.name}</a> <a href="Logout"
						class="btn btn-primary text-white"> <i
						class="fas fa-sign-in-alt"></i>Logout
					</a>
				
			</c:if>
			<c:if test="${empty userobj }">
				
					<a href="login.jsp" class="btn btn-success"><i
						class="fas fa-sign-in-alt"></i> Login</a> <a href="register.jsp"
						class="btn btn-primary text-white"> <i
						class="fas fa-user-plus"></i> Register
					</a>
			
			</c:if>

		</div>
	</div>

</div>



<nav class="navbar navbar-expand-lg navbar-dark bg-custom" style="background-color: #87CEFA;">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-house-chimney"></i></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="Recentbooks.jsp"><i class="fa-solid fa-book-open"></i>Recent
						Books</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="Newbooks.jsp"><i class="fa-solid fa-book-open"></i>New
						Books</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="Oldbooks.jsp"><i class="fa-solid fa-book-open"></i>Old
						Books</a></li>

			</ul>
			<form class="form-inline">
				<button class="btn btn-light ml-2" type="submit">
					<i class="fa-solid fa-sliders"></i>Setting
				</button>
				<button class="btn btn-light ml-2" type="submit">
					<i class="fa-solid fa-mobile"></i>Contact Us
				</button>
			</form>
		</div>
	</div>
</nav>