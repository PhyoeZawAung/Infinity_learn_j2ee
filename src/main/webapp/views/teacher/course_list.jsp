<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Course List</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
	<style>
		.desc-cell {
			max-width: 200px;
			padding: 0.5rem;
			vertical-align: middle;
		}
	
		.desc-wrapper {
			overflow: hidden;
			max-height: 1.5em;
			transition: max-height 0.6s ease;
		}
	
		.desc-text {
			text-align: left;
			white-space: normal;
			line-height: 1.5;
		}
	</style>
</head>
<body class="bg-body-tertiary">
	<c:if test="${not empty auth_user}">
		<div class="alert alert-success" role="alert">
			Welcome, ${auth_user.firstName} ${auth_user.lastName}
		</div>

		<a class="btn btn-danger" href="<c:url value='/LogoutController'/>">Logout</a>
	</c:if>

	<div class="container py-5">
		<div class="card shadow-lg border-0">
			<div class="card-header text-white d-flex justify-content-between align-items-center" style="background-color:#6366f1;">
				<h3 class="mb-0 fw-semibold">📚 Course Management</h3>
				<a href="<c:url value='/teacher/course/create'/>" class="btn btn-outline-light">
					➕ Add Course
				</a>
			</div>

			<div class="card-body p-0">
				<div class="table-responsive">
					<table class="table table-striped table-hover align-middle mb-0">
						<thead class="table-light text-center">
							<tr>
								<th>#</th>
								<th>Title</th>
								<th>Description</th>
								<th>Instructor</th>
								<th>Category</th>
								<th>Price</th>
								<th>Status</th>
								<th>Image</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="course" items="${courses}">
								<tr class="text-center">
									<td>${course.id}</td>
									<td class="text-start">${course.title}</td>
									<td class="desc-cell text-start">
										<div class="desc-wrapper">
											<div class="desc-text">${course.shortDescription}</div>
										</div>
									</td>
									<td>${course.instructor}</td>
									<td>${course.category}</td>
									<td><span class="fw-semibold text-success">$${course.price}</span></td>
									<td>
										<span class="badge rounded-pill ${course.is_published ? 'bg-success' : 'bg-warning text-dark'}">
											${course.is_published ? 'Published' : 'Draft'}
										</span>
									</td>
									<td>
										<img src="<c:url value='/FileController${course.banner_image}'/>"
											alt="Course Image" class="rounded" style="width: 80px; height: 80px; object-fit: cover;">
									</td>
									<td>
										<div class="d-flex justify-content-center gap-2">
											<a href="<c:url value='/teacher/course/detail?course_id=${course.id}'/>" class="btn btn-sm btn-outline-primary">
												View
											</a>
											<!-- Future buttons -->
											<!-- <a href="#" class="btn btn-sm btn-outline-warning">Edit</a> -->
											<!-- <a href="#" class="btn btn-sm btn-outline-danger">Delete</a> -->
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<div class="card-footer text-end small text-muted">
				Last updated: <%= new java.util.Date() %>
			</div>
		</div>
	</div>

	<!-- This script enables smooth expansion of description texts when hovering over rows -->
	<script>
		document.querySelectorAll("tr").forEach(row => {
			const wrapper = row.querySelector(".desc-wrapper");
			if (!wrapper) return;
	
			row.addEventListener("mouseenter", () => {
				// Force collapse first
				wrapper.style.maxHeight = "1.5em";
	
				// After small delay, expand smoothly
				setTimeout(() => {
					const fullHeight = wrapper.scrollHeight;
					wrapper.style.maxHeight = fullHeight + "px";
				}, 100); // delay before expanding
			});
	
			row.addEventListener("mouseleave", () => {
				// Collapse smoothly
				wrapper.style.maxHeight = "1.5em";
			});
		});
	</script>

</body>
</html>
