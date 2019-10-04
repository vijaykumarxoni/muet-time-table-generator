<%@ page import="com.muet.timetable.beans.*" %>
<%@ page import="com.muet.timetable.dao.*" %>
<%@ page import="com.muet.timetable.daoImpl.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html xmlns:th="http://www.thymeleaf.org">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<meta name="description"
	content="Responsive Bootstrap 4 and web Application ui kit.">

<title>Teachers :: MUET Timetable</title>
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
<script src="/assets/js/jquery.min.js"></script>
<script type="text/javascript">
        var rowId = "";




function getRow(id) {
	$('#updateteacherBtn').show();
	$('#addteacherBtn').hide();

	rowId = id;
	$.ajax({

		url : 'teacher/get',
		type : 'post',
		data : 'id=' + id,
		success : function(msg) {
			
			$('#name').val(msg.name);
			$('#email').val(msg.email);
			$('#password').val(msg.password);
			$('#designation').val(msg.designation);
			$('#contact').val(msg.contact);

			$("#designationSelect").val(msg.designation).change();
			$("#gender").val(msg.gender).change();

			

		}

	});

}


function deleteRow(id) {
	$.ajax({

		url : 'teacher/delete',
		type : 'post',
		data : 'id=' + id,
		
		success : function(msg) {
			show(0);

		}

	});

}

 	
function show(page) {
	$.ajax({
				url : 'teacher/getall',
				type : 'post',
				data : 'page=' + page,

				success : function(msg) {
					var rows = "";
					var pages = "";
					var data = msg.content;
					var currentPage = parseInt(page);
					var totalPages = parseInt(msg.totalPages);

					for (x in data) {
						rows += "<tr>";
						
						
						rows += "<td>" + data[x].id + "</td>";
						
						rows += "<td>" + data[x].name + "</td>";
						rows += "<td>" + data[x].email + "</td>";
						
						rows += "<td>" + data[x].designation + "</td>";
						rows += "<td>" + data[x].contact + "</td>";
						rows += "<td>" + data[x].dept.name + "</td>";
						

						rows += "<td>";
						rows += "<button class='btn btn-icon btn-neutral btn-icon-mini' onclick='getRow("
								+ data[x].id
								+ ")'  data-toggle='modal' data-target='#defaultModal'><i class='zmdi zmdi-edit'></i></button>";
						rows += "<button class='btn btn-icon btn-neutral btn-icon-mini' onclick='deleteRow("
								+ data[x].id
								+ ")'><i class='zmdi zmdi-delete'></i></button>";
								
								

						rows += "</td>";

						rows += "<tr>";

					}

					$("#teacherTblBody").html(rows);
					pages += "<li class='page-item'><a class='page-link' href='javascript:show("
							+ parseInt(currentPage - 1)
							+ ");'><i class='zmdi zmdi-arrow-left'></i></a></li>";

					for (var i = 0; i < totalPages; i++) {

						if (i === currentPage) {
							pages += "<li class='page-item active'><a class='page-link'  href='javascript:show("
									+ i
									+ ");'>"
									+ parseInt(i + 1)
									+ "</a></li>";
						} else {
							pages += "<li class='page-item '><a class='page-link'  href='javascript:show("
									+ i
									+ ");'>"
									+ parseInt(i + 1)
									+ "</a></li>";

						}

					}
					pages += "<li class='page-item'><a class='page-link'  href='javascript:show("
							+ parseInt(currentPage + 1)
							+ ");'><i class='zmdi zmdi-arrow-right'></i></a></li>";
					$("#pages").html(pages);

				}

			});
	
	
	

}

								
$(document).ready(function() {
	show(0);
	$('#updateteacherBtn').hide();
	$('#addteacherBtn').click(function() {
		var name = $('#name').val();
		var password = $('#password').val();
		var designation = $('#designationSelect').val();
		var gender = $("#gender").val();
		var contact = $('#contact').val();
		var email = $('#email').val();
		

		$.ajax({

		url : 'teacher/save',
			type : 'post',
		data : {
				
			'name' : name,
			'email' : email,
			'password' : password,
			'designation' : designation,
			'gender' : gender,
			'contact' : contact,
			
			},
		success : function(msg) {
		$('#name').val("");
		$('#email').val("");
		$('#password').val("");
		$('#designation').val("");
		$("#gender:checked").val("");
		$('#contact').val("");
				$('#designationSelect').val('-1').change()	

		show(0);

		$('#defaultModal').modal('toggle');

		}

		}); //ajax end
	}); //addbtnclick end
	
	$('#updateteacherBtn').click(function() {

		var name = $('#name').val();
		var password = $('#password').val();
		var designation = $('#designationSelect').val();
		var gender = $("#gender").val();
		var contact = $('#contact').val();
		var email = $('#email').val();
		$.ajax({

			url : 'teacher/update',
			type : 'post',
			data : {
				'id' : rowId,
				'name' : name,
				'email' : email,
				'password' : password,
				'designation' : designation,
				'gender' : gender,
				'contact' : contact,

			},
			success : function(msg) {
				$('#name').val("");
				show(0);
				$('#updateDeptBtn').hide();
				$('#addDeptBtn').show();

				$('#defaultModal').modal('toggle');

			}

		});//ajax end

	});//updatebtnclick end

	$('#showAddModel').click(function() {
		$('#updateteacherBtn').hide();
		$('#addteacherBtn').show();
		getSelectOptions();
		$('#name').val("");
		$('#email').val("");
		$('#password').val("");
		$('#designation').val("");
		$("#gender:checked").val("");
		$('#contact').val("");
		$("#designationSelect").val('-1').change();
		$("#gender").val('-1').change();

		

	});

	
}); // ready end

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
	
