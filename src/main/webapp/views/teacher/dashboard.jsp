<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/teacher/header.jsp" %>
<%@ include file="/layouts/teacher/nav.jsp" %>
<style>
    .dashboard-container {
        padding: 2rem 0;
    }

    .dashboard-header {
        background-color: #2563eb;
        color: white;
        padding: 2rem;
        border-radius: 1rem;
        margin-bottom: 2rem;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .dashboard-header h1 {
        margin: 0;
        font-size: 2rem;
        font-weight: 600;
    }

    .dashboard-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 1.5rem;
        margin-top: 2rem;
    }

    .dashboard-card {
        background: white;
        border-radius: 1rem;
        padding: 1.5rem;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s ease, box-shadow 0.2s ease;
        text-decoration: none;
        color: inherit;
        display: flex;
        align-items: center;
        gap: 1rem;
    }

    .dashboard-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        color: inherit;
    }

    .dashboard-card i {
        font-size: 2rem;
        color: #2563eb;
    }

    .dashboard-card-content h3 {
        margin: 0;
        font-size: 1.25rem;
        color: #1e293b;
    }

    .dashboard-card-content p {
        margin: 0.5rem 0 0;
        color: #64748b;
        font-size: 0.875rem;
    }

    .logout-card {
        background-color: #fee2e2;
    }

    .logout-card i {
        color: #dc2626;
    }
</style>

<div class="dashboard-container">
    <div class="dashboard-header">
        <h1><i class="bi bi-person-workspace"></i> Teacher Dashboard</h1>
    </div>

    <div class="dashboard-grid">
        <a href="<c:url value='/teacher/course/list'/>" class="dashboard-card">
            <i class="bi bi-book"></i>
            <div class="dashboard-card-content">
                <h3>My Courses</h3>
                <p>Manage your courses and content</p>
            </div>
        </a>

        <a href="<c:url value='/teacher/course/create'/>" class="dashboard-card">
            <i class="bi bi-plus-circle"></i>
            <div class="dashboard-card-content">
                <h3>Create Course</h3>
                <p>Add a new course to the platform</p>
            </div>
        </a>

        <a href="<c:url value='/chat/list'/>" class="dashboard-card">
            <i class="bi bi-chat-dots"></i>
            <div class="dashboard-card-content">
                <h3>Chat System</h3>
                <p>Communicate with students and staff</p>
            </div>
        </a>

        <a href="<c:url value='/logout'/>" class="dashboard-card logout-card">
            <i class="bi bi-box-arrow-right"></i>
            <div class="dashboard-card-content">
                <h3>Logout</h3>
                <p>Sign out from your account</p>
            </div>
        </a>
    </div>
</div>
<%@ include file="/layouts/teacher/footer.jsp" %>