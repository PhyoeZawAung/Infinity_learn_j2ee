<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/teacher/header.jsp" %>
<%@ include file="/layouts/teacher/nav.jsp" %>
            <div class="container">

                <form class="row g-3" method="post" action="<c:url value='/teacher/course/lesson/assignment/question/create'/>"
                    enctype="multipart/form-data">
                    <input type="hidden" name="course_id" value="${param.course_id}" />
                    <input type="hidden" name="lesson_id" value="${param.lesson_id}" />
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
<%@ include file="/layouts/teacher/footer.jsp" %>