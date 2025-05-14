<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register New User</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
	crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
	<style>
	body {
  background: #007bff;
  background: linear-gradient(to right, #0062E6, #33AEFF);
}

.btn-login {
  font-size: 0.9rem;
  letter-spacing: 0.05rem;
  padding: 0.75rem 1rem;
}

.btn-google {
  color: white !important;
  background-color: #ea4335;
}

.btn-facebook {
  color: white !important;
  background-color: #3b5998;
}
	</style>
</head>
<body>
    	<div class="container">
		
	<div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card border-0 shadow rounded-3 my-5">
          <div class="card-body p-4 p-sm-5">
            <h5 class="card-title text-center mb-5 fw-light fs-5">Register New User</h5>
			<c:if test="${not empty error}">
			<div class="alert alert-danger" role="alert">
				${error}
			</div>
		</c:if>
            <form method="post" action="/register" >
			<div class="form-floating mb-3">
                <input type="text" name="first_name" class="form-control" id="floatingInput" placeholder="name@example.com">
                <label for="floatingInput">First Name</label>
              </div>
			  <div class="form-floating mb-3">
                <input type="text" name="last_name" class="form-control" id="floatingInput" placeholder="name@example.com">
                <label for="floatingInput">Last Name</label>
              </div>
              <div class="form-floating mb-3">
                <input type="email" name="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                <label for="floatingInput">Email address</label>
              </div>
              <div class="form-floating mb-3">
                <input type="password" name="password" class="form-control" id="floatingPassword">
                <label for="floatingPassword">Password</label>
              </div>
              <div class="d-grid">
                <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Register</button>
              </div>
			  <div class="d-flex justify-content-center mt-4">
			  	<p>Already have an account? <a href="/login"> Login</a></p>
			  </div>
              <%-- <hr class="my-4"> --%>
              <%-- <div class="d-grid mb-2">
                <button class="btn btn-google btn-login text-uppercase fw-bold" type="button">
                  <i class="bi bi-google me-2"></i>Sign in with Google
                </button>
              </div>
              <div class="d-grid">
                <button class="btn btn-facebook btn-login text-uppercase fw-bold" type="button">
                  <i class="bi bi-facebook me-2"></i> Sign in with Facebook
                </button>
              </div> --%>
            </form>
          </div>
        </div>
      </div>
    </div>
	</div>
</body>
</html>
