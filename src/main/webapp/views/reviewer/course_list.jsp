<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/reviewer/header.jsp" %>
<%@ include file="/layouts/reviewer/nav.jsp" %>
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
        </head>

        <body class="bg-body-tertiary">

            <div class="container py-5">
                <div class="card shadow-lg border-0">
                    <div class="card-header text-white d-flex justify-content-between align-items-center"
                        style="background-color:#6366f1;">
                        <h3 class="mb-0 fw-semibold">🧐 Course Review</h3>
                        <!-- Remove Add Course button for reviewer -->
                        <!-- <a href="<c:url value='/teacher/course/create'/>" class="btn btn-outline-light">
                ➕ Add Course
            </a> -->
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
                                            <td>
                                                <c:choose>
                                                    <c:when test="${course.courseStatus == 'published'}">
                                                        <span class="badge rounded-pill bg-success">Published</span>
                                                    </c:when>
                                                    <c:when test="${course.courseStatus == 'draft'}">
                                                        <span
                                                            class="badge rounded-pill bg-warning text-dark">Draft</span>
                                                    </c:when>
                                                    <c:when test="${course.courseStatus == 'under_review'}">
                                                        <span class="badge rounded-pill bg-primary">Under Review</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span
                                                            class="badge rounded-pill bg-secondary">${course.courseStatus}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>

                                            <td>
                                                <img src="<c:url value='/FileController${course.banner_image}'/>"
                                                    alt="Course Image" class="rounded"
                                                    style="width: 80px; height: 80px; object-fit: cover;">
                                            </td>
                                            <td>
                                                <div class="d-flex justify-content-center gap-2">
                                                    <a href="<c:url value='/reviewer/course/detail?course_id=${course.id}'/>"
                                                        class="btn btn-sm btn-outline-primary">
                                                        View
                                                    </a>
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
<%@ include file="/layouts/reviewer/footer.jsp" %>