<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/teacher/header.jsp" %>
<%@ include file="/layouts/teacher/nav.jsp" %>
            <div class="container">

                <form class="row g-3" method="post" action="<c:url value='/teacher/course/lesson/assignment/create'/>" enctype="multipart/form-data">
                    <input type="hidden" name="course_id" value= "${param.course_id}" />
                    <input type="hidden" name="lesson_id" value= "${param.lesson_id}" />
                    <div class="col-12">
                        <label for="title" class="form-label">Title</label> <input name="title" type="text"
                            class="form-control" id="title">
                    </div>
                    <div class="col-12">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                    </div>
                    <div class="col-12">
                        <label for="assignment_url" class="form-label">Upload Thumbnail</label>
                        <input class="form-control" name="assignment_url" type="file" id="assignment_url"
                            accept="image/*" required>
                        <!-- Below the thumbnail input -->
                        <img id="assignment_url-preview" class="img-fluid mt-2 rounded shadow-sm d-none"
                            style="max-height: 200px;" />
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary w-50">Create Lesson</button>
                    </div>
                </form>
            </div>

        <script>

            //for thumbnail preview image
            document.getElementById('assignment_url').addEventListener('change', function (event) {
                const file = event.target.files[0];
                const preview = document.getElementById('assignment_url-preview');
                if (file) {
                    preview.src = URL.createObjectURL(file);
                    preview.classList.remove('d-none');
                } else {
                    preview.classList.add('d-none');
                }
            });
        </script>
<%@ include file="/layouts/teacher/footer.jsp" %>