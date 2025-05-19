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

        /* Video Card Styling */
        .video-card {
            position: relative;
            background: #f9f9f9;
            border-radius: 0.5rem;
            border: 1px solid #ddd;
            overflow: hidden;
            transition: box-shadow 0.3s, transform 0.2s;
        }

        .video-card:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            transform: translateY(-5px);
        }

        /* Video Thumbnail */
        .lesson-video-thumbnail {
            width: 100%;
            height: 130px;
            object-fit: cover;
            border-bottom: 1px solid #ddd;
        }

        /* Video Title */
        .video-title {
            font-size: 0.95rem;
            font-weight: 600;
            margin: 0.75rem 0;
            color: #333;
            text-align: center;
        }

        /* Watch Button */
        .btn-watch {
            font-size: 0.8rem;
            padding: 6px 12px;
            background-color: #198754;
            color: white;
            border-radius: 0.3rem;
            text-align: center;
            text-decoration: none;
            display: block;
            margin: 0 auto 0.75rem;
            width: fit-content;
        }

        .btn-watch:hover {
            background-color: #157347;
            color: white;
        }

        /* Dropdown Button Styling */
        .video-actions {
            display: none;
            z-index: 10;
        }

        .video-card:hover .video-actions {
            display: block;
        }

        .video-actions .btn {
            background: rgba(255, 255, 255, 0.8);
            border: 1px solid #ddd;
            font-size: 0.8rem;
            padding: 4px 8px;
            border-radius: 0.3rem;
        }

        .video-actions .btn:hover {
            background: rgba(255, 255, 255, 1);
            border-color: #ccc;
        }

        /* Dropdown Menu */
        .dropdown-menu {
            font-size: 0.9rem;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .dropdown-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .dropdown-item.text-danger {
            color: #dc3545;
        }

        .dropdown-item.text-danger:hover {
            background-color: #f8d7da;
            color: #a71d2a;
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
                <a href="<c:url value='/teacher/course/edit?course_id=${course.id}'/>" class="btn btn-custom btn-sm">
                    Edit Course
                </a>
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
                <a href="<c:url value='/teacher/course/lesson/create?course_id=${course.id}'/>" class="btn btn-outline-success mb-4">
                    ➕ Add Lesson
                </a>

                <!-- Lessons Section -->
                <c:forEach var="lesson" items="${course.lessons}">
                    <div class="lesson-card">
                        <div class="lesson-title">📘 ${lesson.title}</div>
                        <p>${lesson.description}</p>

                        <c:choose>
                            <c:when test="${not empty lesson.lessonVideos}">
                                <div class="video-grid">
                                    <c:forEach var="video" items="${lesson.lessonVideos}">
                                        <div class="video-card position-relative">
                                            <!-- Video Thumbnail -->
                                            <c:if test="${not empty video.thumbnail}">
                                                <img src="<c:url value='/FileController${video.thumbnail}'/>" class="lesson-video-thumbnail" alt="Video Thumbnail">
                                            </c:if>

                                            <!-- Dropdown Menu for Actions -->
                                            <div class="dropdown video-actions position-absolute top-0 end-0 m-2">
                                                <button class="btn btn-sm btn-light dropdown-toggle shadow" type="button" id="videoActions${video.id}" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Actions
                                                </button>
                                                <ul class="dropdown-menu" aria-labelledby="videoActions${video.id}">
                                                    <li>
                                                        <a class="dropdown-item" href="<c:url value='/teacher/course/lesson/lesson-video/edit?course_id=${course.id}&lesson_id=${lesson.id}&video_id=${video.id}'/>">
                                                            ✏ Edit Video
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a class="dropdown-item text-danger" href="<c:url value='/teacher/course/lesson/lesson-video/delete?course_id=${course.id}&lesson_id=${lesson.id}&video_id=${video.id}'/>">
                                                            🗑 Delete Video
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!-- Video Title -->
                                            <div class="video-title">${video.title}</div>

                                            <!-- Watch Button -->
                                            <c:if test="${not empty video.videoUrl}">
                                                <a href="<c:url value='/FileController${video.videoUrl}'/>" target="_blank" class="btn-watch">▶ Watch</a>
                                            </c:if>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <p class="no-videos">No videos available for this lesson.</p>
                            </c:otherwise>
                        </c:choose>

                        <div class="lesson-footer text-end">
                            <a href="<c:url value='/teacher/course/lesson/lesson-video/create?course_id=${course.id}&lesson_id=${lesson.id}'/>"
                                class="btn btn-sm btn-outline-success">➕ Add Video</a>
                            <!-- Edit Button -->
                            <a href="<c:url value='/teacher/course/lesson/edit?course_id=${course.id}&lesson_id=${lesson.id}'/>"
                                class="btn btn-sm btn-outline-success">✏ Edit Lesson</a>
                        </div>
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
