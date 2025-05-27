<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Assignment Questions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">

    <h3 class="mb-3">Questions for: <span class="text-primary">${assignment.title}</span></h3>

    <!-- Add Question Button -->
    <a href="<c:url value='/teacher/course/lesson/assignment/question/create?course_id=${course_id}&lesson_id=${lesson_id}&assignment_id=${assignment_id}'/>"
       class="btn btn-success mb-3">➕ Add New Question</a>

    <!-- Back to Course View Button -->
    <a href="<c:url value='/teacher/course/detail?course_id=${course_id}'/>"
       class="btn btn-secondary mb-3 float-end">🔙 Back to Course</a>

    <div class="clearfix"></div>

    <!-- Question List -->
    <c:if test="${empty assignment.questions}">
        <div class="alert alert-info">No questions found for this assignment.</div>
    </c:if>

    <c:forEach var="q" items="${assignment.questions}">
        <div class="card mb-2">
            <div class="card-body">
                <h5 class="card-title">${q.question_text}</h5>
                <c:if test="${not empty q.option}">
                    <p class="card-text"><strong>Options:</strong> ${q.option}</p>
                </c:if>

                <a href="<c:url value='/teacher/course/lesson/assignment/question/edit?question_id=${q.id}&course_id=${course_id}&lesson_id=${lesson_id}&assignment_id=${assignment_id}'/>"
                   class="btn btn-sm btn-primary">✏️ Edit</a>

                <a href="<c:url value='/teacher/course/lesson/assignment/question/delete?question_id=${q.id}&assignment_id=${assignment_id}&course_id=${course_id}&lesson_id=${lesson_id}'/>"
                   class="btn btn-sm btn-danger"
                   onclick="return confirm('Are you sure you want to delete this question?')">🗑️ Delete</a>
            </div>
        </div>
    </c:forEach>

</div>
</body>
</html>
