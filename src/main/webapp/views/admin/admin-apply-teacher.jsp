<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="/layouts/admin/header.jsp" %>
        <%@ include file="/layouts/admin/nav.jsp" %>
            <h2>Teacher Applications</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Title</th>
                        <th>Expertise</th>
                        <th>Experience</th>
                        <th>Submitted At</th>
                        <th>Resume</th>
                        <th>Profile Pic</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="app" items="${applications}">
                        <tr>
                            <td>${app.id}</td>
                            <td>${app.firstName} ${app.lastName}</td>
                            <td>${app.email}</td>
                            <td>${app.phone}</td>
                            <td>${app.title}</td>
                            <td>${app.expertise}</td>
                            <td>${app.experience}</td>
                            <td>${app.submittedAt}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/resume-view?file=${app.resumeFile}"
                                    target="_blank">View Resume</a>
                            </td>
                            <td>
                                <img src="${pageContext.request.contextPath}/uploads-view?file=${app.profilePicFile}" width="50" height="50" />
                            </td>
                            <td>
                                <!-- Add Approve/Reject buttons here -->
                                <form action="/admin/teacher-applications/approve" method="post"
                                    style="display:inline;">
                                    <input type="hidden" name="id" value="${app.id}" />
                                    <button type="submit" class="btn btn-success btn-sm">Approve</button>
                                </form>
                                <form action="/admin/teacher-applications/reject" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${app.id}" />
                                    <button type="submit" class="btn btn-danger btn-sm">Reject</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <%@ include file="/layouts/admin/footer.jsp" %>