<!doctype html>
<html xmlns:th="http://www.thymeleaf.org">
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<meta name="description"
	content="Responsive Bootstrap 4 and web Application ui kit.">

<title>Teacher Dashboard :: MUET Timetable </title>
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
         
        	 var reciver_id=0;
        	 var  teacher_id=0;
        	 var  assign_subject_id=0;
        	 
         	
        	  	$('.send-msg').click(function(event){
        	    	//	$('#chat-btn').toggleClass("chat-launcher active");
        	    		//$('#chat').addClass("is-open pullUp");
        	    	 
				        //alert(event.target.id);
				        
				         reciver_id=event.target.id;
				       teacher_id=this.getAttribute("data-teacher");
				        assign_subject_id=this.getAttribute("data-assign-subject");
				      
						var admin_id="${admin_id}";
						
						
						
						
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
        	    					 
        	    					$.ajax({
                	    				
                	    				url:'notification/getConversation',
                	    				type:'post',
                	    				data:'assignsubject='+assign_subject_id,
                	    				
                	    				
                	    				success:function(msg){
											
                	    					var msg = JSON.parse(msg);	
											for (obj in msg){
												//
												if (msg[obj].reciverId==admin_id){
													//recive msgs
													all_msgs+="<li class='left float-left'  id='reciver' ><img "+
			        	    							"src='assets/images/xs/avatar3.jpg' class='rounded-circle' alt=''> "+
			        	    							"<div class='chat-info'>" +
			        	    								"<a class='name' href='javascript:void(0);'>"+msg[obj].senderName+"</a> <span"+
			        	    									" class='datetime'>"+msg[obj].datetime+"</span> <span class='message'>"+msg[obj].message+" </span> "+
			        	    							"</div>" +
			        	    						"</li>";													
												
													
													
												}
												else{
													
													all_msgs+="<li class='right'  id='sender' >"+
		        	    							"<div class='chat-info'>"+
		        	    								"<span class='datetime'>"+msg[obj].datetime+"</span> <span class='message'>"+
		        	    								msg[obj].message+
		        	    								"</span>"+
		        	    							"</div>"+
		        	    						"</li>";
													 
													
												}
											}
										//	alert(all_msgs);
											$('#all-msgs').html(all_msgs);
											
                	    				}
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
 	           		
 	    
 	           		
 	           		$.ajax({
 	           			url:'notification/save',
 	           			type:'post',
 	           			data:'assignsubject='+assign_subject_id+'&reciver=3'&description='+description,
 	           			
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
	<jsp:include page="teacher_common/header.jsp"></jsp:include>




	<jsp:include page="teacher_common/left-bar.jsp"></jsp:include>

	<!-- Right Sidebar -->

	<jsp:include page="teacher_common/right-bar.jsp"></jsp:include>


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
						DASHBOARD
					</h2>
				</div>
				
			</div>
		</div>
		<div class="container-fluid">

			
			
			
			        <div class="col-lg-12 col-md-12">
                <div class="row clearfix">
                    
               
                <div class="card student-list">
                    <div class="header">
                        <h2><strong>Subjects</strong><small>You are teaching this semester...</small></h2>
                        <ul class="header-dropdown">
                            <li class="remove">
                                <a role="button" class="boxs-close"><i class="zmdi zmdi-close"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="table-responsive">
                            <table class="table table-hover m-b-0">
                                <thead>
                                    <tr>
                                    <th>Message</th>
                                        <th>Subject Name</th>
                                        <th>Subject Type</th>
                                        <th>Batch</th>
                                        <th>Batch Section</th>
                                        <th>Semester</th>
                                        <th>Department</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                              <c:forEach items="${assign_subjects}" var="assignSubj">
                                  
                                  
                                    <tr>
                                    <td><input type="button" class="btn btn-success send-msg" value="Send Message" id="${assignSubj.teacher.user.id}"    data-teacher="${assignSubj.teacher.id}"  data-assign-subject="${assignSubj.id}"   /></td>
                                        <td>${assignSubj.subject.name}</td>
                                        <td>${assignSubj.subject.type}</td>
                                        <td>${assignSubj.batch.name}</td>
                                        <td>${assignSubj.section.name}</td>		
                                        <td>${assignSubj.semester.name}</td>     
                                        <td>${assignSubj.subject.dept.name}</td>
                                        
                                        
                                    </tr>
                                    
                                    						</c:forEach>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                 
                
                 <div class="card student-list">
                    <div class="header">
                        <h2><strong>Time Table</strong></h2>
                        <ul class="header-dropdown">
                            <li class="remove">
                                <a role="button" class="boxs-close"><i class="zmdi zmdi-close"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="table-responsive">
                            <table class="table table-hover m-b-0">
                                <thead>
                                    <tr>
                                        <th>Slots/Days</th>
                                        <th>Monday</th>
                                        <th>Tuesday</th>
                                        <th>Wednesday</th>
                                        <th>Thursday</th>
                                        <th>Friday</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>First</td>
                                        <td>SPM</td>
                                        <td>SP</td>
                                        <td style="background-color: blue;  color: white">SPM lab</td>
                                        <td style="background-color: blue; color: white">SPM Lab</td>
                                        <td style="background-color: blue; color: white">SPM Lab</td>
                                    </tr>
                                      <tr>
                                        <td>Second</td>
                                        <td>SPM</td>
                                        <td>SP</td>
                                        <td>SPM lab</td>
                                        <td>SPM Lab</td>                                       
                                        <td>SPM Lab</td>
                                    </tr>
                                      <tr>
                                        <td>Third</td>
                                        <td>SPM</td>
                                        <td>SP</td>
                                        <td>SPM lab</td>
                                        <td>SPM Lab</td>                                       
                                        <td>SPM Lab</td>
                                    </tr>
                                      <tr>
                                        <td>Fourth</td>
                                        <td style="background-color: orange;  color: white">SPM</td>
                                        <td>SP</td>
                                        <td>SPM lab</td>
                                        <td>SPM Lab</td>                                       
                                        <td>SPM Lab</td>
                                    </tr>
                                      <tr>
                                        <td>Fifth</td>
                                        <td>SPM</td>
                                        <td>SP</td>
                                        <td>SPM lab</td>
                                        <td>SPM Lab</td>                                       
                                        <td>SPM Lab</td>
                                    </tr>
                                      <tr>
                                        <td>Sixth</td>
                                        <td >SPM</td>
                                        <td style="background-color: cyan;  color: black">SP</td>
                                        <td>SPM lab</td>
                                        <td>SPM Lab</td>                                       
                                        <td>SPM Lab</td>
                                    </tr>
                                      <tr>
                                        <td>Seventh</td>
                                        <td>SPM</td>
                                        <td>SP</td>
                                        <td style="background-color: #f5f2d0;  color: black">SPM lab</td>
                                        <td style="background-color: #f5f2d0;  color: black">SPM Lab</td>                     
                                        <td style="background-color: #f5f2d0;  color: black">SPM Lab</td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
			
			
			
		</div>
	</section>


	






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