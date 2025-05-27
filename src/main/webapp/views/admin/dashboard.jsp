<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/admin/header.jsp" %>
<%@ include file="/layouts/admin/nav.jsp" %>
	<div class="container">
		<h1>Admin Dashboard</h1>

		<ul>
			<li><a href="<c:url value='/logout'/>" >Logout</a></li>
			<li><a href="<c:url value='/admin/course/list'/>">View Course List</a></li>
			<li><a href="<c:url value='/chat/list'/>">Chat</a></li>
		</ul>
		

        
	</div>
<%@ include file="/layouts/admin/footer.jsp" %>