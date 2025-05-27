<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/reviewer/header.jsp" %>
<%@ include file="/layouts/reviewer/nav.jsp" %>
	<div class="container">
		<h1>Reviewer Dashboard</h1>
		<ul>
			<li><a href="<c:url value='/logout'/>" >Logout</a></li>
			<li><a href="<c:url value='/reviewer/course/list'/>">View Course List</a></li>
			<li><a href="<c:url value='/chat/list'/>">Chat</a></li>
		</ul>    
	</div>
<%@ include file="/layouts/reviewer/footer.jsp" %>