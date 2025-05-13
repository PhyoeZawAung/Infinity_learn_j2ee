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
<body>
	<!-- Page Content -->
<div class="container">

  <!-- Page Heading -->
  <h1 class="my-4">Course List
  </h1>

  <div class="row">
  	<c:forEach var="course" items="${ courses }">
		<div class="col-lg-4 col-sm-6 mb-4">
			<div class="card h-100">
				<a href="<c:url value='/guest/course/detail?id=${course.id}' />">
					<c:if test="${not empty course.banner_image}">
						<img class="card-img-top" src="<c:url value='/FileController${course.banner_image}' />" alt="">
					</c:if>
					<c:if test="${empty course.banner_image}">
						<img class="card-img-top" src="https://placehold.co/700x400" alt="">
					</c:if>
				</a>
				<div class="card-body">
					<h4 class="card-title">
						<a href="<c:url value='/guest/course/detail?id=${course.id}' />">${course.title}</a>
					</h4>
					<p class="card-text">${course.shortDescription}</p>
				</div>
				<div class="card-footer">
				<div class="d-flex flex-column">
					<small class="text-muted">Instructor: ${course.instructor}</small>
					<small class="text-muted">Category: ${course.category}</small>
					<small class="text-muted">Price: ${course.price}</small>
				</div>
					
				</div>
			</div>
    	</div>
	</c:forEach>
  </div>
  <!-- /.row -->

  <!-- Pagination -->
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">1</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">2</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">3</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
  </ul>

</div>
</body>
</html>