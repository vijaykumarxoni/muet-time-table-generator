<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js " lang="en">

<!-- Mirrored from thememakker.com/templates/oreo/university/html/list-group.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 04 May 2019 10:03:29 GMT -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

<title>Settings :: Muet TimeTable ::</title>
<!-- Favicon-->
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
<!-- Custom Css -->
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/color_skins.css">
</head>

<style>
.list-group-item:hover{
background:grey;
}

</style>
<body class="theme-blush">
<!-- Page Loader -->
<div class="page-loader-wrapper">
    <div class="loader">
        <div class="m-t-30"><img class="zmdi-hc-spin" src="assets/images/logo.svg" width="48" height="48" alt="Oreo"></div>
        <p>Please wait...</p>        
    </div>
</div>
<!-- Overlay For Sidebars -->
<div class="overlay"></div>
<!-- Top Bar -->

 <jsp:include page="common/header.jsp"></jsp:include>
	
	
	
	
	<jsp:include page="common/left-bar.jsp"></jsp:include>
	
		<!-- Right Sidebar -->
	
		<jsp:include page="common/right-bar.jsp"></jsp:include>

	
	


<!-- Chat-launcher -->


<section class="content">
    <div class="block-header">
        <div class="row">
            <div class="col-lg-7 col-md-6 col-sm-12">
                <h2>Settings
               
                </h2>
            </div>
            
        </div>
    </div>
    <div class="container-fluid">
        <div class="row clearfix">
        
        
           <!-- Badges -->
            <div class="col-lg-12 col-md-12">
                <div class="card">
                    <div class="header">
                        <h2><strong>Frequently Used </strong> <small></small> </h2>
                       
                    </div>
                    <div class="body">
                        <ul class="list-group">
                           
                            <li class="list-group-item"><a href="assignsubject">Assign Subjects to Teacher </a></li>
                             <li class="list-group-item"><a href="batch">Batches (Add , Update , View)</a></li>
                           
                        </ul>
                    </div>
                </div>
            </div> 
        
         
            <!-- Basic Examples -->
            <div class="col-lg-12 col-md-12">
                <div class="card">
                    <div class="header">
                        <h2><strong>Others</strong>  </h2>
                   
                    </div>
                    <div class="body">
                        <ul class="list-group">
                         <li class="list-group-item"><a href="batch">Batches (Add , Update , View)</a></li>
                         <li class="list-group-item"><a href="section">Sections (Add , Update , View)</a></li>
                        
                            <li class="list-group-item"><a href="teacher">Teachers (Add , Update , View)</a>      </li>
                            <li class="list-group-item"><a href="subject">Subjects (Add , Update , View)</a></li>
                            <li class="list-group-item"><a href="classroom">Classroom (Add , Update , View)</a></li>
                            
                            
                            
                        </ul>
                    </div>
                </div>
            </div> 
            
            
            
                   
                    
        </div>
        
        
        
        
        
        
        <!-- #END# Contextual Classes With Linked Items --> 
    </div>
</section>

<!-- Jquery Core Js --> 
<script src="assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 
<script src="assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 

<script src="assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js --> 
</body>

<!-- Mirrored from thememakker.com/templates/oreo/university/html/list-group.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 04 May 2019 10:03:29 GMT -->
</html>