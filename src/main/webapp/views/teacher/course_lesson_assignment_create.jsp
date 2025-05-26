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
        </body>

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

        </html>