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

  <div class="list-group">
  <c:forEach items="${users}" var="user">
    <a href="/chat/create_new_conversation?receiver_id=${user.id}" class="list-group-item list-group-item-action">
      <div class="d-flex flex-row">
        <img src="" alt="avatar" class="rounded-circle d-flex align-self-center me-3 shadow-1-strong" width="60">
        <div class="pt-1">
          <p class="fw-bold mb-0">${user.firstName} ${user.lastName}</p>
          <p class="small text-muted">Last message preview...</p>
        </div>
      </div>
    </a>
  </c:forEach>
</div>

  </div>
</section>

</body>
</html>