<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/teacher/header.jsp" %>
<%@ include file="/layouts/teacher/nav.jsp" %>
    <div class="container">
        <form class="row g-3" method="post"
            action="<c:url value='/teacher/course/lesson/assignment/edit'/>"
            enctype="multipart/form-data">
            
            <input type="hidden" name="course_id" value="${assignment.courseId}" />
            <input type="hidden" name="lesson_id" value="${assignment.lessonId}" />
            <input type="hidden" name="assignment_id" value="${assignment.id}" />

            <div class="col-12">
                <label for="title" class="form-label">Title</label>
                <input name="title" type="text" class="form-control" id="title" value="${assignment.title}" required>
            </div>

            <div class="col-12">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3" required>${assignment.description}</textarea>
            </div>

            <div class="col-12">
                <label for="assignment_url" class="form-label">Update File</label>
                <input class="form-control" name="assignment_url" type="file" id="assignment_url" accept="image/*">
                
                <c:if test="${not empty assignment.assignmentUrl}">
                    <p class="mt-2">Current File:</p>
                    <img src="<c:url value='/FileController${assignment.assignmentUrl}'/>" alt="Assignment File"
                        class="img-fluid rounded shadow-sm" style="max-height: 200px;" id="assignment_url-preview">
                </c:if>
            </div>

            <div class="col-12">
                <button type="submit" class="btn btn-success w-50">Update Assignment</button>
            </div>
        </form>
    </div>

<script>
    document.getElementById('assignment_url').addEventListener('change', function (event) {
        const file = event.target.files[0];
        const preview = document.getElementById('assignment_url-preview');
        if (file) {
            preview.src = URL.createObjectURL(file);
            preview.classList.remove('d-none');
        }
    });
</script>

<%@ include file="/layouts/teacher/footer.jsp" %>
