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

<title>Department Dashboard :: MUET Timetable</title>
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

var dept="${dept_id}";



$(document).ready(function(){
	
	$.ajax({
		
	
 	url:'teacher/getTotal', 
	type:'post',
	
	
	success:function(msg){
		
	$('#total_teacher').html(msg);
		
			
		} 
		


	});
	
	//SUBJECT
	$.ajax({
		
		
	 	url:'subject/getTotal', 
		type:'post',
		
		
		success:function(msg){
			
		$('#total_subject').html(msg);
			
				
			} 
			


		});
	
	
	//ROOM
	$.ajax({
		
		
	 	url:'classroom/getTotal', 
		type:'post',
		
		
		success:function(msg){
			
		$('#total_room').html(msg);
			
				
			} 
			


		});

	
 	
	
	
	
});

</script>


<script type="text/javascript">
      
      $(document).ready(function() {
          
     	 var reciver_id=0;
     	 var  teacher_id=0;
     	 var  assign_subject_id=0;
     	 var user_id="${user.id}";
    
     	 
      	
     	  	$('.send-msg').click(function(event){
     	    	//	$('#chat-btn').toggleClass("chat-launcher active");
     	    		//$('#chat').addClass("is-open pullUp");
     	    	 
				        //alert(event.target.id);
				        
				         reciver_id=event.target.id;
				       teacher_id=this.getAttribute("data-teacher");
				        assign_subject_id=this.getAttribute("data-assign-subject");
				      alert(teacher_id);

     	    		//addClass
     	    		var all_msgs="";
     	    		var teacher_name="";
     	    		$.ajax({
     	    				
     	    				url:'teacher/get',
     	    				type:'post',
     	    				data:'id='+teacher_id,
     	    				success:function(msg){
     	    					teacher_name=msg.name;
     	    					$('#teacher-name').text(teacher_name);
     	    					 alert('ok');
     	    					$.ajax({
             	    				
             	    				url:'notification/getConversation',
             	    				type:'post',
             	    				data:'assignsubject='+assign_subject_id,
             	    				success:function(msg){
											
											
											for (obj in msg){
												//
												if (msg[obj].sender.id==3){
													
											all_msgs+="<li class='right'  id='sender' >"+
		        	    							"<div class='chat-info'>"+
		        	    								"<span class='datetime'>"+msg[obj].datetime+"</span> <span class='message'>"+
		        	    								msg[obj].description+
		        	    								"</span>"+
		        	    							"</div>"+
		        	    						"</li>";
													
													
												}
												else{
													//recive msgs
												all_msgs+="<li class='left float-left'  id='reciver' ><img "+
		        	    							"src='assets/images/xs/avatar3.jpg' class='rounded-circle' alt=''> "+
		        	    							"<div class='chat-info'>" +
		        	    								"<a class='name' href='javascript:void(0);'>"+teacher_name+"</a> <span"+
		        	    									" class='datetime'>"+msg[obj].datetime+"</span> <span class='message'>"+msg[obj].description+" </span> "+
		        	    							"</div>" +
		        	    						"</li>"; 
													
												}
											}
										//	alert(all_msgs);
											$('#all-msgs').html(all_msgs);
											
             	    				},
             	    				
     	    					});
     	    					
     	    					
     	    					
     	    					
     	    					
     	    					$('#chating-area').toggleClass(" is-open pullUp");
     	    					
     	    					$('#chk').toggleClass("btn-success");
     	    					$('#chk').text("working");
     	    					
     	    					
     	    					
     	    					
     	    					
     	    					
     	    					

     	    					
     	    				},
     	    				error:function(){
     	    					
     	    				}
     	    				
     	    				
     	    			}); //ajax closed
     	    			

     	        
     	    		});
     	  	
     	  	var description="";
     	  	 $('#send').click(function(event){
	           		 
	           		//assign_subject_id;
	           		
	           		
	           		var receiver=reciver_id;
	           		description=$('#msg').val();
	           		
	           		if ($("#requestforslots").prop("checked")==true){
	           			
	           			description+=" <br> <a href='slots?id=' >Request For Slots</a>";
	           			
	           			
	           			$.ajax({
	 	           			url:'requestslots/save',
	 	           			type:'post',
	 	           			data:'assignSubject='+assign_subject_id+'&user='+receiver+'&sender=3',
	 	           			
	 	           			success:function(msg){
	 	           				alert("added");
	 	           				
	 	           			}
	           			
	           			});
		
	           			
	           			
	           		}
	           		
	           		$.ajax({
	           			url:'notification/save',
	           			type:'post',
	           			data:'assignsubject='+assign_subject_id+'&reciver='+receiver+'&description='+description,
	           			
	           			success:function(msg){
	           				//alert(msg);
	           				var text="<li class='right'  id='sender' >"+
		        	    							"<div class='chat-info'>"+
		        	    								"<span class='datetime'>Just Now</span> <span class='message'>"+
		        	    								description+
		        	    								"</span>"+
		        	    							"</div>"+
		        	    						"</li>";
	           				$('#all-msgs').append(text);
	           				
	                   		$('#msg').val("");
	           			}
	           			
	           		});
	           		 
	           	 });
     	    		
     	    	
     	    		
     	    		
     	    		
     	    		
     	    		
     	    		
     	    		
     	    	});

      	
      	
      	
      		
     // }); // ready end
      
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
	<div class="chat-wrapper" id="chating-area" >
		<div class='card'>
			<div class='header'>
				<ul class='list-unstyled team-info margin-0' id="check ">
					<li class='m-r-15' ><h2 id="teacher-name" >Sir Salah ok </h2></li>
					
				</ul>
			</div>
			<div class='body'>
				<div class='chat-widget' style=" width: auto; height: 300px;display: flex; flex-direction: column-reverse;overflow: auto;">
					<ul class='chat-scroll-list clearfix' id="all-msgs">
					
						
						
					
					</ul>
				</div>
				<div class='input-group p-t-10' >
				<b>Request for slots</b>
					<input type="checkbox" class="form-control " value="Request for slots"
						  id="requestforslots" >
						  <hr>
						  </div>
				<div class='input-group p-t-15'>
				
			
					<input type='text' class='form-control'
						placeholder='Enter text here...'  id='msg' > <span
						class='input-group-addon'> <a id='send' href="#"> <i class='zmdi zmdi-mail-send' ></i></a>
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
                                <div class="icon xl-slategray"><i class="zmdi zmdi-account-o"></i> </div>
                                <div class="content">
                                    <div class="text">Total Teachers</div>
                                    <div id="total_teacher"    style="font-size:30px"    > </div>
                                       
                                    
                                </div>
                            </div>                    
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="card top_counter">
                            <div class="body">
                                <div class="icon xl-slategray"><i class="zmdi zmdi-graduation-cap"></i> </div>
                                <div class="content">
                                    <div class="text">Total Subjects</div>
                                               <div id="total_subject"    style="font-size:30px"    > </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="card top_counter">
                            <div class="body">
                                <div class="icon xl-slategray"><i class="zmdi zmdi-label"></i> </div>
                                <div class="content">
                                    <div class="text">Labs and Rooms</div>
                                     <div id="total_room"    style="font-size:30px"    > </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <c:forEach items="${teachers}" var="teacher"> 
                    
                    
                    <div class="col-lg-4 col-md-4 col-sm-4">
                <div class="card member-card bg-dark">
                 
                    
                   
                        <h4 class="m-t-10 col-white">${teacher.name} </h4>
                       
                       
                    
                    <div class="body">
                        
                        <hr>
                        
                        <strong class="text-muted">Email ID</strong>
                        <p class="col-white">${teacher.email}</p>
                        <strong class="text-muted">Phone</strong>
                        <p class="col-white">${teacher.contact}</p>
                        
                        <hr>
                          
					                          
                        <strong class="text-muted">Current Subjects</strong>
                      
                        <address class="col-white"> </address>
                       
                        
                         
                        <hr>
                          
                        <strong class="text-muted">Current Subjects</strong>
                        <c:forEach items="${assignsubjects}" var="ass">
                        <c:choose>
                        	<c:when test="${teacher.id==ass.teacher.id}">
                       			 <address class="col-white">${ass.subject.code}(${ass.subject.type}) ---(${ass.section.name})</address>
                       			   <a href="#" class="btn btn-success send-msg"  id="${teacher.id}"    data-teacher="${teacher.id}"  data-assign-subject="${ass.id}" ><i class="material-icons">chat</i></a>
                       			   
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