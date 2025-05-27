<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="/layouts/guest/header.jsp" %>
        <style>
            .apply-teacher-header {
                background: linear-gradient(135deg, #0061f2 0%, #00a3ff 100%);
                padding: 4rem 0;
                color: white;
                position: relative;
                margin-bottom: 3rem;
            }

            .apply-teacher-header::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: url('/images/pattern.svg') repeat;
                opacity: 0.1;
            }

            .application-form {
                background: white;
                border-radius: 16px;
                padding: 2rem;
                box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
                margin-bottom: 3rem;
            }

            .form-section {
                margin-bottom: 2rem;
                padding-bottom: 2rem;
                border-bottom: 1px solid #e9ecef;
            }

            .form-section:last-child {
                border-bottom: none;
                margin-bottom: 0;
                padding-bottom: 0;
            }

            .section-title {
                font-size: 1.25rem;
                font-weight: 600;
                margin-bottom: 1.5rem;
                color: #1e2a35;
                display: flex;
                align-items: center;
                gap: 0.75rem;
            }

            .section-title i {
                color: #0061f2;
            }

            .form-label {
                font-weight: 500;
                margin-bottom: 0.5rem;
            }

            .form-text {
                font-size: 0.875rem;
                color: #64748b;
            }

            .requirements-list {
                list-style: none;
                padding: 0;
                margin: 2rem 0;
            }

            .requirements-list li {
                padding: 1rem;
                background: #f8f9fa;
                border-radius: 8px;
                margin-bottom: 1rem;
                display: flex;
                align-items: center;
                gap: 1rem;
            }

            .requirements-list i {
                color: #0061f2;
                font-size: 1.25rem;
            }

            .custom-file-upload {
                border: 2px dashed #e9ecef;
                border-radius: 8px;
                padding: 2rem;
                text-align: center;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .custom-file-upload:hover {
                border-color: #0061f2;
                background: #f8f9fa;
            }

            .custom-file-upload i {
                font-size: 2rem;
                color: #0061f2;
                margin-bottom: 1rem;
            }

            .submit-btn {
                padding: 1rem 2rem;
                font-size: 1.1rem;
            }

            @media (max-width: 768px) {
                .apply-teacher-header {
                    padding: 3rem 0;
                }
            }
        </style>
        </head>

        <body>
            <div layout:fragment="content">
                <!-- Header -->
                <section class="apply-teacher-header">
                    <div class="container">
                        <div class="row justify-content-center text-center">
                            <div class="col-lg-8">
                                <h1 class="display-4 mb-3">Become an Instructor</h1>
                                <p class="lead mb-0">Join our community of educators and share your knowledge with
                                    students worldwide</p>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Application Form -->
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="application-form">
                                <form action="/guest/apply-teacher" method="POST" enctype="multipart/form-data">
                                    <!-- Personal Information -->
                                    <div class="form-section">
                                        <h3 class="section-title">
                                            <i class="bi bi-person"></i>
                                            Personal Information
                                        </h3>
                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <label class="form-label">First Name</label>
                                                <input type="text" class="form-control" name="firstName" required>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label">Last Name</label>
                                                <input type="text" class="form-control" name="lastName" required>
                                            </div>
                                            <div class="col-12">
                                                <label class="form-label">Email Address</label>
                                                <input type="email" class="form-control" name="email" required>
                                            </div>
                                            <div class="col-12">
                                                <label class="form-label">Phone Number</label>
                                                <input type="tel" class="form-control" name="phone" required>
                                            </div>
                                            <div class="col-12">
                                                <label class="form-label">Password</label>
                                                <input type="password" class="form-control" name="password" required>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Professional Information -->
                                    <div class="form-section">
                                        <h3 class="section-title">
                                            <i class="bi bi-briefcase"></i>
                                            Professional Information
                                        </h3>
                                        <div class="mb-3">
                                            <label class="form-label">Professional Title</label>
                                            <input type="text" class="form-control" name="title"
                                                placeholder="e.g., Senior Software Engineer, Data Scientist" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Areas of Expertise</label>
                                            <select class="form-select" name="expertise" multiple required>
                                                <option value="web-development">Web Development</option>
                                                <option value="mobile-development">Mobile Development</option>
                                                <option value="data-science">Data Science</option>
                                                <option value="devops">DevOps</option>
                                                <option value="design">Design</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Years of Experience</label>
                                            <input type="number" class="form-control" name="experience" min="0"
                                                required>
                                        </div>
                                    </div>

                                    <!-- Teaching Experience -->
                                    <div class="form-section">
                                        <h3 class="section-title">
                                            <i class="bi bi-mortarboard"></i>
                                            Teaching Experience
                                        </h3>
                                        <div class="mb-3">
                                            <label class="form-label">Teaching Experience</label>
                                            <textarea class="form-control" name="teachingExperience" rows="4"
                                                placeholder="Describe your teaching experience and methodology"
                                                required></textarea>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Sample Course Outline</label>
                                            <textarea class="form-control" name="courseOutline" rows="4"
                                                placeholder="Provide a brief outline of a course you'd like to teach"
                                                required></textarea>
                                        </div>
                                    </div>

                                    <!-- Documents -->
                                    <div class="form-section">
                                        <h3 class="section-title">
                                            <i class="bi bi-file-earmark-text"></i>
                                            Supporting Documents
                                        </h3>
                                        <div class="mb-3">
                                            <label class="form-label">Resume/CV</label>
                                            <div class="custom-file-upload">
                                                <i class="bi bi-cloud-upload"></i>
                                                <p class="mb-1">Drop your resume here or click to upload</p>
                                                <p class="form-text mb-0">PDF or DOC format, max 5MB</p>
                                                <input type="file" name="resume" accept=".pdf,.doc,.docx" required
                                                    style="opacity: 0; position: absolute;">
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Profile Picture</label>
                                            <div class="custom-file-upload">
                                                <i class="bi bi-person-square"></i>
                                                <p class="mb-1">Upload a professional photo</p>
                                                <p class="form-text mb-0">JPG or PNG format, max 2MB</p>
                                                <input type="file" name="profilePicture" accept="image/*" required
                                                    style="opacity: 0; position: absolute;">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary submit-btn">
                                            Submit Application
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    // Handle file upload UI
                    const fileUploads = document.querySelectorAll('.custom-file-upload');
                    fileUploads.forEach(upload => {
                        const input = upload.querySelector('input[type="file"]');
                        const text = upload.querySelector('p');

                        upload.addEventListener('click', () => input.click());

                        input.addEventListener('change', () => {
                            if (input.files.length > 0) {
                                text.textContent = `Selected: ${input.files[0].name}`;
                            }
                        });
                    });
                });
            </script>
            <%@ include file="/layouts/guest/footer.jsp" %>