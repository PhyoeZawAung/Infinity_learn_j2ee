<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Course Lesson create</title>
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
</head>
<body>
    <div class="container">
        <form class="row g-3" method="post"
            action="<c:url value='/CourseLessonCreateController'/>"
            >
            <input type="hidden" name="course_id"
                value="${param.course_id}" />
            <div class="col-12">
                <label for="title" class="form-label">Title</label> <input
                    name="title" type="text" class="form-control" id="title">
            </div>
            <div class="col-12">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description"
                    rows="3"></textarea>
            </div>
            
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Create lesson</button>
            </div>
        </form>
    </div>
</body>
</html>
