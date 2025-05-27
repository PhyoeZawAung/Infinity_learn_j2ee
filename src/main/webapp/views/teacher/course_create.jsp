<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Create Course</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
  <!-- CKEditor CDN -->
  <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
  <style>
    /* ===== ROOT VARIABLES ===== */
    :root {
      --primary-color: #6366f1;
      --background-color: #f4f6fc;
      --card-bg: #ffffff;
      --border-color: #e2e8f0;
      --text-dark: #1a202c;
      --text-muted: #718096;
    }

    /* ===== BASE STYLES ===== */
    body {
      background-color: var(--background-color);
      font-family: 'Poppins', sans-serif;
      color: var(--text-dark);
      margin: 0;
      line-height: 1.6;
    }

    /* ===== FORM CONTAINER ===== */
    .form-container {
      background: var(--card-bg);
      max-width: 850px;
      margin: 3rem auto;
      padding: 2rem 2.5rem;
      border-radius: 12px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
    }

    /* ===== FORM LAYOUT ===== */
    .form-row {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      margin-bottom: 1.5rem;
    }

    .form-col {
      flex: 1 0 0%;
    }

    /* ===== FORM ELEMENTS ===== */
    .form-label {
      font-weight: 600;
      margin-bottom: 0.5rem;
      color: var(--text-dark);
      display: block;
    }

    .form-control,
    .form-select {
      border: 1px solid var(--border-color);
      border-radius: 0.5rem;
      padding: 0.75rem;
      transition: all 0.3s ease;
      width: 100%;
      background-color: #f9fafc;
    }

    .form-control:focus,
    .form-select:focus {
      border-color: var(--primary-color);
      box-shadow: 0 0 0 0.25rem rgba(99, 102, 241, 0.15);
      outline: none;
      background-color: #fff;
    }

    .input-group-text {
      background-color: #f1f3f9;
      border-color: var(--border-color);
    }

    .btn-primary {
      background-color: var(--primary-color);
      border: none;
      font-weight: 600;
      padding: 0.75rem;
      border-radius: 0.5rem;
      transition: all 0.3s ease;
      width: 100%;
      color: white;
    }

    .btn-primary:hover {
      background-color: #4f46e5;
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(99, 102, 241, 0.3);
    }

    .btn-primary:focus {
      outline: none;
      box-shadow: 0 0 0 0.25rem rgba(99, 102, 241, 0.5);
    }

    /* ===== UPLOAD STYLES ===== */
    .drop-zone {
      border: 2px dashed #ced4da;
      border-radius: 8px;
      padding: 2rem;
      text-align: center;
      cursor: pointer;
      transition: all 0.3s;
      background-color: rgba(99, 102, 241, 0.03);
      margin-bottom: 1rem;
    }

    .drop-zone:hover {
      border-color: #6c757d;
      background-color: #f8f9fa;
      box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
    }

    .drop-zone.dragover {
      background-color: #e9ecef;
      border-color: #495057;
    }

    #imagePreview {
      max-width: 100%;
      max-height: 200px;
      display: none;
      margin: 0 auto;
      object-fit: contain;
      border-radius: 6px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    .upload-icon {
      font-size: 3rem;
      color: var(--primary-color);
      margin-bottom: 1rem;
      opacity: 0.7;
    }

    /* ===== EDITOR STYLES ===== */
    .ck-editor {
      margin-top: 0.5rem;
    }

    .ck-editor__editable {
      min-height: 150px;
      border: 1px solid var(--border-color) !important;
      border-radius: 0.5rem !important;
      padding: 1rem !important;
    }

    /* ===== VALIDATION STYLES ===== */
    .invalid-feedback {
      color: #dc3545;
      font-size: 0.875rem;
      margin-top: 0.25rem;
      display: none;
    }

    .was-validated .form-control:invalid~.invalid-feedback {
      display: block;
    }

    .drop-zone.is-invalid {
      border-color: #dc3545;
      background-color: #fff5f5;
    }

    /* ===== CARD STYLES ===== */
    .card {
      border: none;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
    }

    .card-header {
      background: linear-gradient(135deg, var(--primary-color), #4f46e5);
      padding: 1.5rem;
      color: white;
    }

    .card-header h3 {
      margin-bottom: 0;
    }
  </style>
</head>

<body>
  <div class="container py-5">
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <div class="card shadow">
          <div class="card-header bg-primary text-white position-relative">
            <div class="position-absolute top-0 end-0 p-3 opacity-25">
              <i class="fas fa-graduation-cap fa-4x"></i>
            </div>
            <h3 class="mb-0 position-relative">
              <i class="fas fa-book-open me-2"></i>Create New Course
            </h3>
            <p class="mb-0 mt-2 opacity-75 small">Fill out the form below to create your new course</p>
          </div>
          <div class="card-body">
            <form class="needs-validation" method="post" action="<c:url value='/teacher/course/create'/>"
              enctype="multipart/form-data">

              <!-- Title Field -->
              <div class="mb-4">
                <label for="title" class="form-label">Course Title</label>
                <input type="text" class="form-control" id="title" name="title" required>
                <div class="invalid-feedback">Please provide a course title.</div>
              </div>

              <!-- Description Field with Rich Text Editor -->
              <div class="mb-4">
                <label for="description" class="form-label">Course Description</label>
                <div id="editorContainer"></div>
                <!-- Hidden input to store the actual value for form submission -->
                <input type="hidden" id="description" name="description">
                <div class="invalid-feedback">Please provide a course description.</div>
              </div>

              <!-- Short Description Field -->
              <div class="mb-4">
                <label for="shortDescription" class="form-label">Short Description</label>
                <textarea class="form-control" id="shortDescription" name="short_description" rows="3"
                  placeholder="A quick summary of the course" required></textarea>
                <div class="invalid-feedback">Please provide a short description.</div>
              </div>


              <!-- Category and Price Fields (Side by Side) -->
              <div class="form-row mb-4">
                <div class="form-col">
                  <label for="category" class="form-label">Category</label>
                  <input class="form-control" list="categoryOptions" id="category" name="category"
                    placeholder="Select category" required>
                  <datalist id="categoryOptions">
                    <option value="Programming">
                    <option value="Design">
                    <option value="Business">
                    <option value="Marketing">
                    <option value="Data Science">
                  </datalist>
                  <div class="invalid-feedback">
                    Please select a category.
                  </div>
                </div>
                <div class="form-col">
                  <label for="price" class="form-label">Price ($)</label>
                  <div class="input-group">
                    <span class="input-group-text">$</span>
                    <input type="number" class="form-control" id="price" name="price" placeholder="0.00" min="0"
                      step="0.01" required>
                    <div class="invalid-feedback">
                      Please enter a valid price.
                    </div>
                  </div>
                </div>
              </div>

              <!-- Image Upload with Drag & Drop -->
              <div class="mb-4">
                <label class="form-label">Course Banner Image</label>
                <div id="drop-zone" class="drop-zone">
                  <div id="preview">
                    <i class="fas fa-cloud-upload-alt fa-3x mb-3 text-muted"></i>
                    <p class="mb-1">Drag & drop your image here or click to browse</p>
                    <small class="text-muted">(Recommended size: 1200×600 pixels)</small>
                  </div>
                  <img id="imagePreview" class="img-fluid rounded"
                    style="max-height: 200px; object-fit: contain; display: none;">
                  <input type="file" id="image" name="banner_image" accept="image/*" class="d-none">
                </div>
                <div class="invalid-feedback">Please upload a banner image.</div>
              </div>

              <div class="d-grid mt-4">
                <button type="submit" class="btn btn-primary btn-lg">
                  <i class="fas fa-plus-circle me-2"></i>Create Course
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    let editorInstance;

    // Initialize CKEditor and store the instance
    ClassicEditor
      .create(document.querySelector('#editorContainer'), {
        toolbar: [
          'heading', '|',
          'bold', 'italic', 'link', 'bulletedList', 'numberedList', '|',
          'blockQuote', 'insertTable', 'undo', 'redo'
        ]
      })
      .then(editor => {
        editorInstance = editor;
      })
      .catch(error => {
        console.error('CKEditor Error:', error);
      });

    // Form validation
    window.addEventListener('load', function () {
      const forms = document.getElementsByClassName('needs-validation');

      Array.prototype.forEach.call(forms, function (form) {
        form.addEventListener('submit', function (event) {
          let isValid = true;

          // ✅ Sync CKEditor content back to textarea before validation
          if (editorInstance) {
            document.querySelector('#description').value = editorInstance.getData();
          }

          const editorData = editorInstance.getData().trim();
          const bannerImageInput = document.getElementById('image');

          // Validate description (CKEditor)
          const descriptionField = document.querySelector('#description');
          const descriptionFeedback = descriptionField.nextElementSibling;

          if (!editorData) {
            descriptionField.classList.add('is-invalid');
            descriptionFeedback.style.display = 'block';
            isValid = false;
          } else {
            descriptionField.classList.remove('is-invalid');
            descriptionFeedback.style.display = 'none';
          }

          // Validate image
          const imageFeedback = document.querySelector('#drop-zone + .invalid-feedback');
          if (!bannerImageInput.files.length) {
            bannerImageInput.classList.add('is-invalid');
            imageFeedback.style.display = 'block';
            isValid = false;
          } else {
            bannerImageInput.classList.remove('is-invalid');
            imageFeedback.style.display = 'none';
          }

          // Prevent native validation for hidden fields
          if (!form.checkValidity() || !isValid) {
            event.preventDefault();
            event.stopPropagation();
          } else {
            // Now safe to show loading state
            const submitBtn = form.querySelector('button[type="submit"]');
            submitBtn.innerHTML =
              '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>Creating...';
            submitBtn.disabled = true;
          }

          form.classList.add('was-validated');
        }, false);
      });
    });

    // Drag and Drop Logic
    const dropZone = document.getElementById('drop-zone');
    const fileInput = document.getElementById('image');
    const imagePreview = document.getElementById('imagePreview');
    const previewText = document.getElementById('preview');

    dropZone.addEventListener('click', () => fileInput.click());

    ['dragover', 'dragleave', 'drop'].forEach(event => {
      dropZone.addEventListener(event, (e) => {
        e.preventDefault();
        dropZone.classList.toggle('dragover', event === 'dragover');
      });
    });

    dropZone.addEventListener('drop', (e) => {
      if (e.dataTransfer.files.length) {
        fileInput.files = e.dataTransfer.files;
        updatePreview(fileInput.files[0]);
      }
    });

    fileInput.addEventListener('change', () => {
      if (fileInput.files[0]) {
        updatePreview(fileInput.files[0]);
      }
    });

    function updatePreview(file) {
      const reader = new FileReader();
      reader.onload = () => {
        imagePreview.src = reader.result;
        imagePreview.style.display = 'block';
        previewText.style.display = 'none';
      };
      reader.readAsDataURL(file);
    }
  </script>


</body>

</html>