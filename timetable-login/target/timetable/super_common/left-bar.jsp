<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<!-- Left Sidebar -->
	<aside id="leftsidebar" class="sidebar" style="background:#5cdb94;color:white"  >
		<ul class="nav nav-tabs">
			
			
		</ul>
		<div class="tab-content">
			<div class="tab-pane stretchRight active" id="dashboard"      >
				<div class="menu">
					<ul class="list">
						<li>
							<div class="user-info">
							<h3> Super Admin Panel</h3>
								<div class="image">
									<a href="profile.html"><img
										src="assets/images/profile_av.jpg" alt="User"></a>
								</div>
								<div class="detail"> 
									
									<h4> ${pageContext.request.userPrincipal.name}</h4>
									<small>Login now</small>
									
								</div>
								
								
							</div>
						</li>
					
						

					</ul>
				</div>
			</div>
		</div>
	</aside>


</body>
</html>