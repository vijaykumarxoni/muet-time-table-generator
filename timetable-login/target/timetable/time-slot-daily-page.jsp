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
<script src="/assets/js/jquery.min.js"></script>
<script type="text/javascript">
	var rowId = "";

	function getSelectOptions() {

		$.ajax({

			url : '/day/getList',
			type : 'post',
			success : function(msg) {
				var options = "";
				options += "<option value='-1'>-- Days --</option>";

				for (x in msg) {
					options += "<option value='"+msg[x].id+"'>" + msg[x].name
							+ "</option>";

				}

				$("#daySelect").html(options);
			}

		});

	}

	function getRow(id) {
		$('#updateSlotBtn').show();
		$('#addSlotBtn').hide();
		rowId = id;
		$.ajax({

			url : '/timeSlotDaily/get',
			type : 'post',
			data : 'id=' + id,
			success : function(msg) {

				$('#totalSlots').val(msg.totalSlots);
				$("#durationSelect").val(msg.duration).change();
				$("#daySelect").val(msg.day.id).change();

			}

		});

	}

	function deleteRow(id) {
		$.ajax({

			url : '/timeSlotDaily/delete',
			type : 'post',
			data : 'id=' + id,
			success : function(msg) {
				show(0);

			}

		});

	}
	function show(page) {
		$
				.ajax({

					url : '/timeSlotDaily/getall',
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
							rows += "<td>" + data[x].day.name + "</td>";
							rows += "<td>" + data[x].totalSlots + "</td>";
							rows += "<td>" + data[x].duration + " min </td>";

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

						$("#roomTblBody").html(rows);
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
		getSelectOptions();
		show(0);

		$('#addSlotBtn').click(function() {
			var totalSlots = $('#totalSlots').val();
			var duration = $("#durationSelect").val();
			var day = $("#daySelect").val();
			$('#updateSlotBtn').hide();

			$.ajax({

				url : '/timeSlotDaily/save',
				type : 'post',

				data : {
					'totalSlots' : totalSlots,
					'duration' : duration,
					"day.id" : day,

				},
				success : function(msg) {
					$('#totalSlots').val("");
					$('#durationSelect').val(-1);
					$('#daySelect').val(-1);

					show(0);

					$('#defaultModal').modal('toggle');

				}

			});

		});
		$('#updateSlotBtn').click(function() {
			var totalSlots = $('#totalSlots').val();
			var duration = $("#durationSelect").val();
			var day = $("#daySelect").val();
			$('#updateSlotBtn').hide();
			$.ajax({

				url : '/timeSlotDaily/update',
				type : 'post',
				data : {
					'id' : rowId,
					'totalSlots' : totalSlots,
					'duration' : duration,
					"day.id" : day,

				},
				success : function(msg) {

					$('#totalSlots').val("");
					$('#durationSelect').val(-1);
					$('#daySelect').val(-1);

					$('#updateSlotBtn').hide();
					$('#addSlotBtn').show();
					show(0);

					$('#defaultModal').modal('toggle');

				}

			});

		});

		$('#showAddModel').click(function() {
			getSelectOptions();
			$('#updateSlotBtn').hide();
			$('#addSlotBtn').show();
			$('#totalSlots').val("");
			$('#durationSelect').val(-1).change();
			;
			$('#daySelect').val(-1).change();
			;

		});

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

	<section class="content contact">
		<div class="block-header">
			<div class="row">
				<div class="col-lg-7 col-md-6 col-sm-12">
					<h2>
						Class Rooms <small>Welcome to MUET Time Table</small>
					</h2>
				</div>
				<div class="col-lg-5 col-md-6 col-sm-12">
					<ul class="breadcrumb float-md-right">
						<li class="breadcrumb-item"><a href="index.html"><i
								class="zmdi zmdi-home"></i> MUET</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0);">App</a></li>
						<li class="breadcrumb-item active">Class Room</li>
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
													<th>Day</th>
													<th>Total Slots</th>
													<th>Duration per slot</th>

													<th data-breakpoints="xs">Action</th>
												</tr>
											</thead>
											<tbody id="roomTblBody">


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
					<h4 class="title" id="defaultModalLabel">Add Time Slots</h4>
				</div>
				<div class="modal-body">

					<div class="col-sm-12">
						<div class="form-group">

							<select class="form-control " id="daySelect">
								<option value="">-- Days --</option>

							</select>
						</div>
					</div>

					<div class="col-sm-12">
						<div class="form-group">

							<select class="form-control " id="durationSelect">
								<option value="-1">-- Slot Duration --</option>

								<option value="30">30 min</option>
								<option value="45">45 min</option>
								<option value="60">60 min</option>





							</select>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group">
							<input type="text" value="" name="totalSlots" id="totalSlots"
								placeholder="Total num of slots per day" class="form-control">
						</div>
					</div>



				</div>
				<div class="modal-footer">


					<button type="button" id="addSlotBtn"
						class="btn btn-default btn-round waves-effect">SAVE</button>
					<button type="button" id="updateSlotBtn"
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