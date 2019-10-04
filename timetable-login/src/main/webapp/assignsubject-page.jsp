<%@ page import="com.muet.timetable.beans.*"%>
<%@ page import="com.muet.timetable.dao.*"%>
<%@ page import="com.muet.timetable.daoImpl.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
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

<title>Assign Subjects to Teachers:: MUET Timetable</title>
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
	<!-- Top Bar -->
	<jsp:include page="common/header.jsp"></jsp:include>




	<jsp:include page="common/left-bar.jsp"></jsp:include>

	<!-- Right Sidebar -->

	<jsp:include page="common/right-bar.jsp"></jsp:include>




	<!-- Main Content -->

	<section class="content contact">
		<div class="block-header">
			<div class="row">
				<div class="col-lg-7 col-md-6 col-sm-12">
					<h2>
						ASSIGN SUBJECTS To TEACHERS 
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
								
								
									<button type="button" id="showAddModel"
										class="btn col-black btn-neutral d-none d-lg-inline-block d-md-inline-block"
										data-toggle="modal" data-target="#defaultModal">
										<i class="zmdi zmdi-plus-circle"></i>
									</button>
									<div
									
										class="btn-group d-none d-lg-inline-block d-md-inline-block"
										role="group">
										<div class="btn-group">
											<button type="button"
												class="btn col-black btn-neutral dropdown-toggle"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												<i class="zmdi zmdi-label"></i> <span class="caret"></span>
											</button>
											<ul class="dropdown-menu dropdown-menu-right pullDown">
												<li><a href="javascript:void(0);">Family</a></li>
												<li><a href="javascript:void(0);">Work</a></li>
												<li><a href="javascript:void(0);">Google</a></li>
												<li role="separator" class="divider"></li>
												<li><a href="javascript:void(0);">Create a Label</a></li>
											</ul>
										</div>
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
								

											
													<th>Subject</th>
													<th>Teacher</th>
													<th>Batch</th>
													<th>Section</th>

													<th>Semester</th>
													<th data-breakpoints="xs">Action</th>
												</tr>
											</thead>
											<tbody id="assignsubjectTblBody">


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
					<h4 class="title" id="defaultModalLabel">Assign Subject to Teacher</h4>
				</div>
				<div class="modal-body">
									<div class="col-sm-12">
						<div class="form-group">
							Batches
							<select id="selectBatch">
							
							
							</select>
							
							
							
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group" >
							Sections		
						<span id="addSection">
						</span>
				
							
							</div>
					</div>
					
					<div class="col-sm-12">
						<div class="form-group">
					Semesters
										
						<span id="addSemester">
						</span>
							</div>
					</div>
					
					<div class="col-sm-12">
						<div class="form-group">
					Teachers
							<span id="addTeacher">
						</span>
							</div>
					</div>
					
					<div class="col-sm-12">
						<div class="form-group">
					Subjects
							<span id="addSubject">
						</span>
							</div>
					</div>
					
						
					
					
							
