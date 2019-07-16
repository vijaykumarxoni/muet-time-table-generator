<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>

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
<link rel="stylesheet" href="assets/css/color_skins.css">
<script src="/assets/js/jquery.min.js"></script>
<script type="text/javascript">
	var rowId="";
	






	$(document).ready(function() {
		

		$('#submit').click(function(){
			
			
			var desc= $('#description').val();
			var assignsubject= $('#assignsubject').val();
			var teacher= $('#teacher').val();
			
			
			
			
			
			
			$.ajax({

				url : 'notification/save',
				type : 'post',
				data : 'description=' + desc+'&assignsubject='+assignsubject+'&teacher='+teacher,
				success : function(msg) {
					$('#noti').fadeIn(1000);

				}

			});
			
			
			
		})




	});
</script>
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
	<!-- Top Bar -->
   <jsp:include page="common/header.jsp"></jsp:include>
	
	
	
	
	<jsp:include page="common/left-bar.jsp"></jsp:include>
	
		<!-- Right Sidebar -->
	
		<jsp:include page="common/right-bar.jsp"></jsp:include>
		<jsp:include page="common/chat-box.jsp"></jsp:include>
	
	

	<!-- Main Content -->
	
	

<section class="content profile-page">
    <div class="block-header">
        <div class="row">
            <div class="col-lg-7 col-md-6 col-sm-12">
                <h2>Send Notification
                
                </h2>
                 
                
            </div>
            <div class="col-lg-5 col-md-6 col-sm-12">
                <button class="btn btn-white btn-icon btn-round float-right m-l-10" type="button">
                    <i class="zmdi zmdi-plus"></i>
                </button>
                <ul class="breadcrumb float-md-right">
                    <li class="breadcrumb-item"><a href="dashboard"><i class="zmdi zmdi-home"></i> Muet</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0);">App</a></li>
                    <li class="breadcrumb-item active">notification</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card">
                    <div class="header">
                        <h2><strong>${teacher_name} </strong>  <small>${teacher_subject} (${teacher_subject_type})</small> </h2>
                        <ul class="header-dropdown">
                            <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="zmdi zmdi-more"></i> </a>
                                <ul class="dropdown-menu dropdown-menu-right slideUp">
                                    <li><a href="javascript:void(0);" class="waves-effect waves-block">Action</a></li>
                                    <li><a href="javascript:void(0);" class="waves-effect waves-block">Another action</a></li>
                                    <li><a href="javascript:void(0);" class="waves-effect waves-block">Something else</a></li>
                                </ul>
                            </li>
                            <li class="remove">
                                <a role="button" class="boxs-close"><i class="zmdi zmdi-close"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="row clearfix">
                        
                            <div class="col-lg-6 col-md-12">
                             <div class="form-group">
                                    <input type="hidden" class="form-control" id="assignsubject" value="${assign_id} "    placeholder="Description">
                                </div>
                                
                                 <div class="form-group">
                                    <input type="hidden" class="form-control" id="teacher"  value="${teacher_id} "    placeholder="Description">
                                </div>
                            
                                <div class="form-group">
                                    <input type="text" class="form-control" id="description" placeholder="Description">
                                </div>
                                <div id="noti" style="display:none">
          	                       <div class="alert alert-success alert-dismissible">
    								<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    								<strong>Sent!</strong>.
   									 </div>
  </div>
                            </div>
                            
                        </div>
                        
                        
                        <div class="row clearfix">                            
                            
                            <div class="col-sm-12">
                                <button type="button" id="submit" class="btn btn-raised btn-round btn-primary">Submit</button>
                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        

    </div>
</section>

	<div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="title" id="defaultModalLabel">Add Faculty</h4>
				</div>
				<div class="modal-body">

					<div class="col-sm-12">
						<div class="form-group">
							<input type="text" value="" name="name" id="name"
								placeholder="Faculty Name" class="form-control">
						</div>
					</div>


				</div>
				<div class="modal-footer">


					<button type="button" id="addFacultyBtn"
						class="btn btn-default btn-round waves-effect">SAVE</button>
					<button type="button" id="updateFacultyBtn"
						class="btn btn-default btn-round waves-effect">Update</button>
					<button type="button" class="btn btn-danger waves-effect"
						data-dismiss="modal">CLOSE</button>
				</div>
			</div>
		</div>
	</div>






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