<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/student/header.jsp" %>
<%@ include file="/layouts/student/nav.jsp" %>
<style>
    body {
        background-color: #f8fafc;
    }

    .page-header {
        background-color: #2563eb;
        color: white;
        padding: 2rem;
        border-radius: 1rem;
        margin-bottom: 2rem;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .page-header h1 {
        margin: 0;
        font-size: 1.75rem;
        font-weight: 600;
        display: flex;
        align-items: center;
        gap: 0.75rem;
    }

    .course-info {
        background: white;
        border-radius: 1rem;
        padding: 2rem;
        margin-bottom: 2rem;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .course-banner {
        width: 100%;
        max-width: 300px;
        height: 200px;
        object-fit: cover;
        border-radius: 0.75rem;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .course-meta {
        display: flex;
        gap: 1rem;
        margin: 1rem 0;
        flex-wrap: wrap;
    }

    .meta-item {
        background: #f1f5f9;
        padding: 0.5rem 1rem;
        border-radius: 0.5rem;
        font-size: 0.875rem;
        color: #475569;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .meta-item i {
        color: #2563eb;
    }

    .lesson-card {
        background: white;
        border-radius: 1rem;
        padding: 1.5rem;
        margin-bottom: 1.5rem;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s ease;
    }

    .lesson-card:hover {
        transform: translateY(-2px);
    }

    .lesson-title {
        color: #1e293b;
        font-size: 1.25rem;
        font-weight: 600;
        margin-bottom: 1rem;
        display: flex;
        align-items: center;
        gap: 0.75rem;
    }

    .lesson-title i {
        color: #2563eb;
    }

    .video-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 1.5rem;
        margin-top: 1rem;
    }

    .video-card {
        background: #f8fafc;
        border-radius: 0.75rem;
        overflow: hidden;
        transition: all 0.2s ease;
    }

    .video-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .video-thumbnail {
        width: 100%;
        height: 160px;
        object-fit: cover;
    }

    .video-content {
        padding: 1rem;
    }

    .video-title {
        color: #1e293b;
        font-size: 1rem;
        font-weight: 500;
        margin-bottom: 0.75rem;
    }

    .btn-watch {
        background-color: #2563eb;
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 0.5rem;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        transition: background-color 0.2s ease;
    }

    .btn-watch:hover {
        background-color: #1d4ed8;
        color: white;
    }

    .btn-watch.completed {
        background-color: #059669;
    }

    .btn-watch.completed:hover {
        background-color: #047857;
    }

    .btn-watch.continue {
        background-color: #7c3aed;
    }

    .btn-watch.continue:hover {
        background-color: #6d28d9;
    }

    .no-videos {
        color: #64748b;
        font-style: italic;
        text-align: center;
        padding: 2rem;
        background: #f8fafc;
        border-radius: 0.5rem;
    }
</style>

<div class="container py-5">
    <div class="page-header">
        <h1>
            <i class="bi bi-book"></i>
            Course Details
        </h1>
    </div>

    <div class="course-info">
        <div class="row align-items-center">
            <div class="col-md-8">
                <h2 class="mb-3">${course.title}</h2>
                <p class="lead text-muted mb-4">${course.description}</p>
                <div class="course-meta">
                    <div class="meta-item">
                        <i class="bi bi-bookmark"></i>
                        <span>Category: ${course.category}</span>
                    </div>
                    <div class="meta-item">
                        <i class="bi bi-collection-play"></i>
                        <span>${course.lessons.size()} Lessons</span>
                    </div>
                    <div class="meta-item">
                        <i class="bi bi-person"></i>
                        <span>Instructor: ${instructor.firstName} ${instructor.lastName}</span>
                    </div>
                </div>
            </div>
            <div class="col-md-4 text-center">
                <img src="<c:url value='/FileController${course.banner_image}'/>" alt="Course Banner" class="course-banner">
            </div>
        </div>
    </div>

    <c:forEach var="lesson" items="${course.lessons}">
        <div class="lesson-card">
            <div class="lesson-title">
                <i class="bi bi-journal-text"></i>
                ${lesson.title}
            </div>
            <p class="text-muted mb-4">${lesson.description}</p>

            <c:choose>
                <c:when test="${not empty lesson.lessonVideos}">
                    <div class="video-grid">
                        <c:forEach var="video" items="${lesson.lessonVideos}">
                            <div class="video-card">
                                <c:if test="${not empty video.thumbnail}">
                                    <img src="<c:url value='/FileController${video.thumbnail}'/>" class="video-thumbnail" alt="Video Thumbnail">
                                </c:if>
                                <div class="video-content">
                                    <div class="video-title">${video.title}</div>
                                    <c:if test="${not empty video.videoUrl}">
                                        <c:if test="${video.isCompleted}">
                                            <a href="<c:url value='/student/course/enroll/watch?course_id=${course.id}&lesson_id=${lesson.id}&video_id=${video.id}'/>" target="_blank" class="btn-watch completed">
                                                <i class="bi bi-check-circle"></i> Watched
                                            </a>
                                        </c:if>
                                        <c:if test="${not video.isCompleted}">
                                            <c:if test="${video.progress == 0}">
                                                <a href="<c:url value='/student/course/enroll/watch?course_id=${course.id}&lesson_id=${lesson.id}&video_id=${video.id}'/>" target="_blank" class="btn-watch">
                                                    <i class="bi bi-play-fill"></i> Watch
                                                </a>
                                            </c:if>
                                            <c:if test="${video.progress > 0}">
                                                <a href="<c:url value='/student/course/enroll/watch?course_id=${course.id}&lesson_id=${lesson.id}&video_id=${video.id}'/>" target="_blank" class="btn-watch continue">
                                                    <i class="bi bi-play-fill"></i> Continue
                                                </a>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <p class="no-videos">No videos available for this lesson.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </c:forEach>
</div>

<%@ include file="/layouts/student/footer.jsp" %>
