<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body class="container">
	<c:if test="${not empty auth_user}">
		<div class="alert alert-success" role="alert">
			Welcome, ${auth_user.firstName} ${auth_user.lastName}
		</div>

		<a class="btn btn-danger" href="<c:url value='/LogoutController'/>">Logout</a>
	</c:if>

	<h1>Course List</h1>
	<a class="btn btn-primary" href="<c:url value='/CourseCreateController'/>">Add Course</a>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Title</th>
				<th scope="col">Description</th>
				<th scope="col">Instructor</th>
				<th scope="col">Category</th>
				<th scope="col">Price</th>
				<th scope="col">Is Published</th>
				<th scope="col">Image</th>
				<th scope="col">Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="course" items="${ courses }">
				<tr>
					<td>${course.id }</td>
					<td>${course.title }</td>
					<td>${course.description }</td>
					<td>${course.instructor } </td>
					<td>${course.category } </td>
					<td>${course.price } </td>
					<td>${course.is_published } </td>
					<td>
						<img src="<c:url value="/FileController${course.banner_image}" />" alt="Course Image" width="100"
							height="100"/>
					</td>
					<td>
						
						<a class="btn btn-primary"
							href="<c:url value='/CourseViewController?course_id=${course.id}'/>">View</a>
					
				</tr>
			</c:forEach>


		</tbody>
	</table>
</body>
</html>