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
<script src="https://cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>
<style>
	/* styles.css */
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
  margin-right: -15px;
  margin-left: -15px;
  gap: 20px;
  margin-bottom: 1.5rem;
}

.form-col {
  padding-right: 15px;
  padding-left: 15px;
  flex: 1 0 0%;
}

/* ===== FORM ELEMENTS ===== */
.form-label {
  font-weight: 600;
  margin-bottom: 0.5rem;
  color: var(--text-dark);
  display: block;
}

.form-control, .form-select {
  border: 1px solid var(--border-color);
  border-radius: 0.5rem;
  padding: 0.75rem;
  transition: all 0.3s ease;
  width: 100%;
  background-color: #f9fafc;
}

.form-control:focus, .form-select:focus {
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
  box-shadow: 0 3px 10px rgba(0,0,0,0.1);
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
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
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
  min-height: 200px;
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

.was-validated .form-control:invalid ~ .invalid-feedback,
.was-validated .form-control:invalid ~ .invalid-feedback {
  display: block;
}

/* ===== RESPONSIVE STYLES ===== */
@media (max-width: 768px) {
  .form-container {
    padding: 1.5rem;
    margin: 1rem;
  }
  
  .form-row {
    flex-direction: column;
    gap: 15px;
  }
  
  .form-col {
    flex: 0 0 100%;
    max-width: 100%;
    padding-right: 0;
    padding-left: 0;
  }
  
  .drop-zone {
    padding: 1.5rem;
  }
  
  #imagePreview {
    max-height: 150px;
  }
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

/* ===== UTILITY CLASSES ===== */
.text-muted {
  color: var(--text-muted) !important;
}

.rounded {
  border-radius: 0.5rem !important;
}

.shadow {
  box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1) !important;
}

.d-none {
  display: none !important;
}

.d-flex {
  display: flex !important;
}

.flex-column {
  flex-direction: column !important;
}
.align-items-center {
  align-items: center !important;
}

.justify-content-center {
  justify-content: center !important;
}

.mb-3 {
  margin-bottom: 1rem !important;
}

.mb-1 {
  margin-bottom: 0.25rem !important;
}

.mt-4 {
  margin-top: 1.5rem !important;
}

.py-4 {
  padding-top: 1.5rem !important;
  padding-bottom: 1.5rem !important;
}

.px-3 {
  padding-left: 1rem !important;
  padding-right: 1rem !important;
}

.fa-3x {
  font-size: 3em !important;
}

.fw-semibold {
  font-weight: 600 !important;
}

.btn-sm {
  padding: 0.25rem 0.5rem !important;
  font-size: 0.875rem !important;
}

.rounded-pill {
  border-radius: 50rem !important;
}

.btn-outline-primary {
  color: var(--primary-color);
  border-color: var(--primary-color);
}

.btn-outline-primary:hover {
  color: #fff;
  background-color: var(--primary-color);
  border-color: var(--primary-color);
}

.position-relative {
  position: relative !important;
}

.position-absolute {
  position: absolute !important;
}

.top-0 {
  top: 0 !important;
}

.end-0 {
  right: 0 !important;
}

.opacity-25 {
  opacity: 0.25 !important;
}

.opacity-75 {
  opacity: 0.75 !important;
}

.small {
  font-size: 0.875rem !important;
}

.me-1 {
  margin-right: 0.25rem !important;
}

.me-2 {
  margin-right: 0.5rem !important;
}

