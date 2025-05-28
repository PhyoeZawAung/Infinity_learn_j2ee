<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Change Password</title>
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

                .form-label {
                    font-weight: 500;
                    color: #495057;
                }

                .alert {
                    border-radius: 0.5rem;
                    border: none;
                }

                .alert-success {
                    background-color: #d4edda;
                    color: #155724;
                }

                .password-icon {
                    position: absolute;
                    right: 1rem;
                    top: 50%;
                    transform: translateY(-50%);
                    cursor: pointer;
                    color: #6c757d;
                }

                .input-group {
                    position: relative;
                }
            </style>
        </head>

        <body>
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header text-center">
                                <h3 class="mb-0"><i class="bi bi-shield-lock"></i> Change Password</h3>
                            </div>
                            <div class="card-body p-4">
                                <!-- Feedback messages -->
                                <c:if test="${not empty sessionScope.error}">
                                    <div class="alert alert-danger mb-4">
                                        <i class="bi bi-info-circle"></i> ${sessionScope.error}
                                    </div>
                                    <c:remove var="error" scope="session" />
                                </c:if>

                                <!-- Password Change Form -->
                                <form method="post" action="<c:url value='/profile/password/change'/>">
                                    <div class="mb-4">
                                        <label for="old_password" class="form-label">
                                            <i class="bi bi-key"></i> Current Password
                                        </label>
                                        <div class="input-group">
                                            <input type="password" class="form-control" id="old_password" name="old_password" required>
                                            <span class="password-icon" onclick="togglePassword('old_password')">
                                                <i class="bi bi-eye"></i>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="mb-4">
                                        <label for="new_password" class="form-label">
                                            <i class="bi bi-lock"></i> New Password
                                        </label>
                                        <div class="input-group">
                                            <input type="password" class="form-control" id="new_password" name="new_password" required>
                                            <span class="password-icon" onclick="togglePassword('new_password')">
                                                <i class="bi bi-eye"></i>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="mb-4">
                                        <label for="confirm_password" class="form-label">
                                            <i class="bi bi-lock-fill"></i> Confirm New Password
                                        </label>
                                        <div class="input-group">
                                            <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
                                            <span class="password-icon" onclick="togglePassword('confirm_password')">
                                                <i class="bi bi-eye"></i>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="d-grid gap-3">
                                        <button type="submit" class="btn btn-primary">
                                            <i class="bi bi-check-circle"></i> Update Password
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
                function togglePassword(inputId) {
                    const input = document.getElementById(inputId);
                    const icon = input.nextElementSibling.querySelector('i');
                    
                    if (input.type === 'password') {
                        input.type = 'text';
                        icon.classList.remove('bi-eye');
                        icon.classList.add('bi-eye-slash');
                    } else {
                        input.type = 'password';
                        icon.classList.remove('bi-eye-slash');
                        icon.classList.add('bi-eye');
                    }
                }
            </script>
        </body>

        </html>