<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Edit Profile</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
            <style>
                body {
                    background-color: #f5f7fa;
                    font-family: 'Poppins', sans-serif;
                }

                .card {
                    border: none;
                    border-radius: 1rem;
                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                }

                .card-header {
                    background-color: #2563eb;
                    color: white;
                    border-radius: 1rem 1rem 0 0 !important;
                    padding: 1.5rem;
                }

                .form-control {
                    border-radius: 0.5rem;
                    padding: 0.75rem 1rem;
                    border: 1px solid #e9ecef;
                }

                .form-control:focus {
                    border-color: #2563eb;
                    box-shadow: 0 0 0 0.2rem rgba(37, 99, 235, 0.25);
                }

                .btn-success {
                    background-color: #2563eb;
                    border-color: #2563eb;
                    padding: 0.75rem 1.5rem;
                    border-radius: 0.5rem;
                    font-weight: 500;
                }

                .btn-success:hover {
                    background-color: #1d4ed8;
                    border-color: #1d4ed8;
                }

                .btn-secondary {
                    background-color: #6c757d;
                    border-color: #6c757d;
                    padding: 0.75rem 1.5rem;
                    border-radius: 0.5rem;
                    font-weight: 500;
                }

                .btn-secondary:hover {
                    background-color: #5a6268;
                    border-color: #5a6268;
                }

                .form-label {
                    font-weight: 500;
                    color: #495057;
                }

                .profile-image-preview {
                    width: 150px;
                    height: 150px;
                    object-fit: cover;
                    border-radius: 50%;
                    border: 3px solid #2563eb;
                    padding: 3px;
                    background-color: white;
                }

                .teacher-section {
                    background-color: #f8f9fa;
                    border-radius: 0.5rem;
                    padding: 1.5rem;
                    margin-top: 1rem;
                }

                .teacher-section h5 {
                    color: #2563eb;
                    margin-bottom: 1rem;
                }

                .custom-file-upload {
                    display: inline-block;
                    padding: 0.75rem 1.5rem;
                    cursor: pointer;
                    background-color: #f8f9fa;
                    border: 1px solid #e9ecef;
                    border-radius: 0.5rem;
                    color: #495057;
                    transition: all 0.2s ease;
                }

                .custom-file-upload:hover {
                    background-color: #e9ecef;
                }

                .custom-file-upload i {
                    margin-right: 0.5rem;
                    color: #2563eb;
                }
            </style>
        </head>

        <body>
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="mb-0"><i class="bi bi-person-gear"></i> Edit Profile</h3>
                            </div>
                            <div class="card-body p-4">
                                <form method="post" action="<c:url value='/profile/edit'/>" enctype="multipart/form-data">
                                    <div class="row mb-4">
                                        <c:if test="${not empty user.profile_image}">
                                            <div class="col-md-4 text-center">
                                                <label class="form-label">Current Profile Image</label>
                                                <img src="<c:url value='/FileController/${user.profile_image}'/>"
                                                    alt="Profile Picture" class="profile-image-preview mt-2">
                                            </div>
                                        </c:if>
                                        <div class="col-md-8">
                                            <label for="profile_image" class="form-label">
                                                <i class="bi bi-image"></i> Upload New Profile Image
                                            </label>
                                            <div class="input-group">
                                                <label class="custom-file-upload">
                                                    <i class="bi bi-cloud-upload"></i> Choose File
                                                    <input type="file" class="form-control" id="profile_image" name="profile_image"
                                                        accept="image/*" style="display: none;">
                                                </label>
                                                <span class="form-text ms-2" id="file-name">No file chosen</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mb-4">
                                        <label for="first_name" class="form-label">
                                            <i class="bi bi-person"></i> First Name
                                        </label>
                                        <input type="text" class="form-control" id="first_name" name="first_name"
                                            value="${user.firstName}" required>
                                    </div>

                                    <div class="mb-4">
                                        <label for="last_name" class="form-label">
                                            <i class="bi bi-person"></i> Last Name
                                        </label>
                                        <input type="text" class="form-control" id="last_name" name="last_name"
                                            value="${user.lastName}" required>
                                    </div>

                                    <!-- Teacher Detail Section -->
                                    <c:if test="${user.role eq 'teacher'}">
                                        <div class="teacher-section">
                                            <h5><i class="bi bi-mortarboard"></i> Update Teacher Details</h5>

                                            <div class="mb-4">
                                                <label for="professional_title" class="form-label">
                                                    <i class="bi bi-award"></i> Professional Title
                                                </label>
                                                <input type="text" class="form-control" id="professional_title"
                                                    name="professional_title" value="${teacher_detail.professionalTitle}">
                                            </div>

                                            <div class="mb-4">
                                                <label for="experience_years" class="form-label">
                                                    <i class="bi bi-clock-history"></i> Years of Experience
                                                </label>
                                                <input type="number" class="form-control" id="experience_years"
                                                    name="years_of_experience" value="${teacher_detail.yearOfExperience}" min="0">
                                            </div>

                                            <div class="mb-4">
                                                <label for="expertise_area" class="form-label">
                                                    <i class="bi bi-book"></i> Area of Expertise
                                                </label>
                                                <input type="text" class="form-control" id="expertise_area" name="expertise_area"
                                                    value="${teacher_detail.areaOfExpertise}">
                                            </div>

                                            <div class="mb-4">
                                                <label for="biography" class="form-label">
                                                    <i class="bi bi-file-text"></i> Biography
                                                </label>
                                                <textarea class="form-control" id="biography" name="biography" rows="4"
                                                    placeholder="Write a short biography...">${teacher_detail.biography}</textarea>
                                            </div>
                                        </div>
                                    </c:if>

                                    <div class="mt-4">
                                        <button type="submit" class="btn btn-success me-2">
                                            <i class="bi bi-check-circle"></i> Update Profile
                                        </button>
                                        <a href="<c:url value='/profile/view'/>" class="btn btn-secondary">
                                            <i class="bi bi-x-circle"></i> Cancel
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                // Update file name display when a file is selected
                document.getElementById('profile_image').addEventListener('change', function(e) {
                    const fileName = e.target.files[0]?.name || 'No file chosen';
                    document.getElementById('file-name').textContent = fileName;
                });
            </script>
        </body>

        </html>