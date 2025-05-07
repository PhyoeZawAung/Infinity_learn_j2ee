<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>create course</title>
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
		<form class="row g-3" method="post" action="<c:url value="/CourseCreateController"/>" enctype="multipart/form-data">
			<div class="col-12">
				<label for="title" class="form-label">Title</label> <input
					name="title" type="text" class="form-control" id="title">
			</div>
			<div class="col-12">
				<label for="description" class="form-label">Description</label>
				<textarea class="form-control" id="description" name="description"
					rows="3"></textarea>
			</div>
			<div class="col-12">
				<label for="category" class="form-label">Category</label> <input
					class="form-control" list="categoryOptions" id="category"
					name="category" placeholder="Category">
				<datalist id="categoryOptions">
					<option value="San Francisco">
					<option value="New York">
					<option value="Seattle">
					<option value="Los Angeles">
					<option value="Chicago">
				</datalist>
			</div>
			<div class="col-12">
				<label for="image" class="form-label">Image
					example</label> <input class="form-control" name="banner_image" type="file" id="image">
			</div>
			
			<div class="col-12">
				<button type="submit" class="btn btn-primary">Create course</button>
			</div>
		</form>
	</div>

</body>
</html>