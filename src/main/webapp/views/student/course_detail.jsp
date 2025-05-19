<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course View</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            background-color: #f5f7fa;
        }

        .card-header {
            background-color: #2eb872;
            color: white;
        }

        .btn-custom {
            background-color: #2eb872;
            color: white;
        }

        .btn-custom:hover {
            background-color: #249b60;
        }

        .course-banner {
            max-width: 200px;
            height: 150px;
            object-fit: cover;
            border-radius: 0.5rem;
        }

        .lesson-card {
            border: 1px solid #dee2e6;
            border-radius: 0.75rem;
            background-color: #ffffff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.03);
            padding: 1rem;
            margin-bottom: 2rem;
        }

        .lesson-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .video-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 1rem;
        }

        .video-card {
            background: #f9f9f9;
            border-radius: 0.5rem;
            border: 1px solid #ddd;
            padding: 0.75rem;
            display: flex;
            flex-direction: column;
            height: 100%;
            transition: box-shadow 0.2s;
        }

        .video-card:hover {
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }

        .lesson-video-thumbnail {
            width: 100%;
            height: 130px;
            object-fit: cover;
            border-radius: 0.375rem;
            margin-bottom: 0.5rem;
        }

        .video-title {
            font-size: 0.95rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: #333;
        }

        .btn-watch {
            font-size: 0.8rem;
            padding: 6px 12px;
            background-color: #198754;
            color: white;
            border-radius: 0.3rem;
            text-align: center;
            text-decoration: none;
        }

        .btn-watch:hover {
            background-color: #157347;
            color: white;
        }

        .lesson-footer {
            margin-top: 1rem;
        }

        .no-videos {
            font-style: italic;
            color: #888;
        }
    </style>
</head>

<body>
    <div class="container py-5">
        <div class="card shadow-lg border-0 mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h3 class="mb-0">📚 Course View</h3>
            </div>
            <div class="card-body bg-white">
                <h2>${course.title}</h2>
                <p class="lead">${course.description}</p>
                <div class="row gy-3 mb-4">
                    <div class="col-md-6">
                        <p><strong>Course ID:</strong> ${course.id}</p>
                        <p><strong>Category:</strong> ${course.category}</p>
                    </div>
                    <div class="col-md-6 text-center">
                        <p><strong>Lessons Available:</strong> ${course.lessons.size()}</p>
                        <img src="<c:url value='/FileController${course.banner_image}'/>" alt="Course Banner" class="course-banner">
                    </div>
                </div>
                <!-- Lessons Section -->
                <c:forEach var="lesson" items="${course.lessons}">
                    <div class="lesson-card">
                        <div class="lesson-title">📘 ${lesson.title}</div>
                        <p>${lesson.description}</p>

                        <c:choose>
                            <c:when test="${not empty lesson.lessonVideos}">
                                <div class="video-grid">
                                    <c:forEach var="video" items="${lesson.lessonVideos}">
                                        <div class="video-card">
                                            <c:if test="${not empty video.thumbnail}">
                                                <img src="<c:url value='/FileController${video.thumbnail}'/>" class="lesson-video-thumbnail" alt="Video Thumbnail">
                                            </c:if>
                                            <div class="video-title">${video.title}</div>
                                            <c:if test="${not empty video.videoUrl}">
                                                <c:if test="${video.isCompleted}">
                                                    <a href="<c:url value='/student/course/enroll/watch?course_id=${course.id}&lesson_id=${lesson.id}&video_id=${video.id}'/>" target="_blank" class="btn btn-danger">Watched</a>
                                                </c:if>
                                                <c:if test="${not video.isCompleted}">
                                                    <c:if test="${video.progress == 0}">
                                                        <a href="<c:url value='/student/course/enroll/watch?course_id=${course.id}&lesson_id=${lesson.id}&video_id=${video.id}'/>" target="_blank" class="btn btn-success">▶ Watch</a>
                                                    </c:if>
                                                    <c:if test="${video.progress > 0}">
                                                        <a href="<c:url value='/student/course/enroll/watch?course_id=${course.id}&lesson_id=${lesson.id}&video_id=${video.id}'/>" target="_blank" class="btn btn-primary">▶ Continue</a>
                                                    </c:if>
                                                    
                                                </c:if> 
                                            </c:if>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <p class="no-videos">No videos available for this lesson.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:forEach>
            </div>
            <div class="card-footer text-end small text-muted">
                Last updated: <%= new java.util.Date() %>
            </div>
        </div>
    </div>
</body>

</html>