<div  id="model-body-box">


					

				</div>
				<div class="modal-footer">


					<button type="button" id="addassignsubjectBtn"
						class="btn btn-default btn-round waves-effect">Save</button>

					<button type="button" id="updateassignsubjectBtn"
						class="btn btn-default btn-round waves-effect">Update</button>

					<button type="button" class="btn btn-danger waves-effect"
						data-dismiss="modal">Close</button>
				</div>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript">
		var rowId = "";



		function getSelectOptionsforbatch() {
			$.ajax({

						url : 'batch/getListByDept',
						method : "POST",


						success : function(msg) {

							//populateOptionsInSelect(msg,"selectBatch","Batch")
							var options="";
							options += "<option value='-1'> --Select-- </option>";
							for (x in msg) {
								options += "<option value='"+msg[x].id+"'>"
										+ msg[x].name
										+ "</option>";

							}
							$('#selectBatch').empty();
							$('#selectBatch').append(options);



						}

					});


		}
		
		
	
		function getSelectOptionsforsemester() {

			$.ajax({

				url : 'semester/getList',
				type : 'post',

				success : function(msg) {
					var options = "<select id='selectSemester' >";
					options += "<option value='-1'>-- Semester --</option>";

					for (x in msg) {
						options += "<option value='"+msg[x].id+"'>"
								+ msg[x].name + "</option>";

					}
					options +="</select>";
					$("#addSemester").html(options);
				}

			});

		}
		
		
		function getSelectOptionsforteachers() {

			$.ajax({

				url : 'teacher/getAllList',
				type : 'post',

				success : function(msg) {
					var options = "<select id='selectTeacher' >";
					options += "<option value='-1'>-- Select --</option>";

					for (x in msg) {
						options += "<option value='"+msg[x].id+"'>"
								+ msg[x].name + "</option>";

					}
					options +="</select>";
					$("#addTeacher").html(options);
				}

			});

		}
		
		function getSelectOptionsforsubjects() {

			$.ajax({

				url : 'subject/getAllList',
				type : 'post',

				success : function(msg) {
					var options = "<select id='selectSubject' >";
					options += "<option value='-1'>-- Select --</option>";

					for (x in msg) {
						options += "<option value='"+msg[x].id+"'>"
								+ msg[x].name + " ---"+ msg[x].type +"</option>";

					}
					options +="</select>";
					$("#addSubject").html(options);
				}

			});

		}



		function getRow(id) {
			$('#updateassignsubjectBtn').show();
			$('#addassignsubjectBtn').hide();
			rowId = id;
			$.ajax({

				url : 'assignsubject/get',
				type : 'post',
				data : 'id=' + id,
				success : function(msg) {

					$("#selectsubject").val(msg.subject.id).change();
					$("#selectteacher").val(msg.teacher.id).change();
					$("#selectbatch").val(msg.batch.id).change();
					$("#selectsemester").val(msg.semester.id).change();

					$("#selectSection").val(msg.section.id).change();

				}

			});

		}


		
		
		function deleteRow(id) {
			$.ajax({

				url : 'assignsubject/delete',
				type : 'post',
				data : 'id=' + id,

				success : function(msg) {
					show(0);

				}

			});

		}

		function show(page) {
			$.ajax({
						url : 'assignsubject/getall',
						type : 'post',
						data : 'page=' + page,
						async : false,

						success : function(msg) {
							var rows = "";
							var pages = "";
							var data = msg.content;
							var currentPage = parseInt(page);
							var totalPages = parseInt(msg.totalPages);

							for (x in data) {

								var type = "";
								if (data[x].subject.type == "Practical") {
									type = "PR";
								} else {
									type = "TH";
								}
								rows += "<tr>";
								

								rows += "<td>" + data[x].subject.name + " ("
										+ type + ")</td>";
								rows += "<td>" + data[x].teacher.name + "</td>";

								rows += "<td>" + data[x].batch.name + "</td>";
								rows += "<td>" + data[x].section.name + "</td>";

								rows += "<td>" + data[x].semester.name
										+ "</td>";

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

							$("#assignsubjectTblBody").html(rows);
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
		
		
		//DOCUMENT READY STARTS HERE

		$(document).ready(function() {

							
			getSelectOptionsforbatch();
			
			$('#selectBatch').change(function(){
			var batch_id=	$('#selectBatch').val();
			
				$.ajax({
					url:'section/get',
					type:'post',
					data:'batch='+batch_id,
					
					success:function(msg){
						var options="<select  id='selectSection' >";
						
						options +="<option value='-1' >-- Select </option>";
						for (x in msg) {
							options += "<option value='"+msg[x].id+"'>"
									+ msg[x].name
									+ "</option>";
									


						}
						
						options += "</select>";
						
						
						$('#addSection').html(options);
						
						getSelectOptionsforsemester();
						getSelectOptionsforteachers();
						getSelectOptionsforsubjects();
					}
				
				
				});
			});
			
			



							



							show(0);
							$('#updateassignsubjectBtn').hide();
							$('#addassignsubjectBtn').click(
									function() {

										var subjectid = $('#selectSubject')
												.val();
										var teacherid = $('#selectTeacher')
												.val();
										var batchid = $('#selectBatch').val();
										var semesterid = $('#selectSemester')
												.val();
										var sectionid = $('#selectSection')
												.val();
										
									
									
										$.ajax({

											url : 'assignsubject/save',
											type : 'post',
											data : {

												'subject.id' : subjectid,
												'teacher.id' : teacherid,
												'batch.id' : batchid,
												'semester.id' : semesterid,
												'section.id' : sectionid,

											},
											success : function(msg) {
												$("#selectsubject").val('-1')
														.change();
												$("#selectteacher").val('-1')
														.change();
												$("#selectbatch").val('-1')
														.change();
												$("#selectsemester").val('-1')
														.change();

												show(0);

												$('#defaultModal').modal(
														'toggle');

											}

										}); //ajax end
										
										
									}); //addbtnclick end

							$('#updateassignsubjectBtn').click(
									function() {

										var subjectid = $('#selectSubject')
												.val();
										var teacherid = $('#selectTeacher')
												.val();
										var batchid = $('#selectBatch').val();
										var semesterid = $('#selectSemester')
												.val();
										var sectionid = $('#selectSection')
												.val();
										alert(subjectid + " " + teacherid + " "
												+ batchid + " " + semesterid)

										$.ajax({

											url : 'assignsubject/update',
											type : 'post',
											data : {
												'id' : rowId,
												'subject.id' : subjectid,
												'teacher.id' : teacherid,
												'batch.id' : batchid,
												'semester.id' : semesterid,
												'section.id' : sectionid,

											},
											success : function(msg) {
												show(0);
												$('#updateassignsubjectBtn')
														.hide();
												$('#addassignsubjectBtn')
														.show();
												$("#selectsubject").val('-1')
														.change();
												$("#selectteacher").val('-1')
														.change();
												$("#selectbatch").val('-1')
														.change();
												$("#selectsemester").val('-1')
														.change();
												$("#selectSection").val('-1')
														.change();

												getSelectOptionsForSection()

												$('#defaultModal').modal(
														'toggle');

											}

										});//ajax end

									});//updatebtnclick end

							$('#showAddModel').click(function() {
								$('#updateassignsubjectBtn').hide();
								$('#addassignsubjectBtn').show();

								$("#selectsubject").val('-1').change();
								$("#selectteacher").val('-1').change();
								$("#selectbatch").val('-1').change();
								$("#selectsemester").val('-1').change();
								$("#selectSection").val('-1').change();

							});

						}); // ready end
	</script>


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