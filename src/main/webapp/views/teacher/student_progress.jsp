<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Lesson Progress</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="mb-4">
            <a href="<c:url value='/teacher/course/detail?course_id=${course.id}'/>" class="btn btn-secondary btn-sm">&larr; Back to Course</a>
        </div>
        <div class="card shadow-sm mb-4">
            <div class="card-header bg-success text-white">
                <h4 class="mb-0">Lesson Progress for ${student.firstName} ${student.lastName}</h4>
                <div class="small">Course: <strong>${course.title}</strong> (ID: ${course.id})</div>
            </div>
            <div class="card-body">
                <c:if test="${empty course.lessons}">
                    <div class="alert alert-info">No lessons available in this course.</div>
                </c:if>
                <c:if test="${not empty course.lessons}">
                    <div class="accordion" id="lessonAccordion">
                        <c:forEach var="lesson" items="${course.lessons}" varStatus="ls">
                            <div class="accordion-item mb-2">
                                <h2 class="accordion-header" id="heading${ls.index}">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapse${ls.index}" aria-expanded="false"
                                            aria-controls="collapse${ls.index}">
                                        <span class="fw-bold">Lesson ${ls.index + 1}: ${lesson.title}</span>
                                    </button>
                                </h2>
                                <div id="collapse${ls.index}" class="accordion-collapse collapse"
                                     aria-labelledby="heading${ls.index}" data-bs-parent="#lessonAccordion">
                                    <div class="accordion-body">
                                        <p class="mb-2">${lesson.description}</p>
                                        <c:if test="${not empty lesson.lessonVideos}">
                                            <div class="mb-3">
                                                <div class="d-flex justify-content-between align-items-center mb-1">
                                                    <span class="small text-muted">
                                                        Progress: ${lesson.completedVideos} / ${lesson.totalVideos} videos
                                                    </span>
                                                    <span class="small fw-bold">
                                                        ${lesson.progressPercent}%
                                                    </span>
                                                </div>
                                                <div class="progress" style="height: 18px;">
                                                    <div class="progress-bar bg-success" role="progressbar"
                                                         style="width: ${lesson.progressPercent}%;" aria-valuenow="${lesson.progressPercent}"
                                                         aria-valuemin="0" aria-valuemax="100">
                                                        ${lesson.progressPercent}%
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${empty lesson.lessonVideos}">
                                            <div class="alert alert-warning mb-0">No videos in this lesson.</div>
                                        </c:if>
                                        <c:if test="${not empty lesson.lessonVideos}">
                                            <table class="table table-bordered table-sm align-middle">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Video Title</th>
                                                        <th>Status</th>
                                                        <th>Progress</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="video" items="${lesson.lessonVideos}" varStatus="vs">
                                                        <tr>
                                                            <td>${vs.index + 1}</td>
                                                            <td>${video.title}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${video.isCompleted}">
                                                                        <span class="badge bg-success">Completed</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span class="badge bg-secondary">Not Watched</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${video.progress > 0}">
                                                                        100%
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span class="text-muted">-</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
