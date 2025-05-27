<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Course Review - ${course.title}</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
            <style>
                body {
                    background-color: #f9f9f9;
                }

                .lesson-box {
                    padding: 1rem;
                    background: #fff;
                    border: 1px solid #ddd;
                    border-radius: 0.5rem;
                    margin-bottom: 1.5rem;
                }

                .video-list {
                    list-style: none;
                    padding-left: 0;
                    margin: 0 -0.5rem;
                }

                .video-card {
                    border: 1px solid #ddd;
                    border-radius: 8px;
                    padding: 0.75rem;
                    margin: 0.5rem;
                    background-color: #fff;
                    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.03);
                    align-items: center;
                }

                .video-card img {
                    flex-shrink: 0;
                }

                .review-comment {
                    margin-top: 1rem;
                }
            </style>
        </head>

        <body>
            <div class="container py-5">
                <div class="card shadow-sm mb-4">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">📘 Reviewing Course: ${course.title}</h4>
                    </div>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-md-8">
                                <p><strong>Description:</strong> ${course.description}</p>
                                <p><strong>Category:</strong> ${course.category}</p>
                                <p><strong>Status:</strong>
                                    <c:choose>
                                        <c:when test="${course.courseStatus == 'published'}">
                                            <span class="badge bg-success">Published</span>
                                        </c:when>
                                        <c:when test="${course.courseStatus == 'draft'}">
                                            <span class="badge bg-warning text-dark">Draft</span>
                                        </c:when>
                                        <c:when test="${course.courseStatus == 'under_review'}">
                                            <span class="badge bg-secondary">Under Review</span>
                                        </c:when>
                                    </c:choose>
                                </p>
                                <p><strong>Total Lessons:</strong> ${course.lessons.size()}</p>
                            </div>
                            <div class="col-md-4 text-center">
                                <img src="<c:url value='/FileController${course.banner_image}'/>" alt="Banner"
                                    class="img-fluid rounded" style="max-width: 150px;">
                            </div>
                        </div>

                        <c:forEach var="lesson" items="${course.lessons}">
                            <div class="lesson-box">
                                <h5>📗 ${lesson.title}</h5>
                                <p>${lesson.description}</p>

                                <c:choose>
                                    <c:when test="${not empty lesson.lessonVideos}">
                                        <ul class="video-list row">
                                            <c:forEach var="video" items="${lesson.lessonVideos}">
                                                <div class="col-md-6 mb-3">
                                                    <div class="video-card d-flex"> <img
                                                            src="<c:url value='/FileController${video.thumbnail}'/>"
                                                            alt="Thumbnail" class="me-3 rounded"
                                                            style="width: 120px; height: 70px; object-fit: cover;">

                                                        <div class="flex-grow-1">
                                                            <div
                                                                class="d-flex justify-content-between align-items-start">
                                                                <div>
                                                                    <strong>${video.title}</strong><br>
                                                                </div>
                                                                <button class="btn btn-sm btn-outline-primary"
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#videoModal-${video.id}">
                                                                    Preview
                                                                </button>
                                                            </div>
                                                        </div>

                                                        <!-- Modal -->
                                                        <div class="modal fade" id="videoModal-${video.id}"
                                                            tabindex="-1" aria-labelledby="videoModalLabel-${video.id}"
                                                            aria-hidden="true">
                                                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title"
                                                                            id="videoModalLabel-${video.id}">🎬
                                                                            ${video.title}</h5>
                                                                        <button type="button" class="btn-close"
                                                                            data-bs-dismiss="modal"
                                                                            aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <video controls class="w-100 rounded">
                                                                            <source
                                                                                src="<c:url value='/FileController${video.videoUrl}'/>"
                                                                                type="video/mp4">
                                                                            Your browser does not support the video tag.
                                                                        </video>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </ul>

                                    </c:when>
                                    <c:otherwise>
                                        <em>No videos in this lesson.</em>
                                    </c:otherwise>
                                </c:choose>

                                <!-- Reviewer Comment Input -->
                                <div class="review-comment">
                                    <label for="comment-${lesson.id}" class="form-label">📝 Reviewer Comments for this
                                        lesson:</label>
                                    <textarea class="form-control" id="comment-${lesson.id}" name="comments" rows="3"
                                        placeholder="Write feedback for this lesson (clarity, completeness, errors, etc.)..."></textarea>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- Final Review Actions -->
                        <hr class="my-4">
                        <div class="text-end">
                            <form action="<c:url value='/reviewer/course/detail'/>" method="post" id="reviewForm">
                                <input type="hidden" name="courseId" value="${course.id}">
                                <input type="hidden" name="action" id="reviewAction">

                                <div id="rejectReasonBox" class="mb-3 d-none">
                                    <label for="rejectReason" class="form-label text-danger">Reason for
                                        Rejection:</label>
                                    <textarea class="form-control" name="rejectReason" id="rejectReason" rows="3"
                                        placeholder="Explain why this course is rejected..."></textarea>
                                </div>

                                <button type="button" class="btn btn-success me-2" onclick="submitReview('approve')">
                                    ✅ Approve to Publish
                                </button>

                                <button type="button" class="btn btn-danger" onclick="showRejectBox()">
                                    ❌ Reject
                                </button>

                                <button type="button" id="rejectSubmitBtn" class="btn btn-danger d-none"
                                    onclick="submitReview('reject')">
                                    Confirm Reject
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            function submitReview(action) {
                document.getElementById("reviewAction").value = action;
                document.getElementById("reviewForm").submit();
            }

            function showRejectBox() {
                document.getElementById("rejectReasonBox").classList.remove("d-none");
                document.getElementById("rejectSubmitBtn").classList.remove("d-none");
            }
        </script>

        </html>