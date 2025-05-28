<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>User Profile</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        </head>

        <body>
            <c:if test="${not empty sessionScope.success}">
                <div class="alert alert-success">${sessionScope.success}</div>
                <c:remove var="success" scope="session" />
            </c:if>
            <div class="container mt-5">
                <h2>User Profile</h2>
                <div class="card mt-3 p-3">
                    <div class="row">
                        <div class="col-md-3 text-center">
                            <c:choose>
                                <c:when test="${not empty user.profile_image}">
                                    <img src="<c:url value='/FileController/${user.profile_image}'/>"
                                        alt="Profile Picture" class="img-thumbnail" style="max-width: 150px;">
                                </c:when>
                                <c:otherwise>
                                    <i class="bi bi-person-fill img-thumbnail" style="font-size: 150px;"></i>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="col-md-9">
                            <p><strong>First Name:</strong> ${user.firstName}</p>
                            <p><strong>Last Name:</strong> ${user.lastName}</p>
                            <p><strong>Email:</strong> ${user.email}</p>
                            <c:if test="${not empty teacher_detail}">
                                <hr>
                                <h5>Teacher Details</h5>
                                <p><strong>Professional Title:</strong> ${teacher_detail.professionalTitle}</p>
                                <p><strong>Years of Experience:</strong> ${teacher_detail.yearOfExperience}</p>
                                <p><strong>Area of Expertise:</strong> ${teacher_detail.areaOfExpertise}</p>
                                <c:if test="${not empty teacher_detail.biography}">
                                    <p><strong>Biography:</strong> ${teacher_detail.biography}</p>
                                </c:if>
                            </c:if>
                            <a href="<c:url value='/profile/edit'/>" class="btn btn-primary">Edit Profile</a>
                            <a href="<c:url value='/profile/password/change'/>" class="btn btn-secondary">Change
                                Password</a>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>