<<<<<<< Updated upstream
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Dashboard</title>
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
        <h1>Teacher Dashboard</h1>
        <ul>
            <li><a href="<c:url value='/logout'/>" >Logout</a></li>
            <li><a href="<c:url value='/teacher/course/list'/>">View Course List</a></li>
        </ul>

	</div>

</body>
</html>
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="/layouts/teacher/header.jsp" %>
		<%@ include file="/layouts/teacher/nav.jsp" %>
			<div class="container">
				<!-- Write your content here -->
				<h1 class="mt-4">Dashboard</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
				<ul>
					<li><a href="<c:url value='/logout'/>">Logout</a></li>
					<li><a href="<c:url value='/teacher/course/list'/>">View Course List</a></li>
				</ul>
				<form class="row mb-4 justify-content-end">
					<div class="col-3">
						<select id="inputState" class="form-select">
							<option selected>2023</option>
							<option>2024</option>
							<option>2025</option>
						</select>
					</div>
				</form>
				<div class="row">
					<div class="col-xl-4 col-md-6">
						<div class="card mb-4">
							<div class="card-header">Students</div>
							<div class="card-body">


								<div class="row">
									<div class="col-8">Total</div>
									<div class="col-4 text-end">2000</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-8">Certified</div>
									<div class="col-4 text-end">500</div>
								</div>
								<hr>
							</div>
							<div class="card-footer d-flex align-items-center justify-content-between">
								<a class="small stretched-link" href="#">View Details</a>
								<div class="small"><i class="fas fa-angle-right"></i></div>
							</div>
						</div>
					</div>
					<div class="col-xl-8 col-md-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-area me-1"></i>
								Students Per Month
							</div>
							<div class="card-body"><canvas id="student-chart" width="100%" height="40"></canvas>
							</div>
						</div>
					</div>
					<div class="col-xl-4 col-md-6">
						<div class="card mb-4">
							<div class="card-header">Courses</div>
							<div class="card-body">

								<div class="row">
									<div class="col-8">Total</div>
									<div class="col-4 text-end">20</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-8">Reviewed</div>
									<div class="col-4 text-end">5</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-8">Under Reviewed</div>
									<div class="col-4 text-end">5</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-8">Draft</div>
									<div class="col-4 text-end">10</div>
								</div>
							</div>
							<div class="card-footer d-flex align-items-center justify-content-between">
								<a class="small stretched-link" href="#">View Details</a>
								<div class="small"><i class="fas fa-angle-right"></i></div>
							</div>
						</div>
					</div>
					<div class="col-xl-8 col-md-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-area me-1"></i>
								Courses Per Month
							</div>
							<div class="card-body"><canvas id="course-chart" width="100%" height="40"></canvas>
							</div>
						</div>
					</div>

				</div>

			</div>
			<%@ include file="/layouts/teacher/footer.jsp" %>
>>>>>>> Stashed changes
