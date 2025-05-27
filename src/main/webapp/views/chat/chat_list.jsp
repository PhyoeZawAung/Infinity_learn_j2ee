<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/teacher/header.jsp" %>
<%@ include file="/layouts/teacher/nav.jsp" %>
<style>
  .conversation-item {
    padding: 12px;
    border-bottom: 1px solid #e3e3e3;
    transition: background-color 0.2s;
  }
  .conversation-item:hover {
    background-color: #f8f9fa;
  }
  .avatar {
    width: 56px;
    height: 56px;
    object-fit: cover;
  }
  .nav-tabs .nav-link {
    font-weight: 600;
  }
</style>


<section>
  <div class="container py-5">

    <div class="mb-4 d-flex justify-content-between align-items-center">
      <h3>Conversations</h3>
      <a class="btn btn-primary" href="<c:url value='/chat/new'/>">New Conversation</a>
    </div>

    <ul class="nav nav-tabs" id="chatTabs" role="tablist">
      <li class="nav-item" role="presentation">
        <button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-bs-target="#all" type="button" role="tab"
          aria-controls="all" aria-selected="true">All</button>
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="admin-tab" data-bs-toggle="tab" data-bs-target="#admin" type="button" role="tab"
          aria-controls="admin" aria-selected="false">Admin</button>
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="teacher-tab" data-bs-toggle="tab" data-bs-target="#teacher" type="button" role="tab"
          aria-controls="teacher" aria-selected="false">Teacher</button>
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="reviewer-tab" data-bs-toggle="tab" data-bs-target="#reviewer" type="button" role="tab"
          aria-controls="reviewer" aria-selected="false">Reviewer</button>
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="student-tab" data-bs-toggle="tab" data-bs-target="#student" type="button" role="tab"
          aria-controls="student" aria-selected="false">Student</button>
      </li>
    </ul>

    <div class="tab-content mt-3" id="chatTabsContent">
      
      <!-- ALL Conversations -->
      <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
        <c:set var="hasAllChats" value="false" />
        <c:forEach items="${conversations}" var="conversation">
          <c:set var="hasAllChats" value="true" />
          <a href="/chat?conversation_id=${conversation.id}" class="text-decoration-none text-dark">
            <div class="d-flex align-items-center conversation-item">
              <img src="${conversation.receiver.profile_image != null ? conversation.receiver.profile_image : 'https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-8.webp'}"
                class="rounded-circle avatar me-3" alt="avatar">
              <div class="flex-grow-1">
                <h6 class="fw-semibold mb-1">${conversation.receiver.firstName} ${conversation.receiver.lastName}</h6>
                <p class="mb-0 small text-muted">${conversation.lastMessage.message}</p>
              </div>
              <div class="text-end ms-2">
                <p class="small text-muted mb-1">Just now</p>
                <c:if test="${conversation.messageCount > 0}">
                  <span class="badge bg-danger">${conversation.messageCount}</span>
                </c:if>
              </div>
            </div>
          </a>
        </c:forEach>
        <c:if test="${not hasAllChats}">
          <div class="text-center py-5 text-muted">
            <i class="bi bi-chat-dots fs-1 d-block mb-3"></i>
            <p class="fw-semibold">No conversations found.</p>
          </div>
        </c:if>
      </div>

      <!-- ADMIN Conversations -->
      <div class="tab-pane fade" id="admin" role="tabpanel" aria-labelledby="admin-tab">
        <c:set var="hasAdminChats" value="false" />
        <c:forEach items="${conversations}" var="conversation">
          <c:if test="${conversation.receiver.role == 'admin'}">
            <c:set var="hasAdminChats" value="true" />
            <a href="/chat?conversation_id=${conversation.id}" class="text-decoration-none text-dark">
              <div class="d-flex align-items-center conversation-item">
                <img src="${conversation.receiver.profile_image != null ? conversation.receiver.profile_image : 'https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-8.webp'}"
                  class="rounded-circle avatar me-3" alt="avatar">
                <div class="flex-grow-1">
                  <h6 class="fw-semibold mb-1">${conversation.receiver.firstName} ${conversation.receiver.lastName}</h6>
                  <p class="mb-0 small text-muted">${conversation.lastMessage.message}</p>
                </div>
                <div class="text-end ms-2">
                  <p class="small text-muted mb-1">Just now</p>
                  <c:if test="${conversation.messageCount > 0}">
                    <span class="badge bg-danger">${conversation.messageCount}</span>
                  </c:if>
                </div>
              </div>
            </a>
          </c:if>
        </c:forEach>
        <c:if test="${not hasAdminChats}">
          <div class="text-center py-5 text-muted">
            <i class="bi bi-chat-dots fs-1 d-block mb-3"></i>
            <p class="fw-semibold">No admin conversations found.</p>
          </div>
        </c:if>
      </div>

      <!-- TEACHER Conversations -->
      <div class="tab-pane fade" id="teacher" role="tabpanel" aria-labelledby="teacher-tab">
        <c:set var="hasTeacherChats" value="false" />
        <c:forEach items="${conversations}" var="conversation">
          <c:if test="${conversation.receiver.role == 'teacher'}">
            <c:set var="hasTeacherChats" value="true" />
            <a href="/chat?conversation_id=${conversation.id}" class="text-decoration-none text-dark">
              <div class="d-flex align-items-center conversation-item">
                <img src="${conversation.receiver.profile_image != null ? conversation.receiver.profile_image : 'https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-8.webp'}"
                  class="rounded-circle avatar me-3" alt="avatar">
                <div class="flex-grow-1">
                  <h6 class="fw-semibold mb-1">${conversation.receiver.firstName} ${conversation.receiver.lastName}</h6>
                  <p class="mb-0 small text-muted">${conversation.lastMessage.message}</p>
                </div>
                <div class="text-end ms-2">
                  <p class="small text-muted mb-1">Just now</p>
                  <c:if test="${conversation.messageCount > 0}">
                    <span class="badge bg-danger">${conversation.messageCount}</span>
                  </c:if>
                </div>
              </div>
            </a>
          </c:if>
        </c:forEach>
        <c:if test="${not hasTeacherChats}">
          <div class="text-center py-5 text-muted">
            <i class="bi bi-chat-dots fs-1 d-block mb-3"></i>
            <p class="fw-semibold">No teacher conversations found.</p>
          </div>
        </c:if>
      </div>

      <!-- REVIEWER Conversations -->
      <div class="tab-pane fade" id="reviewer" role="tabpanel" aria-labelledby="reviewer-tab">
        <c:set var="hasReviewerChats" value="false" />
        <c:forEach items="${conversations}" var="conversation">
          <c:if test="${conversation.receiver.role == 'reviewer'}">
            <c:set var="hasReviewerChats" value="true" />
            <a href="/chat?conversation_id=${conversation.id}" class="text-decoration-none text-dark">
              <div class="d-flex align-items-center conversation-item">
                <img src="${conversation.receiver.profile_image != null ? conversation.receiver.profile_image : 'https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-8.webp'}"
                  class="rounded-circle avatar me-3" alt="avatar">
                <div class="flex-grow-1">
                  <h6 class="fw-semibold mb-1">${conversation.receiver.firstName} ${conversation.receiver.lastName}</h6>
                  <p class="mb-0 small text-muted">${conversation.lastMessage.message}</p>
                </div>
                <div class="text-end ms-2">
                  <p class="small text-muted mb-1">Just now</p>
                  <c:if test="${conversation.messageCount > 0}">
                    <span class="badge bg-danger">${conversation.messageCount}</span>
                  </c:if>
                </div>
              </div>
            </a>
          </c:if>
        </c:forEach>
        <c:if test="${not hasReviewerChats}">
          <div class="text-center py-5 text-muted">
            <i class="bi bi-chat-dots fs-1 d-block mb-3"></i>
            <p class="fw-semibold">No reviewer conversations found.</p>
          </div>
        </c:if>
      </div>

      <!-- STUDENT Conversations -->
      <div class="tab-pane fade" id="student" role="tabpanel" aria-labelledby="student-tab">
        <c:set var="hasStudentChats" value="false" />
        <c:forEach items="${conversations}" var="conversation">
          <c:if test="${conversation.receiver.role == 'student'}">
            <c:set var="hasStudentChats" value="true" />
            <a href="/chat?conversation_id=${conversation.id}" class="text-decoration-none text-dark">
              <div class="d-flex align-items-center conversation-item">
                <img src="${conversation.receiver.profile_image != null ? conversation.receiver.profile_image : 'https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-8.webp'}"
                  class="rounded-circle avatar me-3" alt="avatar">
                <div class="flex-grow-1">
                  <h6 class="fw-semibold mb-1">${conversation.receiver.firstName} ${conversation.receiver.lastName}</h6>
                  <p class="mb-0 small text-muted">${conversation.lastMessage.message}</p>
                </div>
                <div class="text-end ms-2">
                  <p class="small text-muted mb-1">Just now</p>
                  <c:if test="${conversation.messageCount > 0}">
                    <span class="badge bg-danger">${conversation.messageCount}</span>
                  </c:if>
                </div>
              </div>
            </a>
          </c:if>
        </c:forEach>
        <c:if test="${not hasStudentChats}">
          <div class="text-center py-5 text-muted">
            <i class="bi bi-chat-dots fs-1 d-block mb-3"></i>
            <p class="fw-semibold">No student conversations found.</p>
          </div>
        </c:if>
      </div>

    </div>

  </div>
</section>

<%@ include file="/layouts/teacher/footer.jsp" %>
