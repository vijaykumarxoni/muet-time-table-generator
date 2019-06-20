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

var rowId = "";


function show(page) {
	$.ajax({
				url : 'semester/getall',
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

					$("#semesterTblBody").html(rows);
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

function getRow(id) {
	$('#updatesemesterBtn').show();
	$('#addsemesterBtn').hide();
	rowId = id;
	$.ajax({

		url : 'semester/get',
		type : 'post',
		data : 'id=' + id,
		success : function(msg) {

			$('#name').val(msg.name);
			
		}

	});

}	
	
	
function deleteRow(id) {

	$.ajax({

		url : 'semester/delete',
		type : 'post',
		data : 'id=' + id,
		success : function(msg) {
			show(0);

		}

	});

}

	
	

$(document).ready(function() {
	show(0);
	$('#updatesemesterBtn').hide();
	$('#addsemesterBtn').click(function() {
		var name = $('#name').val();
		$.ajax({

			url : 'semester/save',
			type : 'post',
			data : 'name=' + name,
			success : function(msg) {
				$('#name').val("");
				show(0);

				$('#defaultModal').modal('toggle');

			}

		});// ajax ends here
	});//addbtn click end here
	
	$('#updatesemesterBtn').click(function() {

		var name = $('#name').val();
		var faculty = $("#facultySelect").val();
		var code = $("#code").val();
		$.ajax({

			url : 'semester/update',
			type : 'post',
			data : {
				'id' : rowId,
				'name' : name,
				
			},
			success : function(msg) {
				$('#name').val("");
				show(0);
				$('#updatesemesterBtn').hide();
				$('#addsemesterBtn').show();
				$('#defaultModal').modal('toggle');

			}

		});// ajax ends here

	});//updatebtn click ends here

	$('#showAddModel').click(function() {
		$('#updatesemesterBtn').hide();
		$('#addsemesterBtn').show();
		
        $('#name').val("");	
	});
});//ready method end here
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

	<section class="content contact">
		<div class="block-header">
			<div class="row">
				<div class="col-lg-7 col-md-6 col-sm-12">
					<h2>
						Semesters <small>Welcome to MUET Time Table</small>
					</h2>
				</div>
				<div class="col-lg-5 col-md-6 col-sm-12">
					<ul class="breadcrumb float-md-right">
						<li class="breadcrumb-item"><a href="index.html"><i
								class="zmdi zmdi-home"></i> MUET</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0);">App</a></li>
						<li class="breadcrumb-item active">semester</li>
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
										<input id="deleteall" type="checkbox"> <label
											for="deleteall"> All </label>
									</div>
								</div>
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


									<button type="button" id="showAddModel"
										class="btn col-black btn-neutral d-none d-lg-inline-block d-md-inline-block"
										data-toggle="modal" data-target="#defaultModal">
										<i class="zmdi zmdi-plus-circle"></i>
									</button>
									<button type="button"
										class="btn col-black btn-neutral d-none d-lg-inline-block d-md-inline-block">
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
								<div class="tab-pane active" id="showTab">
									<div class="table-responsive">
										<table class="table table-hover m-b-0 c_list">
											<thead>
												<tr>
													<th>#</th>
													<th>Name</th>
													<th data-breakpoints="xs">Action</th>
												</tr>
											</thead>
											<tbody id="semesterTblBody">


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
					<h4 class="title" id="defaultModalLabel">Add Semester</h4>
				</div>
				<div class="modal-body">

					<div class="col-sm-12">
						<div class="form-group">
							<input type="text" value="" name="name" id="name"
								placeholder="Semester Name" class="form-control">
						</div>
					</div>


				</div>
				<div class="modal-footer">


					<button type="button" id="addsemesterBtn"
						class="btn btn-default btn-round waves-effect">Save</button>
						
					<button type="button" id="updatesemesterBtn"
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
