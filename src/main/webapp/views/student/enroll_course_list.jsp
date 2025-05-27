<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/student/header.jsp" %>
<%@ include file="/layouts/student/nav.jsp" %>
	<!-- Page Content -->
<div class="container">

  <!-- Page Heading -->
  <h1 class="my-4">Enrolled Course List
  </h1>

  <div class="row">
  	<c:forEach var="course" items="${ courses }">
		<div class="col-lg-4 col-sm-6 mb-4">
			<div class="card h-100">
				<a href="<c:url value='/student/course/enroll/detail?course_id=${course.id}' />">
					<c:if test="${not empty course.banner_image}">
						<img class="card-img-top" src="<c:url value='/FileController${course.banner_image}' />" alt="">
					</c:if>
					<c:if test="${empty course.banner_image}">
						<img class="card-img-top" src="https://placehold.co/700x400" alt="">
					</c:if>
				</a>
				<div class="card-body">
					<h4 class="card-title">
						<a href="<c:url value='/student/course/enroll/detail?course_id=${course.id}' />">${course.title}</a>
					</h4>
					<p class="card-text">${course.shortDescription}</p>
					<div class="d-flex align-items-center gap-3 mb-3">
						<p class="mb-0 fw-medium text-muted" style="min-width: 80px;">Completed:</p>
						<div class="progress flex-grow-1" role="progressbar" 
							aria-label="Progress" 
							aria-valuenow="${course.progress}" 
							aria-valuemin="0" 
							aria-valuemax="100" 
							style="height: 24px;">
							<div class="progress-bar bg-success" 
								style="width: ${course.progress}%; font-weight: 500;">
								${course.progress}%
							</div>
					</div>
					</div>
					
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
<%@ include file="/layouts/student/footer.jsp" %>