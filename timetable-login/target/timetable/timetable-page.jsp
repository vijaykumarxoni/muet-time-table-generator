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
      <script type="text/javascript">
         var rowId = "";
         
         function getSelectOptions() {
         
         	$.ajax({
         
         		url : 'batch/getList',
         		type : 'post',
         		async:'false',
         		success : function(msg) {
         			var options = "";
         			options += "<option value='-1'>-- Batch --</option>";
         
         			for (x in msg) {
         				options += "<option value='"+msg[x].id+"'>" + msg[x].name
         						+ "</option>";
         
         			}
         
         			$("#selectbatch").html(options);
         		}
         
         	});
         
         }
         
         
         
         
         
         
         
         
         
          	
         
         								
         $(document).ready(function() {
         
		
         		
         

         	
         	
        	  	$('.send-msg').click(function(event){
        	    	//	$('#chat-btn').toggleClass("chat-launcher active");
        	    		//$('#chat').addClass("is-open pullUp");
        	    	  
				       // alert(event.target.id);
				        
				        
				      var  teacher_id=event.target.id;

        	    		//addClass
        	    		
        	    		$.ajax({
        	    				
        	    				url:'teacher/get',
        	    				type:'post',
        	    				data:'id='+teacher_id,
        	    				success:function(msg){
        	    					
        	    					$('#teacher-name').text(msg.name);
        	    					
        	    					$('#chating-area').toggleClass(" is-open pullUp");
        	    					
        	    					

        	    					
        	    				},
        	    				error:function(){
        	    					
        	    				}
        	    				
        	    				
        	    			});
        	    		
        	    		/*
        	    		   var chatingClass = $('#chating-area').attr("class");
        	    		if (chatingClass  == "chat-wrapper is-open pullUp"){
        	    			
        	    			
        	    			
        	    			
        	    				
        	    			
        	    			
        	    			
        	    			
        	    			
        	    			
        	    		}
        	    		else if (chatingClass  == "chat-wrapper"){
        	    			
        	    			
        	    			
        	    			
        	    			
        	    			
        	    			
        	    			
        	    			
        	    		}
        	    		
        	    		*/
        	    		
        	    		
        	    		
        	    		
        	    		
        	    		
        	    		
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
      <jsp:include page="common/header.jsp"></jsp:include>
      <jsp:include page="common/left-bar.jsp"></jsp:include>
      <!-- Right Sidebar -->
      <jsp:include page="common/right-bar.jsp"></jsp:include>
    



	
	<!-- Chat-launcher -->
	<div class="chat-launcher" id="chat-btn" ></div>
	<div class="chat-wrapper" id="chating-area" >
		<div class='card'>
			<div class='header'>
				<ul class='list-unstyled team-info margin-0' id="check ">
					<li class='m-r-15' ><h2 id="teacher-name" >Sir Salah ok </h2></li>
					
				</ul>
			</div>
			<div class='body'>
				<div class='chat-widget'>
					<ul class='chat-scroll-list clearfix'>
						<li class='left float-left'><img
							src='assets/images/xs/avatar3.jpg' class='rounded-circle' alt=''>
							<div class='chat-info'>
								<a class='name' href='javascript:void(0);'>Alexanderdddds</a> <span
									class='datetime'>6:12</span> <span class='message'>Hello,
									John </span>
							</div></li>
						<li class='right'>
							<div class='chat-info'>
								<span class='datetime'>6:15</span> <span class='message'>Hi,
									Alexander<br> How are you!
								</span>
							</div>
						</li>
						<li class='right'>
							<div class='chat-info'>
								<span class='datetime'>6:16</span> <span class='message'>There
									are many variations of passages of Lorem Ipsum available</span>
							</div>
						</li>
						<li class='left float-left'><img
							src='assets/images/xs/avatar2.jpg' class='rounded-circle' alt=''>
							<div class='chat-info'>
								<a class='name' href='javascript:void(0);'>Elizabeth</a> <span
									class='datetime'>6:25</span> <span class='message'>Hi,
									Alexander,<br> John <br> What are you doing?
								</span>
							</div></li>
						<li class='left float-left'><img
							src='assets/images/xs/avatar1.jpg' class='rounded-circle' alt=''>
							<div class='chat-info'>
								<a class='name' href='javascript:void(0);'>Michael</a> <span
									class='datetime'>6:28</span> <span class='message'>I
									would love to join the team.</span>
							</div></li>
						<li class='right'>
							<div class='chat-info'>
								<span class='datetime'>7:02</span> <span class='message'>Hello,
									<br>Michael
								</span>
							</div>
						</li>
					</ul>
				</div>
				<div class='input-group p-t-10' >
				<b>Request for slots</b>
					<input type="checkbox" class="form-control " value="Request for slots"
						  id="" >
						  <hr>
						  </div>
				<div class='input-group p-t-15'>
				
			
					<input type='text' class='form-control'
						placeholder='Enter text here...'  id='msg' > <span
						class='input-group-addon'> <i class='zmdi zmdi-mail-send' id='send'></i>
					</span>
				</div>
			</div>
		</div>
	</div>
	    
    
    
    
    
    
    
    
    
    
    
      <!-- Main Content -->
      <section class="content contact">
         <div class="block-header">
            <div class="row">
               <div class="col-lg-7 col-md-6 col-sm-12">
                  <h2>
                     Time Table <small>Welcome to MUET Time Table</small>
                  </h2>
               </div>
               <div class="col-lg-5 col-md-6 col-sm-12">
                  <ul class="breadcrumb float-md-right">
                     <li class="breadcrumb-item"><a href="index.html"><i
                        class="zmdi zmdi-home"></i> MUET</a></li>
                     <li class="breadcrumb-item"><a href="javascript:void(0);">App</a></li>
                     <li class="breadcrumb-item active">Time Table</li>
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
                           <div class="col-lg-3 col-md-3 col-3">
                              <div class="form-group">
                                 
                              </div>
                           </div>
                           <div class="col-lg-3 col-md-3 col-3">
                              <div class="form-group" id="addsection">
                              </div>
                           </div>
                           <div class="col-lg-5 col-md-5 col-6">
                              <div class="input-group search">
                                 <input type="button" id="showAddModel" data-toggle="modal" data-target="#defaultModal"    class="btn btn-success" value="Show Time Table"
                                    > 
                                 <input type="button" id="generate_timetable"     class="btn btn-success" value="Generate Time Table" /> 
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="card">
                     <div class="body">
                        <div class="tab-content">
                           <div class="tab-pane active" id="showTab">
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="row clearfix">
               <div class="col-lg-4 col-md-4">
                  <div class="card">
                     <div class="body">
                        <div class="workingtime">
                           <h6>Teachers</h6>
                           <div id="teacherdata">
                              <c:forEach items="${listofteachers}" var="listofteachers">
                                 <c:choose>
                                    <c:when test="${listofteachers.subject.type == 'Theory'}">
                                       <div style='background:#0035ff47'>
                                          <hr>
                                          <b>${listofteachers.teacher.name}<br>
                                          <br>
                                          <small class=''><b>${listofteachers.subject.name}</small><br>
                                          <small class='text-muted'><b>${listofteachers.subject.type}</b>
                                          </small> 
                                          <hr>
                                           <input type="button" class="btn btn-success send-msg" value="Send Message" id="${listofteachers.teacher.id}"  />
                                       </div>
                                    </c:when>
                                 </c:choose>
                              </c:forEach>
                              <c:forEach items="${listofteachers}" var="listofteachers">
                                 <c:choose>
                                    <c:when test="${listofteachers.subject.type == 'Practical'}">
                                       <div style='background:#00800026'    >
                                          <hr>
                                          <b>${listofteachers.teacher.name}<br>
                                          <br>
                                          <small class=''><b>${listofteachers.subject.name}</small><br>
                                          <small class='text-muted'><b>${listofteachers.subject.type}</b>
                                          </small> 
                                          <hr>
                                         <input type="button" class="btn btn-success send-msg" value="Send Message" id="${listofteachers.teacher.id}"  />
                                       </div>
                                    </c:when>
                                 </c:choose>
                              </c:forEach>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-12 col-md-12">
                  <div class="card">
                     <ul class="nav nav-tabs">
                        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#Account">Account</a></li>
                     </ul>
                     <div class="tab-content">
                        <div class="tab-pane body active" id="about">
                           <table class="table table-bordered table-striped table-hover js-basic-example dataTable no-footer">
                              <tr>
                                 <th>Slot/Day</th>
                                 <th>Monday</th>
                                 <th>Tuesday</th>
                                 <th>Wednesday</th>
                                 <th>Thursday</th>
                                 <th>Friday</th>
                              </tr>
                              <tr>
                                 <td>1</td>
                                 <td>RMT</td>
                                 <td>vp</td>
                                 <td>DBMS</td>
                                 <td>SE</td>
                                 <td></td>
                              </tr>
                              <tr>
                                 <td>2</td>
                                 <td>VB</td>
                                 <td>DBMS</td>
                                 <td>RMT</td>
                                 <td>SE</td>
                                 <td>VB</td>
                              </tr>
                              <tr>
                                 <td>3</td>
                                 <td>SE</td>
                                 <td>LAB</td>
                                 <td>LAB</td>
                                 <td>LAB</td>
                                 <td>RMT</td>
                              </tr>
                              <tr>
                                 <td>4</td>
                                 <td>SE</td>
                                 <td>DBMS</td>
                                 <td>RMT</td>
                                 <td>DBMS</td>
                                 <td>RMT</td>
                              </tr>
                              <tr>
                                 <td>5</td>
                                 <td>LAB</td>
                                 <td>LAB</td>
                                 <td>LAB</td>
                                 <td>SE</td>
                                 <td>DBMS</td>
                              </tr>
                              <tr>
                                 <td>6</td>
                                 <td>VB</td>
                                 <td>RMT</td>
                                 <td>SE</td>
                                 <td>DBMS</td>
                                 <td>VB</td>
                           </table>
                        </div>
                        <div class="tab-pane body" id="Account">
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-lg-6 col-md-12">
                        <div class="card">
                           <div class="header">
                              <h2><strong>Recent</strong> Activity</h2>
                              <ul class="header-dropdown">
                                 <li class="remove">
                                    <a role="button" class="boxs-close"><i class="zmdi zmdi-close"></i></a>
                                 </li>
                              </ul>
                           </div>
                           <div class="body user_activity">
                              <div class="streamline b-accent">
                                 <div class="sl-item">
                                    <img class="user rounded-circle" src="assets/images/xs/avatar4.jpg" alt="">
                                    <div class="sl-content">
                                       <h5 class="m-b-0">Admin Birthday</h5>
                                       <small>Jan 21 <a href="javascript:void(0);" class="text-info">Sophia</a>.</small>
                                    </div>
                                 </div>
                                 <div class="sl-item">
                                    <img class="user rounded-circle" src="assets/images/xs/avatar5.jpg" alt="">
                                    <div class="sl-content">
                                       <h5 class="m-b-0">Add New Contact</h5>
                                       <small>30min ago <a href="javascript:void(0);">Alexander</a>.</small>
                                       <small><strong>P:</strong> +264-625-2323</small>
                                       <small><strong>E:</strong> maryamamiri@gmail.com</small>
                                    </div>
                                 </div>
                                 <div class="sl-item">
                                    <img class="user rounded-circle" src="assets/images/xs/avatar6.jpg" alt="">
                                    <div class="sl-content">
                                       <h5 class="m-b-0">General Surgery</h5>
                                       <small>Today <a href="javascript:void(0);">Grayson</a>.</small>
                                       <small>The standard chunk of Lorem Ipsum used since the 1500s is reproduced</small>
                                    </div>
                                 </div>
                                 <div class="sl-item">
                                    <img class="user rounded-circle" src="assets/images/xs/avatar7.jpg" alt="">
                                    <div class="sl-content">
                                       <h5 class="m-b-0">General Surgery</h5>
                                       <small>45min ago <a href="javascript:void(0);" class="text-info">Fidel Tonn</a>.</small>
                                       <small><strong>P:</strong> +264-625-2323</small>
                                       <small>The standard chunk of Lorem Ipsum used since the 1500s is reproduced</small>
                                    </div>
                                 </div>
                              </div>
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
                  <h4 class="title" id="defaultModalLabel">Generate Time Table</h4>
               </div>
               <div class="modal-body">
                  <div class="col-sm-12">
                     <div class="form-group">
                     </div>
                  </div>
                  <div class="col-sm-12">
                     <div class="form-group">
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