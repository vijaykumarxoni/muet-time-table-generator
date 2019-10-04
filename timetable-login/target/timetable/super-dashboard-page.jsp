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


<script>




$(document).ready(function(){
	
	
	//Faculty
	$.ajax({
		
		
	 	url:'faculty/getTotalAdmin', 
		type:'post',
		
		
		success:function(msg){
			
		$('#total_faculty').html(msg);
			
				
			} 
			


		});
	
	//ClassRoom
	$.ajax({
		
		
	 	url:'classroom/getTotalAdmin', 
		type:'post',
		
		
		success:function(msg){
			
		$('#total_room').html(msg);
			
				
			} 
			


		});
	
	
	//Day
	$.ajax({
		
		
	 	url:'day/getTotalAdmin', 
		type:'post',
		
		
		success:function(msg){
			
		$('#total_day').html(msg);
			
				
			} 
			


		});


	//Department
	$.ajax({
		
	
 	url:'department/getTotalAdmin', 
	type:'post',
	
	
	success:function(msg){
		
	$('#total_department').html(msg);
		
			
		} 
		


	});
	
	//TEACHER
	$.ajax({
		
		
	 	url:'teacher/getTotalAdmin', 
		type:'post',
		
		
		success:function(msg){
			
		$('#total_teacher').html(msg);
			
				
			} 
			


		});
	
	
	//SUBJECT
	$.ajax({
		
		
	 	url:'subject/getTotalAdmin', 
		type:'post',
		
		
		success:function(msg){
			
		$('#total_subject').html(msg);
			
				
			} 
			


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
	<jsp:include page="super_common/header.jsp"></jsp:include>




	<jsp:include page="super_common/left-bar.jsp"></jsp:include>

	<!-- Right Sidebar -->

	<jsp:include page="super_common/right-bar.jsp"></jsp:include>




	<!-- Main Content -->

	<section class="content contact">
		<div class="block-header">
			<div class="row">
				<div class="col-lg-7 col-md-6 col-sm-12">
					<h2>
						DASHBOARD 
					</h2>
				</div>
				
			</div>
		</div>
		<div class="container-fluid">

			
			
			
			        <div class="col-lg-12 col-md-12">
                <div class="row clearfix">
                
                <div class="col-lg-4 col-md-6">
                        <div class="card top_counter">
                            <div class="body">
                               <a href="faculty" >
                                <div class="icon xl-slategray"><i class="zmdi zmdi-account-o"></i> </div>
                                <div class="content">
                                    <div class="text">Total Faculty</div>
                                    <div id="total_faculty"    style="font-size:30px"    > </div>
                                       
                                    
                                </div>
                               </a> 
                            </div>                    
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                    
                        <div class="card top_counter">
                        
                            <div class="body">
                            <a href="department">
                                <div class="icon xl-slategray"><i class="zmdi zmdi-account-o"></i> </div>
                        		        
                                <div class="content">
                                    <div class="text">Total Department</div>
                                    <div id="total_department"    style="font-size:30px"    > </div>
                                       
                                    
                                </div>
                              </a>  
                            </div>
                                            
                        </div>
                        
                    </div>
                    <div class="col-lg-4 col-md-6">
                
                    
                        <div class="card top_counter">
                            <div class="body">
                             <a href="teacher" >
                                <div class="icon xl-slategray"><i class="zmdi zmdi-graduation-cap"></i> </div>
                                <div class="content">
                                    <div class="text">Total Teachers</div>
                                               <div id="total_teacher"    style="font-size:30px"    > </div>
                                </div>
                                
                               </a> 
                            </div>
                        </div>
                     
                 </div>
                 
                 
                    <div class="col-lg-4 col-md-6">
                        <div class="card top_counter">
                            <div class="body">
                                                        <a href="subject">
                                <div class="icon xl-slategray"><i class="zmdi zmdi-label"></i> </div>
                                <div class="content">
                                    <div class="text">Total Subject</div>
                                     <div id="total_subject"    style="font-size:30px"    > </div>
                                </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-6">
                        <div class="card top_counter">
                            <div class="body">
                              <a href="classroom">
                            
                                <div class="icon xl-slategray"><i class="zmdi zmdi-account-o"></i> </div>
                                <div class="content">
                                    <div class="text">Total Rooms and Labs</div>
                                    <div id="total_room"    style="font-size:30px"    > </div>
                                       
                                    
                                </div>
                               </a> 
                            </div>                    
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="card top_counter">
                            <div class="body">
                                                          <a href="day">
                            
                                <div class="icon xl-slategray"><i class="zmdi zmdi-account-o"></i> </div>
                                <div class="content">
                                    <div class="text">Total Working Days</div>
                                    <div id="total_day"    style="font-size:30px"    > </div>
                                       
                                    
                                </div>
                                </a>
                            </div>                    
                        </div>
                    </div>
                    
                    
                    
                    <c:forEach items="${dept_admin}" var="d"> 
                    <c:choose>
                    
                    	<c:when test="${d.teacher==null && d.adminRole!='SuperAdmin' }">
                    <div class="col-lg-4 col-md-4 col-sm-4">
                <div class="card member-card bg-dark">
                 	
                 		
                    
                   
                        <h4 class="m-t-10 col-white">${d.username} </h4>
                         <a href="notification?assign_id=1"><i class="material-icons">chat</i></a>
                    
                    <div class="body">
                        
                        <hr>
                        
                        <strong class="text-muted">Department</strong>
                        <p class="col-white">${d.department.name}</p>
                        
                        <hr>
                          
					                          
                        
                      
                        
                       
                        
                         
                        <hr>
                          
                        
                        <c:forEach items="${assignsubjects}" var="ass">
                        <c:choose>
                        	<c:when test="${teacher.id==ass.teacher.id}">
                       			 <address class="col-white">${ass.subject.code}(${ass.subject.type}) ---(${ass.section.name})</address>
                       			 <c:set  var="ch" value="${ass.subject.credit_hour  }"  />
                       		</c:when>
                        </c:choose>
                      </c:forEach>
                        <hr>
                          
                        <strong class="text-muted">Total Credit Hours</strong>
                        <address class="col-white">${ch}</address>
                        
                     
                          
                       
                    </div>
                </div>
           
                </div>
                
                </c:when>
                
                	</c:choose>
                </c:forEach>
               
              
			
			
			
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
					   
							<select class="form-control " id="selectdept">
							
							</select>
							
						</div>
					</div>
					
					
					<div class="col-sm-12">
						<div class="form-group">
							<input type="text" value="" name="name" id="name"
								placeholder="Enter Teacher Name" class="form-control">
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
					
					
					
					<div class="col-sm-12">
						<div class="form-group">
							<input type="text" value="" name="designation" id="designation"
								placeholder="Enter Designation" class="form-control">
						</div>
					</div>
					
					<div class="col-sm-14 form-check-inline">
						<div class="form-group">
						       <label>Gender</label>
							  <label ><input type="radio" name="gender" id="gender" class="form-check-input"  value="male">Male</label> 
                              <label><input type="radio" name="gender" id="gender" class="form-check-input"  value="female">Female</label>
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