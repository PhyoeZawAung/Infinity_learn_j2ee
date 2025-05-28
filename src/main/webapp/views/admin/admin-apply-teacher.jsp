<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/layouts/admin/header.jsp" %>
<%@ include file="/layouts/admin/nav.jsp" %>
<style>
    .applications-container {
        padding: 2rem 0;
    }

    .page-header {
        background-color: #2563eb;
        color: white;
        padding: 2rem;
        border-radius: 1rem;
        margin-bottom: 2rem;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .page-header h2 {
        margin: 0;
        font-size: 1.75rem;
        font-weight: 600;
        display: flex;
        align-items: center;
        gap: 0.75rem;
    }

    .applications-table {
        background: white;
        border-radius: 1rem;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }

    .table-responsive {
        overflow-x: auto;
        -webkit-overflow-scrolling: touch;
        margin: 0;
        padding: 0;
    }

    .table-responsive::-webkit-scrollbar {
        height: 8px;
    }

    .table-responsive::-webkit-scrollbar-track {
        background: #f1f1f1;
        border-radius: 4px;
    }

    .table-responsive::-webkit-scrollbar-thumb {
        background: #2563eb;
        border-radius: 4px;
    }

    .table-responsive::-webkit-scrollbar-thumb:hover {
        background: #1d4ed8;
    }

    .applications-table table {
        margin: 0;
        width: 100%;
        min-width: 1200px; /* Ensures table doesn't get too compressed */
    }

    .applications-table thead {
        background-color: #f8fafc;
    }

    .applications-table th {
        padding: 1rem;
        font-weight: 600;
        color: #1e293b;
        border-bottom: 2px solid #e2e8f0;
        white-space: nowrap;
    }

    .applications-table td {
        padding: 1rem;
        vertical-align: middle;
        border-bottom: 1px solid #e2e8f0;
        white-space: nowrap;
    }

    .applications-table tbody tr:hover {
        background-color: #f8fafc;
    }

    .profile-image {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid #2563eb;
    }

    .action-buttons {
        display: flex;
        gap: 0.5rem;
    }

    .btn-approve {
        background-color: #2563eb;
        border-color: #2563eb;
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 0.5rem;
        font-size: 0.875rem;
        transition: all 0.2s ease;
    }

    .btn-approve:hover {
        background-color: #1d4ed8;
        border-color: #1d4ed8;
        color: white;
    }

    .btn-reject {
        background-color: #fee2e2;
        border-color: #fee2e2;
        color: #dc2626;
        padding: 0.5rem 1rem;
        border-radius: 0.5rem;
        font-size: 0.875rem;
        transition: all 0.2s ease;
    }

    .btn-reject:hover {
        background-color: #fecaca;
        border-color: #fecaca;
        color: #dc2626;
    }

    .resume-link {
        color: #2563eb;
        text-decoration: none;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .resume-link:hover {
        color: #1d4ed8;
        text-decoration: underline;
    }

    .status-badge {
        padding: 0.25rem 0.75rem;
        border-radius: 9999px;
        font-size: 0.75rem;
        font-weight: 500;
    }

    .status-pending {
        background-color: #fef3c7;
        color: #92400e;
    }

    .status-approved {
        background-color: #dcfce7;
        color: #166534;
    }

    .status-rejected {
        background-color: #fee2e2;
        color: #991b1b;
    }
</style>

<div class="applications-container">
    <div class="page-header">
        <h2>
            <i class="bi bi-person-plus"></i>
            Teacher Applications
        </h2>
    </div>

    <div class="applications-table">
        <div class="table-responsive">
            <table class="table">
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
                        <th>Profile</th>
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
                                    target="_blank" class="resume-link">
                                    <i class="bi bi-file-earmark-text"></i>
                                    View Resume
                                </a>
                            </td>
                            <td>
                                <img src="${pageContext.request.contextPath}/uploads-view?file=${app.profilePicFile}"
                                    class="profile-image" alt="Profile Picture" />
                            </td>
                            <td>
                                <div class="action-buttons">
                                    <form action="/admin/teacher-applications/approve" method="post" style="display:inline;">
                                        <input type="hidden" name="id" value="${app.id}" />
                                        <button type="submit" class="btn btn-approve">
                                            <i class="bi bi-check-lg"></i>
                                            Approve
                                        </button>
                                    </form>
                                    <form action="/admin/teacher-applications/reject" method="post" style="display:inline;">
                                        <input type="hidden" name="id" value="${app.id}" />
                                        <button type="submit" class="btn btn-reject">
                                            <i class="bi bi-x-lg"></i>
                                            Reject
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="/layouts/admin/footer.jsp" %>