<c:choose>
  <c:when test="${request =='SuperAdmin'}">
	  <jsp:include page="super_common/header.jsp"></jsp:include>
	  <jsp:include page="super_common/left-bar.jsp"></jsp:include>
	  <jsp:include page="super_common/right-bar.jsp"></jsp:include>

  </c:when>
  <c:otherwise>
  	<jsp:include page="common/header.jsp"></jsp:include>
	<jsp:include page="common/left-bar.jsp"></jsp:include>
	<jsp:include page="common/right-bar.jsp"></jsp:include>
  </c:otherwise>
</c:choose>
	
	

	<!-- Main Content -->

	<section class="content contact">
		<div class="block-header">
			<div class="row">
				<div class="col-lg-7 col-md-6 col-sm-12">
					<h2>
						TEACHERS
					</h2>
				</div>
				
			</div>
		</div>
		<div class="container-fluid">

			<div class="row clearfix">
				<div class="col-lg-12">
					<div class="card action_bar">
						<div class="body">
							<div class="row clearfix">
								
								<div class="col-lg-5 col-md-5 col-6">
									<div class="input-group search">
										<input type="text" class="form-control"
											placeholder="Search..."> <span
											class="input-group-addon"> <i class="zmdi zmdi-search"></i>
										</span>
									</div>
								</div>
								<div class="col-lg-6 col-md-5 col-3 text-right">
									<div
										class="btn-group d-none d-lg-inline-block d-md-inline-block"
										role="group">
										<div class="btn-group">
										<button type="button" id="showAddModel"
										class="btn col-black btn-neutral d-none d-lg-inline-block d-md-inline-block"
										data-toggle="modal" data-target="#defaultModal">
										<i class="zmdi zmdi-plus-circle"></i>
									</button>
											
											<ul class="dropdown-menu dropdown-menu-right pullDown">
												<li><a href="javascript:void(0);">Family</a></li>
												<li><a href="javascript:void(0);">Work</a></li>
												<li><a href="javascript:void(0);">Google</a></li>
												<li role="separator" class="divider"></li>
												<li><a href="javascript:void(0);">Create a Label</a></li>
											</ul>
										</div>
										
										<button type="button"
												class="btn col-black btn-neutral dropdown-toggle"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												<i class="zmdi zmdi-label"></i> <span class="caret"></span>
											</button>
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
												
													<th>Teacher ID#</th>
													
													<th>Name</th>
													<th>Email</th>
													<th>Designation</th>
													<th>Contact</th>
													<th>Department</th>
													

													<th data-breakpoints="xs">Action</th>
												</tr>
											</thead>
											<tbody id="teacherTblBody">


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
							<ul class="pagination pagination-primary m-b-0" id="pages">

							</ul>
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
					<h4 class="title" id="defaultModalLabel">Add Teachers</h4>
				</div>
				<div class="modal-body">

					
					<div class="col-sm-12">
						<div class="form-group">
							<input type="text" value="" name="name" id="name"
								placeholder="Enter Teacher Name" class="form-control">
						</div>
					</div>
					
					
					<div class="col-sm-12"   >
						<div class="form-group">
					 <select class="form-control " id="designationSelect"  name="designation">
					   
							<option value="-1">-- Designation --</option>
								<option value="Lecturer">Lecturer</option>   
							<option value="Assistant Professor">Assistant Professor</option>   
							<option value="Associate  Professor">Associate  Professor</option>  
							<option value="Professor">Professor</option>  
						    <option value="Lab Assistant">Lab  Assistant</option>   
						    <option value="Teaching Assistant">Teaching Assistant</option>   
					         <option value="Instructor">Instructor</option>   
							 
							 
								
							</select>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group">
							<input type="text" value="" name="email" id="email"
								placeholder="Enter Email" class="form-control">
						</div>
					</div>
					
					
					<div class="col-sm-12">
						<div class="form-group">
							<input type="text" value="" name="password" id="password"
								placeholder="Enter Password" class="form-control">
						</div>
					</div>
					
					
					
					<div class="col-sm-12"   >
						<div class="form-group">
					 <select class="form-control " id="gender"  name="gender">
					   
							<option value="-1">-- Gender --</option>
								<option value="Male">Male</option>   
							<option value="Female">Female</option>   
							 
								
							</select>
						</div>
					</div>
					
					
					
					
					<div class="col-sm-12">
						<div class="form-group">
							<input type="text" value="" name="contact" id="contact"
								placeholder="Enter Contact" class="form-control">
						</div>
					</div>



				</div>
				<div class="modal-footer">


					<button type="button" id="addteacherBtn"
						class="btn btn-default btn-round waves-effect">Save</button>
						
					<button type="button" id="updateteacherBtn"
						class="btn btn-default btn-round waves-effect">Update</button>
						
					<button type="button" class="btn btn-danger waves-effect"
						data-dismiss="modal">Close</button>
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