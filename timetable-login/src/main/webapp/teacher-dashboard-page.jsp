<!doctype html>
<html xmlns:th="http://www.thymeleaf.org">
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<meta name="description"
	content="Responsive Bootstrap 4 and web Application ui kit.">

<title>:: MUET University Admin ::</title>
<!-- Favicon-->
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap.min.css">
<!-- JQuery DataTable Css -->
<link rel="stylesheet"
	href="assets/plugins/jquery-datatable/dataTables.bootstrap4.min.css">
<!-- Custom Css -->
<link rel="stylesheet" href="assets/css/main.css">
<!-- Bootstrap Select Css -->
<link href="assets/plugins/bootstrap-select/css/bootstrap-select.css"
	rel="stylesheet" />

<link rel="stylesheet" href="assets/css/color_skins.css">
<script src="assets/js/jquery.min.js"></script>
</head>
<body class="theme-blush">
	<!-- Page Loader -->
	<div class="page-loader-wrapper">
		<div class="loader">
			<div class="m-t-30">
				<img class="zmdi-hc-spin" src="assets/images/logo.svg" width="48"
					height="48" alt="Oreo">
			</div>
			<p>Please wait...</p>
		</div>
	</div>
	<!-- Overlay For Sidebars -->
	<div class="overlay"></div>
	<jsp:include page="common/header.jsp"></jsp:include>




	<jsp:include page="common/left-bar.jsp"></jsp:include>

	<!-- Right Sidebar -->

	<jsp:include page="common/right-bar.jsp"></jsp:include>
	<jsp:include page="common/chat-box.jsp"></jsp:include>
	



	<!-- Main Content -->

	<section class="content contact">
		<div class="block-header">
			<div class="row">
				<div class="col-lg-7 col-md-6 col-sm-12">
					<h2>
						Dashboard <small>Welcome to MUET Time Table</small>
					</h2>
				</div>
				<div class="col-lg-5 col-md-6 col-sm-12">
					<ul class="breadcrumb float-md-right">
						<li class="breadcrumb-item"><a href="index.html"><i
								class="zmdi zmdi-home"></i> MUET</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0);">App</a></li>
						<li class="breadcrumb-item active">Dashboard</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="container-fluid">

			
			
			
			        <div class="col-lg-12 col-md-12">
                <div class="row clearfix">
                    
               
                <div class="card student-list">
                    <div class="header">
                        <h2><strong>Subjects</strong><small>You are teaching this semester...</small></h2>
                        <ul class="header-dropdown">
                            <li class="remove">
                                <a role="button" class="boxs-close"><i class="zmdi zmdi-close"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="table-responsive">
                            <table class="table table-hover m-b-0">
                                <thead>
                                    <tr>
                                        <th>Subject Name</th>
                                        <th>Subject Type</th>
                                        <th>Batch</th>
                                        <th>Batch Section</th>
                                        <th>Semester</th>
                                        <th>Department</th>
                                    </tr>
                                </thead>
                                <tbody>
                                      					<c:forEach items="${assign_subjects}" var="assignSubj">
                                  
                                  
                                    <tr>
                                        <td>${assignSubj.subject.name}</td>
                                        <td>${assignSubj.subject.type}</td>
                                        <td>${assignSubj.batch.name}</td>
                                        <td>${assignSubj.section.name}</td>		
                                        <td>${assignSubj.semester.name}</td>     
                                        <td>${assignSubj.subject.dept.name}</td>
                                    </tr>
                                    
                                    						</c:forEach>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                 
                
                 <div class="card student-list">
                    <div class="header">
                        <h2><strong>Time Table</strong></h2>
                        <ul class="header-dropdown">
                            <li class="remove">
                                <a role="button" class="boxs-close"><i class="zmdi zmdi-close"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="table-responsive">
                            <table class="table table-hover m-b-0">
                                <thead>
                                    <tr>
                                        <th>Slots/Days</th>
                                        <th>Monday</th>
                                        <th>Tuesday</th>
                                        <th>Wednesday</th>
                                        <th>Thursday</th>
                                        <th>Friday</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>First</td>
                                        <td>SPM</td>
                                        <td>SP</td>
                                        <td style="background-color: blue;  color: white">SPM lab</td>
                                        <td style="background-color: blue; color: white">SPM Lab</td>
                                        <td style="background-color: blue; color: white">SPM Lab</td>
                                    </tr>
                                      <tr>
                                        <td>Second</td>
                                        <td>SPM</td>
                                        <td>SP</td>
                                        <td>SPM lab</td>
                                        <td>SPM Lab</td>                                       
                                        <td>SPM Lab</td>
                                    </tr>
                                      <tr>
                                        <td>Third</td>
                                        <td>SPM</td>
                                        <td>SP</td>
                                        <td>SPM lab</td>
                                        <td>SPM Lab</td>                                       
                                        <td>SPM Lab</td>
                                    </tr>
                                      <tr>
                                        <td>Fourth</td>
                                        <td style="background-color: orange;  color: white">SPM</td>
                                        <td>SP</td>
                                        <td>SPM lab</td>
                                        <td>SPM Lab</td>                                       
                                        <td>SPM Lab</td>
                                    </tr>
                                      <tr>
                                        <td>Fifth</td>
                                        <td>SPM</td>
                                        <td>SP</td>
                                        <td>SPM lab</td>
                                        <td>SPM Lab</td>                                       
                                        <td>SPM Lab</td>
                                    </tr>
                                      <tr>
                                        <td>Sixth</td>
                                        <td >SPM</td>
                                        <td style="background-color: cyan;  color: black">SP</td>
                                        <td>SPM lab</td>
                                        <td>SPM Lab</td>                                       
                                        <td>SPM Lab</td>
                                    </tr>
                                      <tr>
                                        <td>Seventh</td>
                                        <td>SPM</td>
                                        <td>SP</td>
                                        <td style="background-color: #f5f2d0;  color: black">SPM lab</td>
                                        <td style="background-color: #f5f2d0;  color: black">SPM Lab</td>                     
                                        <td style="background-color: #f5f2d0;  color: black">SPM Lab</td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
			
			
			
		</div>
	</section>


	






	<!-- Jquery Core Js -->
	<script src="assets/bundles/libscripts.bundle.js"></script>
	<!-- Lib Scripts Plugin Js -->
	<script src="assets/bundles/vendorscripts.bundle.js"></script>
	<!-- Lib Scripts Plugin Js -->

	<!-- Jquery DataTable Plugin Js -->
	<script src="assets/bundles/datatablescripts.bundle.js"></script>

	<script src="assets/bundles/mainscripts.bundle.js"></script>
	<script src="assets/js/pages/tables/jquery-datatable.js"></script>
</body>

</html>