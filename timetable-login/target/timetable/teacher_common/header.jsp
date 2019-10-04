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
	<nav class="navbar p-l-5 p-r-5" style="background: #60bafd">
		<ul class="nav navbar-nav navbar-left">
			<li>
				<div class="navbar-header">
					<a href="javascript:void(0);" class="bars"></a> <a
						class="navbar-brand" href="/"><img
						src="assets/images/logo.svg" width="30" alt="Oreo"><span
						class="m-l-10">MUET Time Table Automation System</span></a>
				</div>
			</li>
			<li><a href="javascript:void(0);" class="ls-toggle-btn"
				data-close="true"><i class="zmdi zmdi-swap"></i></a></li>
			
			
			
			
				
				
				
			<li class="dropdown"><a href="javascript:void(0);"
				class="dropdown-toggle" data-toggle="dropdown" role="button"><i
					class="zmdi zmdi-notifications"></i>Notifications 
					<div class="notify">
						<span class="heartbit"></span> <span class="point"></span>
					</div> </a>
					
					
				<ul class="dropdown-menu pullDown">
					<li class="header">By Department Admin</li>
					<li class="body">
						<ul class="menu tasks list-unstyled">
						
						
						<c:forEach items="${requestSlots}" var="rs"> 
  								<li><a href="javascript:void(0);">

									
										
										
									
										<ul class="list-unstyled team-info">
											<li class="m-r-15"><small class="text-muted">${rs.sender.username}</small></li>
											<li><img src="assets/images/xs/avatar1.jpg" alt="Avatar">
											</li>
											<br>
											<li class="m-r-15"><small class="text-muted"><h5>For:</h5></li>
											<li class="m-r-15"><small class="text-muted"><h6>${rs.assignSubject.batch.name}---${rs.assignSubject.section.name}---  ${rs.assignSubject.subject.code}</h6></small></li>
											
											
										</ul>
										<a class="btn btn-warning"  href="slots?requestslots_id=${rs.id}"  >Request for Slots</a>
									
									</a></li>
							</c:forEach>
						
						
						
						
						
						
							
							
							<c:forEach items="${notificationDetails}" var="nd"> 
  								<li><a href="javascript:void(0);">

									<div class="progress-container progress-primary">
										
										
										<div class="progress">
											<div class="progress-bar" role="progressbar"
												aria-valuenow="86" aria-valuemin="0" aria-valuemax="100"
												style="width: 100%;">
										
											</div>
										</div>
										
										<ul class="list-unstyled team-info">
											<li class="m-r-15"><small class="text-muted">${nd.sender.username}</small></li>
											<li><img src="assets/images/xs/avatar1.jpg" alt="Avatar">
											</li>
											
										</ul>
										<small class="text-muted">${nd.description}</small>
										<span>OK</span>
									</div>
									</a></li>
							</c:forEach>
							
						
						</ul>
					</li>
					<li class="footer"><a href="javascript:void(0);">View All</a></li>
				</ul></li>
			
				
			
			
			
			<li class="float-right">
			
<c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

      
    			
			
				 <a onclick="document.forms['logoutForm'].submit()" class="mega-menu"
				data-close="true"><i class="zmdi zmdi-power"></i> Logout
				</a>
				
			</c:if>	 
				
				<a href="javascript:void(0);" class="js-right-sidebar"
				data-close="true"><i class="zmdi zmdi-settings zmdi-hc-spin"></i></a>
			</li>
		</ul>
	</nav>
</body>
</html>