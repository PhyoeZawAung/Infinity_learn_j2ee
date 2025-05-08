<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Course View</title>
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
    <h1>Course View</h1>

    <h2>Course: ${course.title}</h2>
    <p>${course.description}</p>
    <h3>Lessons</h3>
    <p>Course ID: ${course.id}</p>
    ${course.lessons.size()} lessons available.
    <p>Category: ${course.category}</p>
    <p>Banner Image: <img src="/FileController${course.banner_image}" alt="Course Banner" /></p>
    <a class="btn btn-secondary" href="<c:url value='/CourseEditController?course_id=${course.id}'/>">Edit Course</a>
    <a class="btn btn-primary" href="<c:url value='/CourseLessonCreateController?course_id=${course.id}'/>">Add Lesson</a>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Title</th>
                <th scope="col">Description</th>
                <th>Videos</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="lesson" items="${course.lessons}">
                <tr>
                    <td>${lesson.id}</td>
                    <td>${lesson.title}</td>
                    <td>${lesson.description}</td>
                    <td>
                        <c:if test="${not empty lesson.lessonVideos}">
                            <ul>
                                <c:forEach var="video" items="${lesson.lessonVideos}">
                                    <li>${video.title}</li>
                                    <c:if test="${not empty video.thumbnail}">
                                        <img src="/FileController${video.thumbnail}" alt="Video Thumbnail" width="100" height="100"/>
                                    </c:if>
                                    <c:if test="${not empty video.videoUrl}">
                                        <a href="/FileController${video.videoUrl}" target="_blank">Watch</a>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </c:if>
                        <c:if test="${empty lesson.lessonVideos}">
                            No videos available
                        </c:if>
                        <a href="<c:url value='/CourseLessonVideoCreateController?course_id=${course.id}&lesson_id=${lesson.id}'/>">Add Video</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
</body>
</html>
