\<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/teacher/header.jsp" %>
<%@ include file="/layouts/teacher/nav.jsp" %>
    <style>
        body {
            font-family: 'Poppins', sans-serif ;
            line-height: 1.6;
        }
        /* Match card styles with course_create.jsp */
        .card {
            border: none;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05); /* Match shadow */
        }

        .card-header {
            background: linear-gradient(135deg, #ffc107, #ff9800); /* Match color theme */
            padding: 1.5rem; /* Match padding for height */
            color: white;
        }

        .card-header h3 {
            margin-bottom: 0;
        }

        .form-label {
            font-weight: 600;
            color: #1a202c;
        }

        .form-control, .form-select {
            border-radius: 0.5rem;
            padding: 0.75rem;
            transition: all 0.3s ease;
            background-color: #f9fafc;
        }
        .input-group-text {
            background-color: #f1f3f9;
        }
        .drop-zone {
        border: 2px dashed #ced4da;
        border-radius: 8px;
        padding: 2rem;
        text-align: center;
        cursor: pointer;
        }

        .drop-zone:hover {
        border-color: #6c757d;
        background-color: #f8f9fa;
        box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .btn-warning {
        border: none;
        font-weight: 600;
        padding: 0.75rem;
        border-radius: 0.5rem;
        transition: all 0.3s ease;
        width: 100%;
        color: white;
        }

        .btn-warning:hover {
        background-color: #ffb800; /* just a tiny bit darker */
        transform: translateY(-2px);
        box-shadow: 0 2px 6px rgba(255, 184, 0, 0.2); /* soft shadow */
        color: white;
        }
        .ck-editor__editable_inline {
            min-height: 150px !important;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow">
                    <div class="card-header position-relative">
                        <div class="position-absolute top-0 end-0 p-3 opacity-25">
                            <i class="fas fa-edit fa-4x"></i>
                        </div>
                        <h3 class="mb-0 position-relative">
                            <i class="fas fa-pencil-alt me-2"></i>Edit Course
                        </h3>
                        <p class="mb-0 mt-2 opacity-75 small">Update the details of your course below</p>
                    </div>
                    <div class="card-body">
                        <div id="noChangesAlert" class="alert alert-danger d-none" role="alert">
                            No changes detected. Please make at least one change before submitting.
                        </div>
                        <form id="editCourseForm" method="POST" action="/teacher/course/edit" enctype="multipart/form-data">
                            <input type="hidden" name="courseId" value="${course.id}" />
                            <input type="hidden" name="existingBannerImage" value="${course.banner_image}" />

                            <!-- Title Field -->
                            <div class="mb-4">
                                <label for="courseTitle" class="form-label">Course Title</label>
                                <input type="text" class="form-control" id="courseTitle" name="courseTitle" value="${course.title}" required>
                                <div class="invalid-feedback">Please provide a course title.</div>
                            </div>

                            <!-- Description Field -->
                            <div class="mb-4">
                                <label for="courseDescription" class="form-label">Course Description</label>
                                <textarea class="form-control" id="courseDescription" name="courseDescription" rows="4" required>${course.description}</textarea>
                                <div class="invalid-feedback">Please provide a course description.</div>
                            </div>

                            <!-- Category and Price Fields -->
                            <div class="row mb-4">
                                <div class="col-md-6">
                                    <label for="category" class="form-label">Category</label>
                                    <input class="form-control" list="categoryOptions" id="category" name="category" value="${course.category}" placeholder="Select category" required>
                                    <datalist id="categoryOptions">
                                        <option value="Programming">
                                        <option value="Design">
                                        <option value="Business">
                                        <option value="Marketing">
                                        <option value="Data Science">
                                    </datalist>
                                    <div class="invalid-feedback">Please select a category.</div>
                                </div>
                                <div class="col-md-6">
                                    <label for="price" class="form-label">Price ($)</label>
                                    <div class="input-group">
                                        <span class="input-group-text">$</span>
                                        <input type="number" class="form-control" id="price" name="price" value="${course.price}" placeholder="0.00" min="0" step="0.01" required>
                                        <div class="invalid-feedback">Please enter a valid price.</div>
                                    </div>
                                </div>
                            </div>

                            <!-- Image Upload -->
                            <div class="mb-4">
                                <label class="form-label">Course Banner Image</label>
                                <div id="drop-zone" class="drop-zone rounded text-center p-4">
                                    <div id="preview" class="mb-3 ${course.banner_image != null ? 'd-none' : ''}">
                                        <i class="fas fa-cloud-upload-alt fa-3x text-muted"></i>
                                        <p class="mb-1">Drag & drop your image here or click to browse</p>
                                        <small class="text-muted">(Recommended size: 1200×600 pixels)</small>
                                    </div>
                                    <img id="imagePreview" class="img-fluid rounded ${course.banner_image != null ? '' : 'd-none'}" 
                                         style="max-height: 200px; object-fit: contain;" 
                                         src="/FileController${course.banner_image}" />
                                    <input type="file" id="image" name="banner_image" accept="image/*" class="d-none">
                                </div>
                                <div class="invalid-feedback">Please upload a banner image.</div>
                            </div>

                            <!-- Submit Button -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-warning btn-lg">
                                    <i class="fas fa-save me-2"></i>Update Course
                                </button>
                            </div>

                            <!-- Progress Bar -->
                            <div id="progressContainer" class="progress mt-4 d-none">
                                <div id="upload-progress" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                    0%
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        //Form validation if there is any changes or not
        document.addEventListener('DOMContentLoaded', () => {
            const form = document.getElementById('editCourseForm');
            const noChangesAlert = document.getElementById('noChangesAlert');
            const progressBar = document.querySelector('.progress');

            // Capture the original state of the form fields
            const originalData = {
                courseTitle: document.getElementById('courseTitle').value.trim(),
                courseDescription: document.getElementById('courseDescription').value.trim(),
                price: document.getElementById('price').value.trim(),
                category: document.getElementById('category').value.trim(),
                existingBannerImage: document.querySelector('input[name="existingBannerImage"]').value.trim(),
            };

            let originalBannerImageFile = null;

            // Track if a new banner image is uploaded
            const fileInput = document.getElementById('image');
            fileInput.addEventListener('change', () => {
                originalBannerImageFile = fileInput.files[0];
            });

            form.addEventListener('submit', function (e) {
                e.preventDefault(); // Prevent the default form submission

                // Check if any field has changed
                const currentData = {
                    courseTitle: document.getElementById('courseTitle').value.trim(),
                    courseDescription: document.getElementById('courseDescription').value.trim(),
                    price: document.getElementById('price').value.trim(),
                    category: document.getElementById('category').value.trim(),
                    existingBannerImage: document.querySelector('input[name="existingBannerImage"]').value.trim(),
                };

                let hasChanges = false;

                // Compare original data with current data
                for (const key in originalData) {
                    if (originalData[key] !== currentData[key]) {
                        hasChanges = true;
                        break;
                    }
                }

                // Check if a new banner image is uploaded
                if (originalBannerImageFile) {
                    hasChanges = true;
                }

                if (!hasChanges) {
                    // Show the alert if no changes are detected
                    noChangesAlert.classList.remove('d-none');
                    noChangesAlert.scrollIntoView({ behavior: 'smooth' });
                    return; // Stop further execution
                }

                // Hide the alert if changes are detected
                noChangesAlert.classList.add('d-none');

                // Show progress bar
                progressBar.style.display = 'block';

                // Simulate form submission (you can remove the timeout in production)
                setTimeout(() => {
                    form.submit(); // Submit the form
                }, 1000); // Simulate a delay for the progress bar
            });
        });

        // Drag-and-drop functionality
        const dropZone = document.getElementById('drop-zone');
        const fileInput = document.getElementById('image');
        const previewImage = document.getElementById('imagePreview');
        const previewContainer = document.getElementById('preview');

        dropZone.addEventListener('dragover', (e) => {
            e.preventDefault();
            dropZone.classList.add('border-success');
        });

        dropZone.addEventListener('dragleave', () => {
            dropZone.classList.remove('border-success');
        });

        dropZone.addEventListener('drop', (e) => {
            e.preventDefault();
            dropZone.classList.remove('border-success');
            const file = e.dataTransfer.files[0];
            if (file) {
                fileInput.files = e.dataTransfer.files;
                previewImageFile(file);
            }
        });

        dropZone.addEventListener('click', () => {
            fileInput.click();
        });

        fileInput.addEventListener('change', () => {
            const file = fileInput.files[0];
            if (file) {
                previewImageFile(file);
            }
        });

        function previewImageFile(file) {
            const reader = new FileReader();
            reader.onload = (e) => {
                previewImage.src = e.target.result;
                previewImage.classList.remove('d-none');
                previewContainer.classList.add('d-none');
            };
            reader.readAsDataURL(file);
        }

        // On page load, check if a banner image exists
        window.addEventListener('DOMContentLoaded', () => {
            if (previewImage.src && previewImage.src.trim() !== '') {
                previewImage.classList.remove('d-none');
                previewContainer.classList.add('d-none');
            }
        });

        // CKEditor
        ClassicEditor
            .create(document.querySelector('#courseDescription'), {
                toolbar: [
                    'heading', '|',
                    'bold', 'italic', 'link', 'bulletedList', 'numberedList', '|',
                    'blockQuote', 'insertTable', 'undo', 'redo'
                ]
            })
            .catch(error => {
                console.error('CKEditor Error:', error);
            });
    </script>

<%@ include file="/layouts/teacher/footer.jsp" %>