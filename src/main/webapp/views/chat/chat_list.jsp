<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
	crossorigin="anonymous"></script>
</head>
<body>
	<section>
  <div class="container py-5">

    <div class="row">
      <div class="col">
        <div>
        </div>
        <div class="card">
          <div class="card-body">
            <ul class="list-unstyled mb-0">
              <c:forEach items="${conversations}" var="conversation">
                <li class="p-2 border-bottom bg-body-tertiary">
                <a href="/chat?conversation_id=${conversation.id}" class="d-flex justify-content-between">
                  <div class="d-flex flex-row">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-8.webp" alt="avatar"
                      class="rounded-circle d-flex align-self-center me-3 shadow-1-strong" width="60">
                    <div class="pt-1">
                      <p class="fw-bold mb-0">${conversation.receiver.firstName} ${conversation.receiver.lastName}</p>
                      <p class="small text-muted">${conversation.lastMessage.message}</p>
                    </div>
                  </div>
                  <div class="pt-1">
                    <p class="small text-muted mb-1">Just now</p>
                    <span class="badge bg-danger float-end">${conversation.messageCount}</span>
                  </div>
                </a>
              </li>
              </c:forEach>
            </ul>

          </div>
        </div>

      </div>
    </div>

  </div>
</section>

</body>
</html>