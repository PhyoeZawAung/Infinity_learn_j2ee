<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Insert title here</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
                crossorigin="anonymous"></script>
        </head>

        <body>
            <div class="container">

                <form class="row g-3" method="post" action="<c:url value='/teacher/course/lesson/assignment/question/create'/>"
                    enctype="multipart/form-data">

                    <input type="hidden" name="assignment_id" value="${param.assignment_id}" />
                    <div class="col-12">
                        <label for="question_text" class="form-label">Question Text</label>
                        <textarea class="form-control" id="question_text" name="question_text" rows="3"></textarea>
                    </div>
                    <div class="mb-3 col-12">
                        <label class="form-label">Options</label>
                        <input type="text" class="form-control mb-2" name="option" placeholder="Option 1" required>
                        <input type="text" class="form-control mb-2" name="option" placeholder="Option 2" required>
                        <input type="text" class="form-control mb-2" name="option" placeholder="Option 3">
                        <input type="text" class="form-control mb-2" name="option" placeholder="Option 4">
                    </div>
                    <!-- Correct Answer Dropdown -->
                    <div class="mb-3 col-12">
                        <label for="correct_answer" class="form-label">Correct Answer</label>
                        <select class="form-select" id="correct_answer" name="correct_answer" required>
                            <option value="">Select the correct option</option>
                            <option value="A">Option A</option>
                            <option value="B">Option B</option>
                            <option value="C">Option C</option>
                            <option value="D">Option D</option>
                        </select>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-primary">Create Question</button>
                </form>
            </div>
        </body>
        </html>