<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/student/header.jsp" %>
<%@ include file="/layouts/student/nav.jsp" %>
<style>
    .courses-container {
        padding: 2rem 0;
    }

    .page-header {
        background-color: #2563eb;
        color: white;
        padding: 2rem;
        border-radius: 1rem;
        margin-bottom: 2rem;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .page-header h1 {
        margin: 0;
        font-size: 1.75rem;
        font-weight: 600;
        display: flex;
        align-items: center;
        gap: 0.75rem;
    }

    .course-card {
        background: white;
        border-radius: 1rem;
        overflow: hidden;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s ease, box-shadow 0.2s ease;
        height: 100%;
        display: flex;
        flex-direction: column;
    }

    .course-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
    }

    .course-image {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }

    .course-body {
        padding: 1.5rem;
        flex-grow: 1;
    }

    .course-title {
        color: #1e293b;
        font-size: 1.25rem;
        font-weight: 600;
        margin-bottom: 0.75rem;
        text-decoration: none;
        display: block;
    }

    .course-title:hover {
        color: #2563eb;
    }

    .course-description {
        color: #64748b;
        font-size: 0.875rem;
        margin-bottom: 1rem;
    }

    .progress-container {
        margin-bottom: 1rem;
    }

    .progress-label {
        color: #64748b;
        font-size: 0.875rem;
        font-weight: 500;
        margin-bottom: 0.5rem;
        display: flex;
        justify-content: space-between;
    }

    .progress {
        height: 0.75rem;
        background-color: #e2e8f0;
        border-radius: 9999px;
        overflow: hidden;
    }

    .progress-bar {
        background-color: #2563eb;
        border-radius: 9999px;
        transition: width 0.3s ease;
    }

    .course-footer {
        padding: 1.5rem;
        background-color: #f8fafc;
        border-top: 1px solid #e2e8f0;
    }

    .course-info {
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
    }

    .course-info-item {
        color: #64748b;
        font-size: 0.875rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .course-info-item i {
        color: #2563eb;
    }

    .pagination {
        margin-top: 2rem;
    }

    .page-link {
        color: #2563eb;
        border: 1px solid #e2e8f0;
        padding: 0.5rem 1rem;
        margin: 0 0.25rem;
        border-radius: 0.5rem;
        transition: all 0.2s ease;
    }

    .page-link:hover {
        background-color: #2563eb;
        color: white;
        border-color: #2563eb;
    }

    .page-item.active .page-link {
        background-color: #2563eb;
        border-color: #2563eb;
        color: white;
    }
</style>

<div class="courses-container">
    <div class="page-header">
        <h1>
            <i class="bi bi-book"></i>
            My Enrolled Courses
        </h1>
    </div>

    <div class="row">
        <c:forEach var="course" items="${courses}">
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="course-card">
                    <a href="<c:url value='/student/course/enroll/detail?course_id=${course.id}' />">
                        <c:if test="${not empty course.banner_image}">
                            <img class="course-image" src="<c:url value='/FileController${course.banner_image}' />" alt="${course.title}">
                        </c:if>
                        <c:if test="${empty course.banner_image}">
                            <img class="course-image" src="https://placehold.co/700x400" alt="${course.title}">
                        </c:if>
                    </a>
                    <div class="course-body">
                        <a href="<c:url value='/student/course/enroll/detail?course_id=${course.id}' />" class="course-title">
                            ${course.title}
                        </a>
                        <p class="course-description">${course.shortDescription}</p>
                        <div class="progress-container">
                            <div class="progress-label">
                                <span>Course Progress</span>
                                <span>${course.progress}%</span>
                            </div>
                            <div class="progress" role="progressbar" 
                                aria-valuenow="${course.progress}" 
                                aria-valuemin="0" 
                                aria-valuemax="100">
                                <div class="progress-bar" style="width: ${course.progress}%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="course-footer">
                        <div class="course-info">
                            <div class="course-info-item">
                                <i class="bi bi-person"></i>
                                <span>Instructor: ${course.instructor}</span>
                            </div>
                            <div class="course-info-item">
                                <i class="bi bi-tag"></i>
                                <span>Category: ${course.category}</span>
                            </div>
                            <div class="course-info-item">
                                <i class="bi bi-currency-dollar"></i>
                                <span>Price: ${course.price}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                    <i class="bi bi-chevron-left"></i>
                </a>
            </li>
            <li class="page-item active">
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
                    <i class="bi bi-chevron-right"></i>
                </a>
            </li>
        </ul>
    </nav>
</div>
<%@ include file="/layouts/student/footer.jsp" %>