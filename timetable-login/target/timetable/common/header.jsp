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
	<nav class="navbar p-l-5 p-r-5">
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
					class="zmdi zmdi-notifications"></i>   Notifications 
					<div class="notify">
						<span class="heartbit"></span> <span class="point"></span>
					</div> </a>
				<ul class="dropdown-menu pullDown">
					<li class="header">Department</li>
					<li class="body">
						<ul class="menu tasks list-unstyled">
							<li><a href="javascript:void(0);">
									<div class="progress-container progress-primary">
										<span class="progress-badge">Computer</span>
										<div class="progress">
											<div class="progress-bar" role="progressbar"
												aria-valuenow="86" aria-valuemin="0" aria-valuemax="100"
												style="width: 86%;">
												<span class="progress-value">86%</span>
											</div>
										</div>
										<ul class="list-unstyled team-info">
											<li class="m-r-15"><small class="text-muted">Team</small></li>
											<li><img src="assets/images/xs/avatar2.jpg" alt="Avatar">
											</li>
											<li><img src="assets/images/xs/avatar3.jpg" alt="Avatar">
											</li>
											<li><img src="assets/images/xs/avatar4.jpg" alt="Avatar">
											</li>
										</ul>
									</div>
							</a></li>
							<li><a href="javascript:void(0);">
									<div class="progress-container progress-info">
										<span class="progress-badge">Medical</span>
										<div class="progress">
											<div class="progress-bar" role="progressbar"
												aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"
												style="width: 45%;">
												<span class="progress-value">45%</span>
											</div>
										</div>
										<ul class="list-unstyled team-info">
											<li class="m-r-15"><small class="text-muted">Team</small></li>
											<li><img src="assets/images/xs/avatar10.jpg"
												alt="Avatar"></li>
											<li><img src="assets/images/xs/avatar9.jpg" alt="Avatar">
											</li>
											<li><img src="assets/images/xs/avatar8.jpg" alt="Avatar">
											</li>
											<li><img src="assets/images/xs/avatar7.jpg" alt="Avatar">
											</li>
											<li><img src="assets/images/xs/avatar6.jpg" alt="Avatar">
											</li>
										</ul>
									</div>
							</a></li>
							<li><a href="javascript:void(0);">
									<div class="progress-container progress-warning">
										<span class="progress-badge">Art & Design</span>
										<div class="progress">
											<div class="progress-bar" role="progressbar"
												aria-valuenow="29" aria-valuemin="0" aria-valuemax="100"
												style="width: 29%;">
												<span class="progress-value">29%</span>
											</div>
										</div>
										<ul class="list-unstyled team-info">
											<li class="m-r-15"><small class="text-muted">Team</small></li>
											<li><img src="assets/images/xs/avatar5.jpg" alt="Avatar">
											</li>
											<li><img src="assets/images/xs/avatar2.jpg" alt="Avatar">
											</li>
											<li><img src="assets/images/xs/avatar7.jpg" alt="Avatar">
											</li>
										</ul>
									</div>
							</a></li>
						</ul>
					</li>
					<li class="footer"><a href="javascript:void(0);">View All</a></li>
				</ul></li>
			<li class="dropdown"><a href="javascript:void(0);"
				class="dropdown-toggle" data-toggle="dropdown" role="button"><i
					class="zmdi zmdi-settings"></i>  Settings
					<div class="notify">
						<span class="heartbit"></span><span class="point"></span>
					</div> </a>
				<ul class="dropdown-menu pullDown">
					<li class="body">
						
					</li>
					<li class="footer"><a href="settings">Time Table Settings</a>
					</li>
					<li class="footer"><a href="">System Setup</a>
					</li>
					</li>
					
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