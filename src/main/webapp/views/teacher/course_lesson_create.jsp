<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create Lesson</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
    <style>
        /* Minimal Custom CSS (Only for CKEditor Height) */
        .ck-editor__editable_inline {
            min-height: 300px !important;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <!-- Card Layout with Shadow -->
                <div class="card border-0 shadow-lg">
                    <div class="card-header bg-white py-3">
                        <h1 class="h4 fw-bold mb-0 text-primary border-start border-4 border-primary ps-3">
                            Create a New Lesson
                        </h1>
                        <p class="text-muted mb-0 mt-2">
                            Provide the necessary details below to create an engaging lesson.
                        </p>
                    </div>
                    
                    <div class="card-body p-4">
                        <form method="post" action="<c:url value='/teacher/course/lesson/create'/>">
                            <input type="hidden" name="course_id" value="${param.course_id}" />

                            <div class="row">
                                <!-- Left: Form Section -->
                                <div class="col-md-8 pe-md-4">
                                    <h2 class="h5 fw-semibold mb-3 text-dark">Lesson Details</h2>

                                    <!-- Title Input -->
                                    <div class="mb-4">
                                        <label for="title" class="form-label fw-medium">Title</label>
                                        <input type="text" name="title" id="title" class="form-control form-control-lg" 
                                               placeholder="Enter lesson title" required>
                                    </div>

                                    <!-- CKEditor Textarea -->
                                    <div class="mb-4">
                                        <label for="description" class="form-label fw-medium">Description</label>
                                        <textarea name="description" id="description" class="form-control" 
                                                  rows="10" placeholder="Describe the lesson..."></textarea>
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="d-grid gap-2 d-md-flex justify-content-md-start mt-4">
                                        <button type="submit" class="btn btn-primary px-4 py-2 fw-medium rounded-1">
                                            <i class="bi bi-save me-2"></i> Create Lesson
                                        </button>
                                        <a href="<c:url value='/teacher/course/detail?course_id=${param.course_id}'/>" 
                                        	 class="btn btn-outline-primary px-4 py-2 fw-medium rounded-1 d-flex align-items-center">
									        <i class="bi bi-arrow-left me-2"></i> Back to Course
									    </a>
                                        
                                    </div>
                                </div>

                                <!-- Right: Tips Section -->
                                <div class="col-md-4 mt-4 mt-md-0">
                                    <div class="sticky-top" style="top: 20px;">
                                        <h2 class="h5 fw-semibold mb-3 text-dark">Helpful Tips</h2>
                                        <!-- Tip Card 1 -->
                                        <div class="card border-0 mb-3 bg-light">
                                            <div class="card-body">
                                                <h3 class="h6 card-title text-primary fw-bold">Make it engaging:</h3>
                                                <ul class="list-unstyled mb-0">
                                                    <li class="mb-1"><small>• Use simple, clear language.</small></li>
                                                    <li class="mb-1"><small>• Structure with headers.</small></li>
                                                    <li class="mb-1"><small>• Include exercises.</small></li>
                                                </ul>
                                            </div>
                                        </div>
                                        
                                        <!-- Tip Card 2 -->
                                        <div class="card border-0 bg-light">
                                            <div class="card-body">
                                                <h3 class="h6 card-title text-primary fw-bold">Formatting Tips:</h3>
                                                <ul class="list-unstyled mb-0">
                                                    <li class="mb-1"><small>• Use headings properly.</small></li>
                                                    <li class="mb-1"><small>• Short paragraphs.</small></li>
                                                    <li class="mb-1"><small>• Add visuals.</small></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
	    let editorInstance; // Define it outside
	
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
	
	    // Add form submit validation
	    document.querySelector('form').addEventListener('submit', function (e) {
	        // Wait for editorInstance to be defined
	        if (!editorInstance) return;
	
	        const data = editorInstance.getData().trim();
	        if (data === '') {
	            e.preventDefault();
	            alert('Description is required.');
	            editorInstance.editing.view.focus();
	        }
	    });
	</script>

</body>
</html>