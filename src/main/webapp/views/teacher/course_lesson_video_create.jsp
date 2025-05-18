<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Video Lesson</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
    <style>
        body {
            background: #f9f6f2;
            font-family: 'Segoe UI', sans-serif;
        }

        .card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.05);
            background: #fffdfb;
        }

        .form-label {
            font-weight: 600;
            color: #444;
        }

        .form-control {
            border-radius: 10px;
            background-color: #fefefe;
        }

        .btn-primary {
            background-color: #c79e7e;
            border-color: #c79e7e;
        }

        .btn-primary:hover {
            background-color: #b98d6d;
            border-color: #b98d6d;
        }
        .card-header {
            background-color: transparent;
        }
        .ck-editor__editable_inline {
            min-height: 300px !important;
        }
    </style>
</head>
<body>
    <div class="container my-5">
        <div class="card p-4 mx-auto" style="max-width: 1100px;">
            <div class="card-header text-center">
                <h2 class="fw-bold mb-1">Create a New Lesson</h2>
                <p class="text-muted mb-0">Provide details and upload a video to create a new lesson</p>
            </div>
            <div class="card-body">
                <form class="row g-3" method="post" action="<c:url value='/teacher/course/lesson/lesson-video/create'/>" enctype="multipart/form-data">
                    <input type="hidden" name="course_id" value="${param.course_id}" />
                    <input type="hidden" name="lesson_id" value="${param.lesson_id}" />

                    <!-- Title -->
                    <div class="col-12">
                        <label for="title" class="form-label">Lesson Title</label>
                        <input name="title" type="text" class="form-control" id="title" placeholder="Enter lesson title" required>
                    </div>

                    <!-- Description -->
                    <div class="col-12">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="4" placeholder="Describe the lesson video..."></textarea>
                    </div>

                    <!-- Video Upload -->
                    <div class="col-12">
                        <label for="video" class="form-label">Upload Video</label>
						<div class="input-group">
						        <input class="form-control" name="video" type="file" id="video" accept="video/*" required>
						    </div>
						    <small id="video-info" class="form-text text-muted mt-1"></small>
	                    </div>

                    <!-- Thumbnail Upload -->
                    <div class="col-12">
                        <label for="thumbnail" class="form-label">Upload Thumbnail</label>
                        <input class="form-control" name="thumbnail" type="file" id="thumbnail" accept="image/*" required>
                        <!-- Below the thumbnail input -->
						<img id="thumbnail-preview" class="img-fluid mt-2 rounded shadow-sm d-none" style="max-height: 200px;" />
                    </div>

                    <!-- Submit Button -->
                    <div class="col-12">
                        <button type="button" onclick="uploadVideo()" class="btn btn-primary w-100">Create Lesson</button>
                    </div>
                </form>

                <!-- Progress Bar -->
                <div class="d-none progress mt-5 mb-3">
		            <div id="upload-progress" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
		                0%
		            </div>
		        </div>
            </div>
        </div>
    </div>

    <script>
    function uploadVideo() {
        const form = document.querySelector('form');

        // Ensure CKEditor content is synced with the textarea
        if (editorInstance) {
            document.querySelector('#description').value = editorInstance.getData();
        }
        
        // DEBUG: log validation
        if (!form.checkValidity()) {
            console.log("Form is invalid");
            form.reportValidity(); // Triggers browser’s native validation UI
            return;
        } else {
            console.log("Form is valid");
        }

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
            }
        });

        xhr.onload = function() {
            if (xhr.status === 200) {
                console.log("Upload success");
                uploadProgressEle.innerHTML = 'Upload Complete!';
                setTimeout(() => {
                    window.location.href = '<c:url value="/teacher/course/detail"/>?course_id=' + formData.get('course_id');
                }, 1500); // 1.5 second delay to show the progress bar update
            } else {
                console.error('Upload failed with status', xhr.status);
                alert("Upload failed.");
            }
        };
        xhr.onerror = function() {
            console.error('Upload error');
            alert("An error occurred during upload.");
        };

        xhr.send(formData);
    }
        
        
        ClassicEditor
        .create(document.querySelector('#description'), {
            toolbar: [
                'heading', '|',
                'bold', 'italic', 'link', 'bulletedList', 'numberedList', '|',
                'blockQuote', 'insertTable', 'undo', 'redo'
            ]
        })
        .then(editor => {
            editorInstance = editor; // Correct: Assign the editor instance
        })
        .catch(error => {
            console.error('CKEditor Error:', error);
        });
    </script>
    <script>
    	//for thumbnail preview image
	    document.getElementById('thumbnail').addEventListener('change', function(event) {
	        const file = event.target.files[0];
	        const preview = document.getElementById('thumbnail-preview');
	        if (file) {
	            preview.src = URL.createObjectURL(file);
	            preview.classList.remove('d-none');
	        } else {
	            preview.classList.add('d-none');
	        }
	    });
    </script>
</body>
</html>
