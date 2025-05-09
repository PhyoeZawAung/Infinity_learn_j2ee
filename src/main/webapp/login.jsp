<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register New User</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
	crossorigin="anonymous"></script>
</head>
<body>
    	<div class="container">
		<h1>Login</h1>
		<c:if test="${not empty error}">
			<div class="alert alert-danger" role="alert">
				${error}
			</div>
		</c:if>
		
		<form class="row g-3" method="post" action="/login" >
			
            <div class="col-12">
				<label for="email" class="form-label">Email</label> <input
					name="email" type="text" class="form-control" id="email">
			</div>
            <div class="col-12">
				<label for="password" class="form-label">Password</label> <input
					name="password" type="text" class="form-control" id="password">
			</div>

			<div class="col-12">
				<button type="submit" class="btn btn-primary">Login</button>
			</div>
		</form>
	</div>
</body>
</html>
