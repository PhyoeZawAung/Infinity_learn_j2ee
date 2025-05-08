<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
    <div class="container">
        
        <form class="row g-3" method="post"
            action="<c:url value='/CourseLessonVideoCreateController'/>" enctype="multipart/form-data">
            <input type="hidden" name="course_id" value="${param.course_id}" />
            <input type="hidden" name="lesson_id" value="${param.lesson_id}" />
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
				<label for="video" class="form-label">Video</label> 
                <input class="form-control" name="video" type="file" id="image">
			</div>
            <div class="col-12">
				<label for="thumbnail" class="form-label">Thumbnail</label> 
                <input class="form-control" name="thumbnail" type="file" id="image">
			</div>

            <div class="col-12">
                <button type="button" onclick="uploadVideo()" class="btn btn-primary">Create lesson</button>
            </div>
        </form>
        <div class="d-none progress mt-5 mb-3">
            <div id="upload-progress" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                0%
            </div>
        </div>
    </div>
</body>

<script>

function uploadVideo()
{
    console.log('uploadVideo called');
    const form = document.querySelector('form');
    const formData = new FormData(form);
    
    const uploadProgressEle = document.getElementById('upload-progress');
    uploadProgressEle.parentElement.classList.remove('d-none');
const xhr = new XMLHttpRequest();
xhr.open('POST', form.action, true);
xhr.upload.addEventListener('progress', function(e) {
    if (e.lengthComputable) {
        const percentComplete = (e.loaded / e.total) * 100;
        uploadProgressEle.style.width = percentComplete + '%';
        uploadProgressEle.setAttribute('aria-valuenow', percentComplete);
        uploadProgressEle.innerHTML = Math.round(percentComplete) + '%';
        console.log('Upload progress: ' + percentComplete + '%');
    }
}, false);

xhr.onload = function() {
    if (xhr.status === 200) {
        console.log('Upload complete');
        window.location.href = '<c:url value="/CourseViewController"/>?course_id=' + formData.get('course_id');
        // Handle success
    } else {
        console.error('Upload failed');
        // Handle error
    }
};
xhr.onerror = function() {
    console.error('Upload error');
    // Handle error
};
xhr.send(formData);
}
</script>
</html>
