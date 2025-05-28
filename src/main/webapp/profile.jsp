<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>User Profile</title>
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

                .profile-image {
                    width: 150px;
                    height: 150px;
                    object-fit: cover;
                    border-radius: 50%;
                    border: 3px solid #2563eb;
                    padding: 3px;
                    background-color: white;
                }

                .profile-icon {
                    font-size: 150px;
                    color: #2563eb;
                    background-color: #f8f9fa;
                    border-radius: 50%;
                    padding: 20px;
                    border: 3px solid #2563eb;
                }

                .profile-info {
                    font-size: 1.1rem;
                }

                .profile-info p {
                    margin-bottom: 1rem;
                    padding-bottom: 0.5rem;
                    border-bottom: 1px solid #e9ecef;
                }

                .profile-info p:last-child {
                    border-bottom: none;
                }

                .profile-info strong {
                    color: #2563eb;
                    font-weight: 600;
                    margin-right: 0.5rem;
                }

                .btn-primary {
                    background-color: #2563eb;
                    border-color: #2563eb;
                    padding: 0.75rem 1.5rem;
                    border-radius: 0.5rem;
                    font-weight: 500;
                }

                .btn-primary:hover {
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

                .alert {
                    border-radius: 0.5rem;
                    border: none;
                }

                .alert-success {
                    background-color: #d4edda;
                    color: #155724;
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
            </style>
        </head>

        <body>
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-body p-4">
                                <c:if test="${not empty sessionScope.success}">
                                    <div class="alert alert-success mb-4">
                                        <i class="bi bi-check-circle"></i> ${sessionScope.success}
                                    </div>
                                    <c:remove var="success" scope="session" />
                                </c:if>

                                <div class="row">
                                    <div class="col-md-4 text-center mb-4 mb-md-0">
                                        <c:choose>
                                            <c:when test="${not empty user.profile_image}">
                                                <img src="<c:url value='/FileController/${user.profile_image}'/>"
                                                    alt="Profile Picture" class="profile-image">
                                            </c:when>
                                            <c:otherwise>
                                                <i class="bi bi-person-fill profile-icon"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="profile-info">
                                            <p><strong><i class="bi bi-person"></i> First Name:</strong> ${user.firstName}</p>
                                            <p><strong><i class="bi bi-person"></i> Last Name:</strong> ${user.lastName}</p>
                                            <p><strong><i class="bi bi-envelope"></i> Email:</strong> ${user.email}</p>

                                            <c:if test="${not empty teacher_detail}">
                                                <div class="teacher-section">
                                                    <h5><i class="bi bi-mortarboard"></i> Teacher Details</h5>
                                                    <p><strong><i class="bi bi-award"></i> Professional Title:</strong> ${teacher_detail.professionalTitle}</p>
                                                    <p><strong><i class="bi bi-clock-history"></i> Years of Experience:</strong> ${teacher_detail.yearOfExperience}</p>
                                                    <p><strong><i class="bi bi-book"></i> Area of Expertise:</strong> ${teacher_detail.areaOfExpertise}</p>
                                                    <c:if test="${not empty teacher_detail.biography}">
                                                        <p><strong><i class="bi bi-file-text"></i> Biography:</strong> ${teacher_detail.biography}</p>
                                                    </c:if>
                                                </div>
                                            </c:if>

                                            <div class="mt-4">
                                                <a href="<c:url value='/profile/edit'/>" class="btn btn-primary me-2">
                                                    <i class="bi bi-pencil"></i> Edit Profile
                                                </a>
                                                <a href="<c:url value='/profile/password/change'/>" class="btn btn-secondary">
                                                    <i class="bi bi-key"></i> Change Password
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>