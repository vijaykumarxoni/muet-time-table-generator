<%@ page import="com.muet.timetable.beans.*"%>
<%@ page import="com.muet.timetable.dao.*"%>
<%@ page import="com.muet.timetable.daoImpl.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js " lang="en">

<!-- Mirrored from thememakker.com/templates/oreo/university/html/contact.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 04 May 2019 10:02:35 GMT -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

<title>:: Muet University Admin ::</title>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<!-- Favicon-->
<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
<!-- Custom Css -->
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/color_skins.css">
      <script src="/assets/js/jquery.min.js"></script>

</head>

<body class="theme-blush menu_img">
<!-- Page Loader -->
<div class="page-loader-wrapper">
    <div class="loader">
        <div class="m-t-30"><img class="zmdi-hc-spin" src="assets/images/logo.svg" width="48" height="48" alt="Oreo"></div>
        <p>Please wait...</p>        
    </div>
</div>
<jsp:include page="common/left-bar.jsp"></jsp:include>

	<!-- Right Sidebar -->

	<jsp:include page="common/right-bar.jsp"></jsp:include>
	<jsp:include page="common/chat-box.jsp"></jsp:include>
<!-- Overlay For Sidebars -->
<div class="overlay"></div>
<!-- Top Bar -->
<nav class="navbar p-l-5 p-r-5">
    <ul class="nav navbar-nav navbar-left">
        <li>
            <div class="navbar-header">
                    <a href="javascript:void(0);" class="bars"></a> <a
                        class="navbar-brand" href="index.html"><img
                        src="assets/images/logo.svg" width="30" alt="Oreo"><span
                        class="m-l-10">MUET</span></a>
                </div>
        </li>
        <li><a href="#" class="ls-toggle-btn" data-close="true"><i class="zmdi zmdi-swap"></i></a></li>
        <li><a href="#" title="Events"><i class="zmdi zmdi-calendar"></i></a></li>
        <li><a href="#" title="Inbox"><i class="zmdi zmdi-email"></i></a></li>
        <li><a href="#" title="Contact List"><i class="zmdi zmdi-account-box-phone"></i></a></li>
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"><i class="zmdi zmdi-notifications"></i>
            <div class="notify"><span class="heartbit"></span><span class="point"></span></div>
            </a>
            <ul class="dropdown-menu pullDown">
                <li class="body">
                    <ul class="menu list-unstyled">
                     <c:forEach var="notification" items="${notification}"> 
                       <li>
                            <a href="javascript:void(0);">
                                <div class="media">
                               
                                    <img class="media-object" src="assets/images/xs/avatar6.jpg" alt="">
                                    <div class="media-body">
                                     
                                        <span class="name"><c:out value="${notification.sender.username}" /><span class="time">${notification.createdAt}</span>
                                        <span class="message"><c:out value="From " />${notification.sender.department.name}</span><br>
                                        <span class="message"><c:out value="${notification.assignSubject.subject.name}" /></span>   
                                         
                                                                             
                                    </div>
                                </div>
                            </a>
                        </li> 
</c:forEach>
                    </ul>
                </li>
               
            </ul>
        </li>
        <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"><i class="zmdi zmdi-flag"></i>
            <div class="notify">
                <span class="heartbit"></span>
                <span class="point"></span>
            </div>
            </a>
           
        </li>
        <li>
            <div class="input-group">                
                <input type="text" class="form-control" placeholder="Search...">
                <span class="input-group-addon">
                    <i class="zmdi zmdi-search"></i>
                </span>
            </div>
        </li>        
        <li class="float-right">
            
            <a href="sign-in.html" class="mega-menu" data-close="true"><i class="zmdi zmdi-power"></i></a>
            <a href="javascript:void(0);" class="js-right-sidebar" data-close="true"><i class="zmdi zmdi-settings zmdi-hc-spin"></i></a>
        </li>
    </ul>
</nav>



