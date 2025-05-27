<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Change Password</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body>
            <div class="container mt-5" style="max-width: 600px;">
                <h2 class="mb-4 text-center">Change Password</h2>

                <!-- Feedback messages -->
                <c:if test="${not empty sessionScope.error}">
                    <div class="alert alert-success">${sessionScope.error}</div>
                    <c:remove var="error" scope="session" />
                </c:if>

                <!-- Password Change Form -->
                <form method="post" action="<c:url value='/profile/password/change'/>">
                    <div class="mb-3">
                        <label for="old_password" class="form-label">Current Password</label>
                        <input type="password" class="form-control" id="old_password" name="old_password" required>
                    </div>

                    <div class="mb-3">
                        <label for="new_password" class="form-label">New Password</label>
                        <input type="password" class="form-control" id="new_password" name="new_password" required>
                    </div>

                    <div class="mb-3">
                        <label for="confirm_password" class="form-label">Confirm New Password</label>
                        <input type="password" class="form-control" id="confirm_password" name="confirm_password"
                            required>
                    </div>

                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary">Update Password</button>
                        <a href="<c:url value='/profile/view'/>" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </body>

        </html>