<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/student/header.jsp" %>
<%@ include file="/layouts/student/nav.jsp" %>
	<div class="container">
	<h1>Student Dashboard</h1>
	<ul>
		<li><a href="<c:url value='/logout'/>" >Logout</a></li>
		<li><a href="<c:url value='/guest/course/list'/>">View Course List</a></li>
		<li><a href="<c:url value='/student/course/enroll/list'/>">View Enroll Course List</a></li>
		<li><a href="<c:url value='/chat/list'/>">Chat</a></li>
	</ul>
		
		<!-- Add any additional student-specific links or content here -->
	</div>
<%@ include file="/layouts/student/footer.jsp" %>