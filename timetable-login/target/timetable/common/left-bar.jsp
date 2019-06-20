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
	<aside id="leftsidebar" class="sidebar">
		<ul class="nav nav-tabs">
			
			
		</ul>
		<div class="tab-content">
			<div class="tab-pane stretchRight active" id="dashboard">
				<div class="menu">
					<ul class="list">
						<li>
							<div class="user-info">
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
						<li class="header">MAIN</li>
						<li class="active open"><a href="index.html"><i class="zmdi zmdi-home"></i><span>Dashboard</span></a></li>
							<li><a href="teacher" ><i
								class="zmdi zmdi-accounts-alt"></i><span>Teachers</span> </a>
						</li>
						<li><a href="subject" ><i
								class="zmdi zmdi-accounts-outline"></i><span>Subjects</span> </a>
							</li>
					
						
						
	
						<li class="header">Others</li>
						
						<li><a href="department" ><i
								class="zmdi zmdi-city-alt"></i><span>Departments</span> </a>
							</li>
							
						
						
						<li ><a href="classroom"><i
								class="zmdi zmdi-device-hub"></i><span>Class</span> </a></li>
						
						<li><a href="semester"><i class="zmdi zmdi-pin"></i><span>Semester
									</span></a></li>
						
						<li><a href="day"><i class="zmdi zmdi-pin"></i><span>Day
									</span></a></li>			
					
						
						
						
						
						
						
						
						
					</ul>
				</div>
			</div>
			<div class="tab-pane stretchLeft" id="user">
				<div class="menu">
					<ul class="list">
						<li>
							<div class="user-info m-b-20 p-b-15">
								<div class="image">
									<a href="profile.html"><img
										src="assets/images/profile_av.jpg" alt="User"></a>
								</div>
								<div class="detail">
									<h4>Pro. Charlotte</h4>
									<small>Design Faculty</small>
								</div>
								<div class="row">
									<div class="col-12">
										<a title="facebook" href="javascript:void(0);"><i
											class="zmdi zmdi-facebook"></i></a> <a title="twitter"
											href="javascript:void(0);"><i class="zmdi zmdi-twitter"></i></a>
										<a title="instagram" href="javascript:void(0);"><i
											class="zmdi zmdi-instagram"></i></a>
									</div>
									<div class="col-4 p-r-0">
										<h5 class="m-b-5">13</h5>
										<small>Exp</small>
									</div>
									<div class="col-4">
										<h5 class="m-b-5">33</h5>
										<small>Awards</small>
									</div>
									<div class="col-4 p-l-0">
										<h5 class="m-b-5">237</h5>
										<small>Class</small>
									</div>
								</div>
							</div>
						</li>
						<li><small class="text-muted">Location: </small>
							<p>795 Folsom Ave, Suite 600 San Francisco, CADGE 94107</p>
							<hr> <small class="text-muted">Email address: </small>
							<p>Charlotte@example.com</p>
							<hr> <small class="text-muted">Phone: </small>
							<p>+ 202-555-0191</p>
							<hr>
							<ul class="list-unstyled">
								<li>
									<div>Photoshop</div>
									<div class="progress m-b-20">
										<div class="progress-bar l-blue " role="progressbar"
											aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"
											style="width: 89%">
											<span class="sr-only">89% Complete</span>
										</div>
									</div>
								</li>
								<li>
									<div>Illustrator</div>
									<div class="progress m-b-20">
										<div class="progress-bar l-amber" role="progressbar"
											aria-valuenow="56" aria-valuemin="0" aria-valuemax="100"
											style="width: 56%">
											<span class="sr-only">56% Complete</span>
										</div>
									</div>
								</li>
								<li>
									<div>Art & Design</div>
									<div class="progress m-b-20">
										<div class="progress-bar l-green" role="progressbar"
											aria-valuenow="78" aria-valuemin="0" aria-valuemax="100"
											style="width: 78%">
											<span class="sr-only">78% Complete</span>
										</div>
									</div>
								</li>
								<li>
									<div>HTML</div>
									<div class="progress m-b-20">
										<div class="progress-bar l-blush" role="progressbar"
											aria-valuenow="43" aria-valuemin="0" aria-valuemax="100"
											style="width: 56%">
											<span class="sr-only">56% Complete</span>
										</div>
									</div>
								</li>
								<li>
									<div>CSS</div>
									<div class="progress m-b-20">
										<div class="progress-bar l-parpl" role="progressbar"
											aria-valuenow="43" aria-valuemin="0" aria-valuemax="100"
											style="width: 50%">
											<span class="sr-only">50% Complete</span>
										</div>
									</div>
								</li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</aside>


</body>
</html>