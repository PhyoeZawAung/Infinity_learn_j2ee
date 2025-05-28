<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Edit Profile</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body>
            <div class="container mt-5">
                <h2 class="mb-4">Edit Profile</h2>
                <div class="card shadow-sm">
                    <div class="card-body p-4">
                        <form method="post" action="<c:url value='/profile/edit'/>" enctype="multipart/form-data">
                            <div class="row mb-3">
                                <c:if test="${not empty user.profile_image}">
                                    <div class="col-md-3 text-center">
                                        <label class="form-label">Current Profile Image</label>
                                        <img src="<c:url value='/FileController/${user.profile_image}'/>"
                                            alt="Profile Picture" class="img-thumbnail mt-2" style="max-width: 150px;">
                                    </div>
                                </c:if>
                                <div class="col-md-9">
                                    <label for="profile_image" class="form-label">Upload New Profile Image</label>
                                    <input type="file" class="form-control" id="profile_image" name="profile_image"
                                        accept="image/*">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="first_name" class="form-label">First Name</label>
                                <input type="text" class="form-control" id="first_name" name="first_name"
                                    value="${user.firstName}" required>
                            </div>

                            <div class="mb-3">
                                <label for="last_name" class="form-label">Last Name</label>
                                <input type="text" class="form-control" id="last_name" name="last_name"
                                    value="${user.lastName}" required>
                            </div>

                            <!-- Teacher Detail Section -->
                            <c:if test="${user.role eq 'teacher'}">
                                <hr class="my-4">
                                <h5 class="mb-3">Update Teacher Details</h5>

                                <div class="mb-3">
                                    <label for="professional_title" class="form-label">Professional Title</label>
                                    <input type="text" class="form-control" id="professional_title"
                                        name="professional_title" value="${teacher_detail.professionalTitle}">
                                </div>

                                <div class="mb-3">
                                    <label for="experience_years" class="form-label">Years of Experience</label>
                                    <input type="number" class="form-control" id="experience_years"
                                        name="years_of_experience" value="${teacher_detail.yearOfExperience}" min="0">
                                </div>

                                <div class="mb-3">
                                    <label for="expertise_area" class="form-label">Area of Expertise</label>
                                    <input type="text" class="form-control" id="expertise_area" name="expertise_area"
                                        value="${teacher_detail.areaOfExpertise}">
                                </div>

                                <div class="mb-3">
                                    <label for="biography" class="form-label">Biography</label>
                                    <textarea class="form-control" id="biography" name="biography" rows="4"
                                        placeholder="Write a short biography...">${teacher_detail.biography}</textarea>
                                </div>
                            </c:if>
                            <!-- teacher detail end-->
                            <div class="mt-4">
                                <button type="submit" class="btn btn-success me-2">Update Profile</button>
                                <a href="<c:url value='/profile/view'/>" class="btn btn-secondary">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </body>

        </html>