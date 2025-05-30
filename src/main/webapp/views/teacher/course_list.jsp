<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/teacher/header.jsp" %>
<%@ include file="/layouts/teacher/nav.jsp" %>
	<style>
		.desc-cell {
			max-width: 200px;
			padding: 0.5rem;
			vertical-align: middle;
		}

		.desc-text {
			display: -webkit-box;
			-webkit-box-orient: vertical;
			overflow: hidden;
			transition: all 0.3s ease;
		}
	</style>

<body class="bg-body-tertiary">
	<div class="container py-5">
		<div class="card shadow-lg border-0">
			<div class="card-header text-white d-flex justify-content-between align-items-center"
				style="background-color:#6366f1;">
				<h3 class="mb-0 fw-semibold"><i class="bi bi-book"></i> Course Management</h3>
				<a href="<c:url value='/teacher/course/create'/>" class="btn btn-outline-light">
					<i class="bi bi-plus-circle"></i> Add Course
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
							<c:forEach var="course" items="${courses}" varStatus="status">
								<tr class="text-center">
									<td>${status.index + 1}</td>
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
										<c:choose>
											<c:when test="${course.courseStatus == 'published'}">
												<span class="badge rounded-pill bg-success">Published</span>
											</c:when>
											<c:when test="${course.courseStatus == 'draft'}">
												<span class="badge rounded-pill bg-warning text-dark">Draft</span>
											</c:when>
											<c:when test="${course.courseStatus == 'under_review'}">
												<span class="badge rounded-pill bg-secondary">Under Review</span>
											</c:when>
										</c:choose>
									</td>

									<td>
										<img src="<c:url value='/FileController${course.banner_image}'/>"
											alt="Course Image" class="rounded"
											style="width: 80px; height: 80px; object-fit: cover;">
									</td>
									<td>
										<div class="d-flex justify-content-center gap-2">
											<a href="<c:url value='/teacher/course/detail?course_id=${course.id}'/>"
												class="btn btn-sm btn-outline-primary">
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

	<!-- This script enables smooth expansion of description texts when clicking over rows -->
	<script>
		document.querySelectorAll(".clickable-row").forEach(row => {
			const descText = row.querySelector(".desc-text");
	
			if (!descText) return;
	
			row.addEventListener("click", () => {
				descText.classList.toggle("collapsed");
				descText.classList.toggle("expanded");
			});
		});
	</script>
<%@ include file="/layouts/teacher/footer.jsp" %>