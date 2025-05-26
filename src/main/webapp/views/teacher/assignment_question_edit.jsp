<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Assignment Question</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
        crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
</head>

<body>
    <div class="container">
        <h3 class="mt-4">Edit Assignment Question</h3>

        <form class="row g-3" method="post"
            action="<c:url value='/teacher/course/lesson/assignment/question/edit'/>">

            <!-- Hidden Fields -->
            <input type="hidden" name="question_id" value="${question.id}" />
            <input type="hidden" name="assignment_id" value="${param.assignment_id}" />
            <input type="hidden" name="course_id" value="${param.course_id}" />
            <input type="hidden" name="lesson_id" value="${param.lesson_id}" />

            <!-- Question Text -->
            <div class="col-12">
                <label for="question_text" class="form-label">Question Text</label>
                <textarea class="form-control" id="question_text" name="question_text" rows="3"
                    required>${question.question_text}</textarea>
            </div>

            <!-- Options -->
          <c:forEach var="opt" items="${fn:split(question.option, ',')}" varStatus="loop">
    <input type="text" class="form-control mb-2" name="option"
           value="${opt}" placeholder="Option ${fn:toUpperCase(fn:substring('ABCD', loop.index, loop.index + 1))}" />
</c:forEach>


            <!-- Correct Answer Dropdown -->
            <div class="mb-3 col-12">
                <label for="correct_answer" class="form-label">Correct Answer</label>
                <select class="form-select" id="correct_answer" name="correct_answer" required>
                    <option value="">Select the correct option</option>
                    <option value="A" ${question.correct_answer == 'A' ? 'selected' : ''}>Option A</option>
                    <option value="B" ${question.correct_answer == 'B' ? 'selected' : ''}>Option B</option>
                    <option value="C" ${question.correct_answer == 'C' ? 'selected' : ''}>Option C</option>
                    <option value="D" ${question.correct_answer == 'D' ? 'selected' : ''}>Option D</option>
                </select>
            </div>

            <button type="submit" class="btn btn-success">Update Question</button>
        </form>
    </div>
</body>

</html>
