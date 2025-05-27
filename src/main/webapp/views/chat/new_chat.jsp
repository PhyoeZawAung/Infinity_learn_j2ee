<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Start New Conversation</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    .avatar {
      width: 55px;
      height: 55px;
      object-fit: cover;
      border-radius: 50%;
    }
    .user-list-item {
      transition: background-color 0.2s ease;
      padding: 15px;
      border-radius: 10px;
      margin-bottom: 10px;
      background-color: #f8f9fa;
    }
    .user-list-item:hover {
      background-color: #e3f2fd;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }
  </style>
</head>
<body>

<section class="py-5">
  <div class="container" style="max-width: 800px;">

    <h4 class="mb-4 text-primary fw-bold">Start a New Conversation</h4>

    <!-- Tabs Navigation -->
    <ul class="nav nav-tabs mb-3" id="roleTabs" role="tablist">
      <li class="nav-item" role="presentation">
        <button class="nav-link active" id="admin-tab" data-bs-toggle="tab" data-bs-target="#admin" type="button" role="tab">Admin</button>
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="teacher-tab" data-bs-toggle="tab" data-bs-target="#teacher" type="button" role="tab">Teacher</button>
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="reviewer-tab" data-bs-toggle="tab" data-bs-target="#reviewer" type="button" role="tab">Reviewer</button>
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="student-tab" data-bs-toggle="tab" data-bs-target="#student" type="button" role="tab">Student</button>
      </li>
    </ul>

    <!-- Tab Content -->
    <div class="tab-content" id="roleTabsContent">

      <!-- Admin Tab -->
      <div class="tab-pane fade show active" id="admin" role="tabpanel">
        <c:forEach items="${users}" var="user">
          <c:if test="${user.role == 'admin'}">
            <a href="/chat/create_new_conversation?receiver_id=${user.id}" class="text-decoration-none text-dark">
              <div class="d-flex align-items-center user-list-item">
                <img src="${user.profile_image != null ? user.profile_image : 'https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-8.webp'}" class="avatar me-3" alt="avatar">
                <div>
                  <h6 class="mb-1 fw-semibold">${user.firstName} ${user.lastName}</h6>
                  <p class="mb-0 text-muted small">Admin</p>
                </div>
              </div>
            </a>
          </c:if>
        </c:forEach>
      </div>

      <!-- Teacher Tab -->
      <div class="tab-pane fade" id="teacher" role="tabpanel">
        <c:forEach items="${users}" var="user">
          <c:if test="${user.role == 'teacher'}">
            <a href="/chat/create_new_conversation?receiver_id=${user.id}" class="text-decoration-none text-dark">
              <div class="d-flex align-items-center user-list-item">
                <img src="${user.profile_image != null ? user.profile_image : 'https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-8.webp'}" class="avatar me-3" alt="avatar">
                <div>
                  <h6 class="mb-1 fw-semibold">${user.firstName} ${user.lastName}</h6>
                  <p class="mb-0 text-muted small">Teacher</p>
                </div>
              </div>
            </a>
          </c:if>
        </c:forEach>
      </div>

      <!-- Reviewer Tab -->
      <div class="tab-pane fade" id="reviewer" role="tabpanel">
        <c:forEach items="${users}" var="user">
          <c:if test="${user.role == 'reviewer'}">
            <a href="/chat/create_new_conversation?receiver_id=${user.id}" class="text-decoration-none text-dark">
              <div class="d-flex align-items-center user-list-item">
                <img src="${user.profile_image != null ? user.profile_image : 'https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-8.webp'}" class="avatar me-3" alt="avatar">
                <div>
                  <h6 class="mb-1 fw-semibold">${user.firstName} ${user.lastName}</h6>
                  <p class="mb-0 text-muted small">Reviewer</p>
                </div>
              </div>
            </a>
          </c:if>
        </c:forEach>
      </div>

      <!-- Student Tab -->
      <div class="tab-pane fade" id="student" role="tabpanel">
        <c:forEach items="${users}" var="user">
          <c:if test="${user.role == 'student'}">
            <a href="/chat/create_new_conversation?receiver_id=${user.id}" class="text-decoration-none text-dark">
              <div class="d-flex align-items-center user-list-item">
                <img src="${user.profile_image != null ? user.profile_image : 'https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-8.webp'}" class="avatar me-3" alt="avatar">
                <div>
                  <h6 class="mb-1 fw-semibold">${user.firstName} ${user.lastName}</h6>
                  <p class="mb-0 text-muted small">Student</p>
                </div>
              </div>
            </a>
          </c:if>
        </c:forEach>
      </div>

    </div>

  </div>
</section>

</body>
</html>