.mb-0 {
  margin-bottom: 0 !important;
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
            <form class="needs-validation" method="post" action="<c:url value="/teacher/CourseCreateController"/>" enctype="multipart/form-data" novalidate>
              
              <!-- Title Field -->
              <div class="mb-4">
                <label for="title" class="form-label">Course Title</label>
                <input type="text" class="form-control" id="title" name="title" required>
                <div class="invalid-feedback">Please provide a course title.</div>
              </div>
              
              <!-- Description Field with Rich Text Editor -->
              <div class="mb-4">
                <label for="description" class="form-label">Course Description</label>
                <textarea class="form-control" id="description" name="description" required></textarea>
                <div class="invalid-feedback">Please provide a course description.</div>
              </div>
              
              <!-- Category and Price Fields (Side by Side) -->
              <div class="form-row mb-4">
				  <div class="form-col">
				    <label for="category" class="form-label">Category</label>
				    <input class="form-control" list="categoryOptions" id="category"
				      name="category" placeholder="Select category" required>
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
				      <input type="number" class="form-control" id="price"
				      name="price" placeholder="0.00" min="0" step="0.01" required>
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
				    <img id="imagePreview" class="img-fluid rounded" style="max-height: 200px; object-fit: contain;">
				    <input type="file" id="image" name="banner_image" accept="image/*" class="d-none" required>
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
  // Initialize CKEditor
  CKEDITOR.replace('description', {
    toolbar: [
      { name: 'clipboard', items: ['Undo', 'Redo'] },
      { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', '-', 'RemoveFormat'] },
      { name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight'] },
      { name: 'insert', items: ['Image', 'Table', 'HorizontalRule', 'Smiley'] },
      { name: 'styles', items: ['Format', 'FontSize'] },
      { name: 'colors', items: ['TextColor', 'BGColor'] },
      { name: 'links', items: ['Link', 'Unlink'] },
      { name: 'tools', items: ['Maximize'] }
    ],
    height: '180px',
    extraPlugins: 'maximize',
    removePlugins: 'elementspath',
    resize_enabled: true
  });

  // Form validation
  (function() {
    'use strict';
    window.addEventListener('load', function() {
      var forms = document.getElementsByClassName('needs-validation');
      var validation = Array.prototype.filter.call(forms, function(form) {
        form.addEventListener('submit', function(event) {
          // Manually validate CKEditor content
          var editorContent = CKEDITOR.instances.description.getData();
          var descriptionField = document.getElementById('description');
          if (editorContent.trim() === '') {
            descriptionField.setCustomValidity('Please provide a course description.');
            document.querySelector('#description + .invalid-feedback').style.display = 'block';
          } else {
            descriptionField.setCustomValidity('');
          }
          
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  })();

  // Drag and Drop Preview
  const dropZone = document.getElementById('drop-zone');
  const fileInput = document.getElementById('image');
  const imagePreview = document.getElementById('imagePreview');
  const previewText = document.getElementById('preview');

  dropZone.addEventListener('click', () => fileInput.click());

  dropZone.addEventListener('dragover', (e) => {
    e.preventDefault();
    dropZone.classList.add('dragover');
    dropZone.style.transform = "scale(1.02)";
  });

  dropZone.addEventListener('dragleave', () => {
    dropZone.classList.remove('dragover');
    dropZone.style.transform = "scale(1)";
  });
  dropZone.addEventListener('drop', (e) => {
    e.preventDefault();
    dropZone.classList.remove('dragover');
    dropZone.style.transform = "scale(1)";
    
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
	  reader.onload = (e) => {
	    const img = new Image();
	    img.src = e.target.result;
	    
	    img.onload = () => {
	      // Calculate new dimensions while maintaining aspect ratio
	      const maxWidth = 400;  // Maximum width for preview
	      const maxHeight = 200; // Maximum height for preview
	      let width = img.width;
	      let height = img.height;
	      
	      if (width > height) {
	        if (width > maxWidth) {
	          height *= maxWidth / width;
	          width = maxWidth;
	        }
	      } else {
	        if (height > maxHeight) {
	          width *= maxHeight / height;
	          height = maxHeight;
	        }
	      }
	      
	      // Create canvas to resize image
	      const canvas = document.createElement('canvas');
	      canvas.width = width;
	      canvas.height = height;
	      const ctx = canvas.getContext('2d');
	      ctx.drawImage(img, 0, 0, width, height);
	      
	      // Set the preview image
	      imagePreview.src = canvas.toDataURL('image/jpeg', 0.7);
	      imagePreview.style.display = 'block';
	      preview.style.display = 'none';
	      
	      // Set original file to hidden input
	      const dataTransfer = new DataTransfer();
	      dataTransfer.items.add(file);
	      fileInput.files = dataTransfer.files;
	    };
	  };
	  reader.readAsDataURL(file);
	}

  // Button hover effects
  const submitBtn = document.querySelector('button[type="submit"]');
  submitBtn.addEventListener('mouseenter', () => {
    submitBtn.style.transform = "translateY(-2px)";
    submitBtn.style.boxShadow = "0 5px 15px rgba(99, 102, 241, 0.4)";
  });
  submitBtn.addEventListener('mouseleave', () => {
    submitBtn.style.transform = "translateY(0)";
    submitBtn.style.boxShadow = "0 2px 10px rgba(99, 102, 241, 0.3)";
  });

  // Loading state for form submission
  document.querySelector('form').addEventListener('submit', function(e) {
    const submitBtn = this.querySelector('button[type="submit"]');
    submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>Creating...';
    submitBtn.disabled = true;
  });
</script>
</body>
</html>