<section class="content contact">
    <div class="block-header">
        <div class="row">
            <div class="col-lg-7 col-md-6 col-sm-12">
                <h2>Notifications
                <small>Welcome to MUET</small>
                </h2>
            </div>
            <div class="col-lg-5 col-md-6 col-sm-12">
                <ul class="breadcrumb float-md-right">
                    <li class="breadcrumb-item"><a href="index.html"><i class="zmdi zmdi-home"></i> MUET</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0);">App</a></li>
                    <li class="breadcrumb-item active">TeacherDashboard</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        
        <div class="row clearfix">
            <div class="col-lg-12">
                <div class="card action_bar">
                    <div class="body">
                        <div class="row clearfix">
                            <div class="col-lg-1 col-md-2 col-3">
                                <div class="checkbox inlineblock delete_all">
                                    <input id="deleteall" type="checkbox">
                                    <label for="deleteall">
                                        All
                                    </label>
                                </div>                                
                            </div>
                            <div class="col-lg-5 col-md-5 col-6">
                                <div class="input-group search">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="input-group-addon">
                                        <i class="zmdi zmdi-search"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-5 col-3 text-right">
                                <div class="btn-group d-none d-lg-inline-block d-md-inline-block" role="group">
                                    <div class="btn-group">
                                        <button type="button" class="btn col-black btn-neutral dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="zmdi zmdi-label"></i>
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-right pullDown">
                                            <li>
                                                <a href="javascript:void(0);">Family</a>
                                            </li>
                                            <li>
                                                <a href="javascript:void(0);">Work</a>
                                            </li>
                                            <li>
                                                <a href="javascript:void(0);">Google</a>
                                            </li>
                                            <li role="separator" class="divider"></li>
                                            <li>
                                                <a href="javascript:void(0);">Create a Label</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <button type="button" class="btn col-black btn-neutral d-none d-lg-inline-block d-md-inline-block">
                                    <i class="zmdi zmdi-plus-circle"></i>
                                </button>
                                <button type="button" class="btn col-black btn-neutral d-none d-lg-inline-block d-md-inline-block">
                                    <i class="zmdi zmdi-archive"></i>
                                </button>
                                <button type="button" class="btn col-black btn-neutral">
                                    <i class="zmdi zmdi-delete"></i>
                                </button>
                            </div>
                        </div>
                    </div>                   
                </div>
                <div class="card">
                    <div class="body">                        
                        <div class="tab-content">
                            <div class="tab-pane active" id="Professors">
                                <div class="table-responsive">
                                </div>
                            </div>                     
                        </div>
                    </div>
                </div>
                
                <div class="card">
						<div class="body">
							<div class="tab-content">
								<div class="tab-pane active" id="showTab">
									<div class="table-responsive">
										<table class="table table-hover m-b-0 c_list">
											<thead>
												<tr>
													<th>Department</th>
													<th>Batch</th>
													<th>Section</th>
													<th>Subject</th>
													<th>Time</th>
													<th>Pick Slots</th>
												</tr>
											</thead>
											<tbody id="dayTblBody">
											
											<c:forEach var="noti" items="${notification}">
<tr>
<td>${noti.sender.department.name}</td>
<td>${noti.assignSubject.batch.name}</td>

<td>${noti.assignSubject.section.name}</td>

<td>${noti.assignSubject.subject.name}</td>
<td>${noti.createdAt}</td>
<td><a href="slots">Slots</a></td>


</tr>
</c:forEach>


											</tbody>
										</table>
									</div>
								</div>

							</div>
						</div>
					</div>                
            </div>
            
    
       
            <div class="col-lg-12">
                <div class="card">
                    <div class="body">                            
                        <ul class="pagination pagination-primary m-b-0">
                            <li class="page-item"><a class="page-link" href="javascript:void(0);"><i class="zmdi zmdi-arrow-left"></i></a></li>
                            <li class="page-item active"><a class="page-link" href="javascript:void(0);">1</a></li>
                            <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
                            <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
                            <li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
                            <li class="page-item"><a class="page-link" href="javascript:void(0);"><i class="zmdi zmdi-arrow-right"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>        
    </div>
</section>
<!-- Jquery Core Js -->
<script src="assets/bundles/libscripts.bundle.js"></script>
<script src="assets/bundles/vendorscripts.bundle.js"></script>

<script src="assets/bundles/mainscripts.bundle.js"></script>
</body>

</html>