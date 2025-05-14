<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Course</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #fff9c4, #ffe082);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Roboto', sans-serif;
        }

        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background: linear-gradient(135deg, #ffca28, #ffa000);
            color: white;
            text-align: center;
            padding: 20px;
            font-size: 1.5rem;
            font-weight: bold;
        }

        .drop-zone {
            cursor: pointer;
            transition: border-color 0.3s ease;
        }

        .drop-zone.border-danger {
            border-color: #dc3545 !important;
        }

        .ck-editor__editable_inline {
            min-height: 150px !important;
        }

        .progress {
            display: none;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8">
                <div class="card">
                    <div class="card-header">
                        Edit Course
                    </div>
                    <div class="card-body">
                        <div id="noChangesAlert" class="alert alert-danger d-none" role="alert">
                            No changes detected. Please make at least one change before submitting.
                        </div>
                        <!-- Course Edit Form -->
                        <form id="editCourseForm" method="POST" action="/teacher/course/edit" enctype="multipart/form-data">
                            <input type="hidden" name="courseId" value="${course.id}" />
                            <input type="hidden" name="existingBannerImage" value="${course.banner_image}" />

                            <div class="mb-3">
                                <label for="courseTitle" class="form-label">Course Title</label>
                                <input type="text" id="courseTitle" name="courseTitle" class="form-control" value="${course.title}" />
                            </div>

                            <div class="mb-3">
                                <label for="courseDescription" class="form-label">Description</label>
                                <textarea id="courseDescription" name="courseDescription" class="form-control" rows="4">${course.description}</textarea>
                            </div>

                            <div class="mb-3">
                                <label for="category" class="form-label">Category</label>
                                <input class="form-control" list="categoryOptions" id="category" name="category" value="${course.category}" />
                                <datalist id="categoryOptions">
                                    <option value="Programming">
                                    <option value="Design">
                                    <option value="Business">
                                    <option value="Marketing">
                                    <option value="Data Science">
                                </datalist>
                            </div>

                            <div class="mb-3">
                                <label for="price" class="form-label">Price</label>
                                <input type="number" step="0.01" id="price" name="price" class="form-control" value="${course.price}" />
                            </div>

                            <div class="form-check mb-3">
                                <input type="checkbox" id="isPublished" name="isPublished" class="form-check-input" ${course.is_published ? "checked" : ""} />
                                <label for="isPublished" class="form-check-label">Published</label>
                            </div>

                            <div class="mb-3">
                                <label for="image" class="form-label">Banner Image</label>
                                <div id="drop-zone" class="drop-zone border border-primary rounded text-center p-4">
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
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Update Course</button>
                            </div>

                            <!-- Progress Bar -->
                            <div class="progress">
                                <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 100%"></div>
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
                isPublished: document.getElementById('isPublished').checked,
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
                    isPublished: document.getElementById('isPublished').checked,
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>