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
      <title>Time Table Generation:: MUET Timetable</title>
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
      
      <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">
	
	
	 <script src="/assets/js/jquery.min.js"></script>
	<script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
      
      
      
     
      
      
      
      
      
      
      <script type="text/javascript">
      
      $(document).ready(function() {
          
     	 var reciver_id=0;
     	 var  teacher_id=0;
     	 var  assign_subject_id=0;
     	 var user_id= "${user.id}";
     

     	  	$('.send-msg').click(function(event){
     	  		
     	  		 reciver_id=this.getAttribute("id");
     	  	
     	    	
     	    	       
				       teacher_id=this.getAttribute("data-teacher");
				        assign_subject_id=this.getAttribute("data-assign-subject");
				    //  alert(teacher_id);
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
											
             	    					var obj = JSON.parse(msg);

             	    					
											for (x in  obj){
												//
											
												if (obj[x].senderId==admin_id){
													
											all_msgs+="<li class='right'  id='sender' >"+
		        	    							"<div class='chat-info'>"+
		        	    								"<span class='datetime'>"+obj[x].datetime+"</span> <span class='message'>"+
		        	    								obj[x].message+
		        	    								"</span>"+
		        	    							"</div>"+
		        	    						"</li>";
													
													
												}
												else{
													//recive msgs
												all_msgs+="<li class='left'  id='reciver' ><img "+
		        	    							"src='assets/images/xs/avatar3.jpg' class='rounded-circle' alt=''> "+
		        	    							"<div class='chat-info'>" +
		        	    								"<a class='name' href='javascript:void(0);'>"+teacher_name+"</a> <span"+
		        	    									" class='datetime'>"+obj[x].datetime+"</span> <span class='message'>"+obj[x].message+" </span> "+
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
	 	           			data:'assignSubject='+assign_subject_id+'&user='+receiver+'&sender='+user_id,
	 	           			
	 	           			success:function(msg){
	 	           				
	 	           			$('#requestforslots').prop('checked', false); // Unchecks it

	 	           				
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

      
      
      	<style type="text/css">
		.left{
			width:120px;
			float:left;
		}
		.left table{
			background:#144a6e;
		}
		.left td{
			background:#ffffff;
		}
		.right{
			float:right;
			width:570px;
			margin-top:110px;
			
		}
		.right table{
			background:#144a6e;
			width:100%;
		}
		.right td{
			background:#fafafa;
			color:#444;
			text-align:center;
			padding:8px;
		}
		.right td{
			background:#E0ECFF;
		}
		.right td.drop{
			background:#fafafa;
			width:100px;
		}
		.right td.over{
			background:#FBEC88;
		}
		
		.assigneding{
			border:1px solid #BC2A4D;
		}
		.trash{
			background-color:red;
		}
		/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
//  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  border: 1px solid #888;
  width: 80%;
  height:40%;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
  -webkit-animation-name: animatetop;
  -webkit-animation-duration: 0.4s;
  animation-name: animatetop;
  animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
  from {top:-300px; opacity:0} 
  to {top:0; opacity:1}
}

@keyframes animatetop {
  from {top:-300px; opacity:0}
  to {top:0; opacity:1}
}

/* The Close Button */
.close {
  color: white;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}



.modal-body {padding: 10px 16px;}


	</style>
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
      
      
      

<!-- The Modal -->
<div id="myModal" class="modal"  style="z-index:13; opacity:0.95">

  <!-- Modal content -->
  <div class="modal-content">
    
    <div class="modal-body">
    <span class="close"  style="color:red">&times;</span>
     
    
    
   <table border="1" style=" border: 3px solid #73AD21;">
		
		
				 <tr>
					<td >Section 2</td>
					<td >08:00</td>
					<td >09:00</td>
					<td >10:00</td>
					<td >11:00</td>
					<td >12:00</td>
					<td >01:00</td>
					<td >02:00</td>
				
					
				</tr>
				<tr>
					<td >Monday</td>
					
					
					 <c:forEach items="${listoftimeslots}" var="listoftimeslots"> <!-- List of time slots dialy -->
					  
					 	<c:choose>
                             <c:when test="${listoftimeslots.day.id == 1}"> <!-- One == MONDAY -->
                             
                             
								<c:forEach begin="1" end="${listoftimeslots.totalSlots  }" varStatus="loop">
									
									<c:set var = "allocated"  value = "true"/><!-- Logic for allocation -->
									
									<c:forEach items="${timetablewithoutclass}" var="timetablewithoutclass">
									
									
								
									
									
									     
  									 
									
									
									
										<c:choose>
										
										
										
                             				<c:when test="${ (timetablewithoutclass.day.id == 1)  && (timetablewithoutclass.timeslot.id == loop.index) && (4 == timetablewithoutclass.assignsubject.section.id )  && (batch_id == timetablewithoutclass.assignsubject.batch.id ) && (semester_id == timetablewithoutclass.assignsubject.semester.id ) }">
                             				<!-- Validated the Commited -->
									
                             				
                             				
                             						
                             							<td    >${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type}) </td>
                             							
                             							
                             							<c:set var = "allocated"  value = "false"/>
                             							
                             				
    											
    											
    										</c:when>
    									</c:choose>
    								</c:forEach>
									
									<c:if test="${allocated}">
										<td ></td>	
									</c:if>
									
								</c:forEach>
                       	       
                           	</c:when>
                        </c:choose>        
                                 
                                 
                    	
                    </c:forEach>
					
				</tr>
				
				
				<tr>
					<td >Tuesday</td>
					
					
					 <c:forEach items="${listoftimeslots}" var="listoftimeslots"> <!-- List of time slots dialy -->
					  
					 	<c:choose>
                             <c:when test="${listoftimeslots.day.id == 2}"> 
                             
                             
								<c:forEach begin="1" end="${listoftimeslots.totalSlots  }" varStatus="loop">
									
									<c:set var = "allocated"  value = "true"/><!-- Logic for allocation -->
									
									<c:forEach items="${timetablewithoutclass}" var="timetablewithoutclass">
									
									
								
									
									
									     
  									 
									
									
									
										<c:choose>
										
										
										
                             				<c:when test="${ (timetablewithoutclass.day.id == 2)  && (timetablewithoutclass.timeslot.id == loop.index) && (4 == timetablewithoutclass.assignsubject.section.id )  && (batch_id == timetablewithoutclass.assignsubject.batch.id ) && (semester_id == timetablewithoutclass.assignsubject.semester.id ) }">
                             				<!-- Validated the Commited -->
									
                             				
                             				
                             						
                             							<td    >${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type}) </td>
                             							
                             							
                             							<c:set var = "allocated"  value = "false"/>
                             							
                             				
    											
    											
    										</c:when>
    									</c:choose>
    								</c:forEach>
									
									<c:if test="${allocated}">
										<td ></td>	
									</c:if>
									
								</c:forEach>
                       	       
                           	</c:when>
                        </c:choose>        
                                 
                                 
                    	
                    </c:forEach>
					
				</tr>
				
				
					<tr>
					<td >Wednesday</td>
					
					
					 <c:forEach items="${listoftimeslots}" var="listoftimeslots"> <!-- List of time slots dialy -->
					  
					 	<c:choose>
                             <c:when test="${listoftimeslots.day.id == 3}"> 
                             
                             
								<c:forEach begin="1" end="${listoftimeslots.totalSlots  }" varStatus="loop">
									
									<c:set var = "allocated"  value = "true"/><!-- Logic for allocation -->
									
									<c:forEach items="${timetablewithoutclass}" var="timetablewithoutclass">
									
									
								
									
									
									     
  									 
									
									
									
										<c:choose>
										
										
										
                             				<c:when test="${ (timetablewithoutclass.day.id == 3)  && (timetablewithoutclass.timeslot.id == loop.index) && (4 == timetablewithoutclass.assignsubject.section.id )  && (batch_id == timetablewithoutclass.assignsubject.batch.id ) && (semester_id == timetablewithoutclass.assignsubject.semester.id ) }">
                             				<!-- Validated the Commited -->
									
                             				
                             				
                             						
                             							<td    >${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type}) </td>
                             							
                             							
                             							<c:set var = "allocated"  value = "false"/>
                             							
                             				
    											
    											
    										</c:when>
    									</c:choose>
    								</c:forEach>
									
									<c:if test="${allocated}">
										<td ></td>	
									</c:if>
									
								</c:forEach>
                       	       
                           	</c:when>
                        </c:choose>        
                                 
                                 
                    	
                    </c:forEach>
					
				</tr>
				
					<tr>
					<td >Thursday</td>
					
					
					 <c:forEach items="${listoftimeslots}" var="listoftimeslots"> <!-- List of time slots dialy -->
					  
					 	<c:choose>
                             <c:when test="${listoftimeslots.day.id == 4}"> 
                             
                             
								<c:forEach begin="1" end="${listoftimeslots.totalSlots  }" varStatus="loop">
									
									<c:set var = "allocated"  value = "true"/><!-- Logic for allocation -->
									
									<c:forEach items="${timetablewithoutclass}" var="timetablewithoutclass">
									
									
								
									
									
									     
  									 
									
									
									
										<c:choose>
										
										
										
                             				<c:when test="${ (timetablewithoutclass.day.id == 4)  && (timetablewithoutclass.timeslot.id == loop.index) && (4 == timetablewithoutclass.assignsubject.section.id )  && (batch_id == timetablewithoutclass.assignsubject.batch.id ) && (semester_id == timetablewithoutclass.assignsubject.semester.id ) }">
                             				<!-- Validated the Commited -->
									
                             				
                             				
                             						
                             							<td    >${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type}) </td>
                             							
                             							
                             							<c:set var = "allocated"  value = "false"/>
                             							
                             				
    											
    											
    										</c:when>
    									</c:choose>
    								</c:forEach>
									
									<c:if test="${allocated}">
										<td ></td>	
									</c:if>
									
								</c:forEach>
                       	       
                           	</c:when>
                        </c:choose>        
                                 
                                 
                    	
                    </c:forEach>
					
				</tr>
				
					<tr>
					<td >Friday</td>
					
					
					 <c:forEach items="${listoftimeslots}" var="listoftimeslots"> <!-- List of time slots dialy -->
					  
					 	<c:choose>
                             <c:when test="${listoftimeslots.day.id == 5}"> 
                             
                             
								<c:forEach begin="1" end="${listoftimeslots.totalSlots  }" varStatus="loop">
									
									<c:set var = "allocated"  value = "true"/><!-- Logic for allocation -->
									
									<c:forEach items="${timetablewithoutclass}" var="timetablewithoutclass">
									
									
								
									
									
									     
  									 
									
									
									
										<c:choose>
										
										
										
                             				<c:when test="${ (timetablewithoutclass.day.id == 5)  && (timetablewithoutclass.timeslot.id == loop.index) && (4 == timetablewithoutclass.assignsubject.section.id )  && (batch_id == timetablewithoutclass.assignsubject.batch.id ) && (semester_id == timetablewithoutclass.assignsubject.semester.id ) }">
                             				<!-- Validated the Commited -->
									
                             				
                             				
                             						
                             							<td    >${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type}) </td>
                             							
                             							
                             							<c:set var = "allocated"  value = "false"/>
                             							
                             				
    											
    											
    										</c:when>
    									</c:choose>
    								</c:forEach>
									
									<c:if test="${allocated}">
										<td ></td>	
									</c:if>
									
								</c:forEach>
                       	       
                           	</c:when>
                        </c:choose>        
                                 
                                 
                    	
                    </c:forEach>
					
				</tr>
			
			
			
				
				
				
							
			</table>
			
			
			
			
			
			 
   <table border="1" style=" border: 3px solid #73AD21;">
		
		
				 <tr>
					<td >Section 2</td>
					<td >08:00</td>
					<td >09:00</td>
					<td >10:00</td>
					<td >11:00</td>
					<td >12:00</td>
					<td >01:00</td>
					<td >02:00</td>
				
					
				</tr>
				<tr>
					<td >Monday</td>
					
					
					 <c:forEach items="${listoftimeslots}" var="listoftimeslots"> <!-- List of time slots dialy -->
					  
					 	<c:choose>
                             <c:when test="${listoftimeslots.day.id == 1}"> <!-- One == MONDAY -->
                             
                             
								<c:forEach begin="1" end="${listoftimeslots.totalSlots  }" varStatus="loop">
									
									<c:set var = "allocated"  value = "true"/><!-- Logic for allocation -->
									
									<c:forEach items="${timetablewithoutclass}" var="timetablewithoutclass">
									
									
								
									
									
									     
  									 
									
									
									
										<c:choose>
										
										
										
                             				<c:when test="${ (timetablewithoutclass.day.id == 1)  && (timetablewithoutclass.timeslot.id == loop.index) && (4 == timetablewithoutclass.assignsubject.section.id )  && (batch_id == timetablewithoutclass.assignsubject.batch.id ) && (semester_id == timetablewithoutclass.assignsubject.semester.id ) }">
                             				<!-- Validated the Commited -->
									
                             				
                             				
                             						
                             							<td    >${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type}) </td>
                             							
                             							
                             							<c:set var = "allocated"  value = "false"/>
                             							
                             				
    											
    											
    										</c:when>
    									</c:choose>
    								</c:forEach>
									
									<c:if test="${allocated}">
										<td ></td>	
									</c:if>
									
								</c:forEach>
                       	       
                           	</c:when>
                        </c:choose>        
                                 
                                 
                    	
                    </c:forEach>
					
				</tr>
				
				
				<tr>
					<td >Tuesday</td>
					
					
					 <c:forEach items="${listoftimeslots}" var="listoftimeslots"> <!-- List of time slots dialy -->
					  
					 	<c:choose>
                             <c:when test="${listoftimeslots.day.id == 2}"> 
                             
                             
								<c:forEach begin="1" end="${listoftimeslots.totalSlots  }" varStatus="loop">
									
									<c:set var = "allocated"  value = "true"/><!-- Logic for allocation -->
									
									<c:forEach items="${timetablewithoutclass}" var="timetablewithoutclass">
									
									
								
									
									
									     
  									 
									
									
									
										<c:choose>
										
										
										
                             				<c:when test="${ (timetablewithoutclass.day.id == 2)  && (timetablewithoutclass.timeslot.id == loop.index) && (4 == timetablewithoutclass.assignsubject.section.id )  && (batch_id == timetablewithoutclass.assignsubject.batch.id ) && (semester_id == timetablewithoutclass.assignsubject.semester.id ) }">
                             				<!-- Validated the Commited -->
									
                             				
                             				
                             						
                             							<td    >${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type}) </td>
                             							
                             							
                             							<c:set var = "allocated"  value = "false"/>
                             							
                             				
    											
    											
    										</c:when>
    									</c:choose>
    								</c:forEach>
									
									<c:if test="${allocated}">
										<td ></td>	
									</c:if>
									
								</c:forEach>
                       	       
                           	</c:when>
                        </c:choose>        
                                 
                                 
                    	
                    </c:forEach>
					
				</tr>
				
				
					<tr>
					<td >Wednesday</td>
					
					
					 <c:forEach items="${listoftimeslots}" var="listoftimeslots"> <!-- List of time slots dialy -->
					  
					 	<c:choose>
                             <c:when test="${listoftimeslots.day.id == 3}"> 
                             
                             
								<c:forEach begin="1" end="${listoftimeslots.totalSlots  }" varStatus="loop">
									
									<c:set var = "allocated"  value = "true"/><!-- Logic for allocation -->
									
									<c:forEach items="${timetablewithoutclass}" var="timetablewithoutclass">
									
									
								
									
									
									     
  									 
									
									
									
										<c:choose>
										
										
										
                             				<c:when test="${ (timetablewithoutclass.day.id == 3)  && (timetablewithoutclass.timeslot.id == loop.index) && (4 == timetablewithoutclass.assignsubject.section.id )  && (batch_id == timetablewithoutclass.assignsubject.batch.id ) && (semester_id == timetablewithoutclass.assignsubject.semester.id ) }">
                             				<!-- Validated the Commited -->
									
                             				
                             				
                             						
                             							<td    >${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type}) </td>
                             							
                             							
                             							<c:set var = "allocated"  value = "false"/>
                             							
                             				
    											
    											
    										</c:when>
    									</c:choose>
    								</c:forEach>
									
									<c:if test="${allocated}">
										<td ></td>	
									</c:if>
									
								</c:forEach>
                       	       
                           	</c:when>
                        </c:choose>        
                                 
                                 
                    	
                    </c:forEach>
					
				</tr>
				
					<tr>
					<td >Thursday</td>
					
					
					 <c:forEach items="${listoftimeslots}" var="listoftimeslots"> <!-- List of time slots dialy -->
					  
					 	<c:choose>
                             <c:when test="${listoftimeslots.day.id == 4}"> 
                             
                             
								<c:forEach begin="1" end="${listoftimeslots.totalSlots  }" varStatus="loop">
									
									<c:set var = "allocated"  value = "true"/><!-- Logic for allocation -->
									
									<c:forEach items="${timetablewithoutclass}" var="timetablewithoutclass">
									
									
								
									
									
									     
  									 
									
									
									
										<c:choose>
										
										
										
                             				<c:when test="${ (timetablewithoutclass.day.id == 4)  && (timetablewithoutclass.timeslot.id == loop.index) && (4 == timetablewithoutclass.assignsubject.section.id )  && (batch_id == timetablewithoutclass.assignsubject.batch.id ) && (semester_id == timetablewithoutclass.assignsubject.semester.id ) }">
                             				<!-- Validated the Commited -->
									
                             				
                             				
                             						
                             							<td    >${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type}) </td>
                             							
                             							
                             							<c:set var = "allocated"  value = "false"/>
                             							
                             				
    											
    											
    										</c:when>
    									</c:choose>
    								</c:forEach>
									
									<c:if test="${allocated}">
										<td ></td>	
									</c:if>
									
								</c:forEach>
                       	       
                           	</c:when>
                        </c:choose>        
                                 
                                 
                    	
                    </c:forEach>
					
				</tr>
				
					<tr>
					<td >Friday</td>
					
					
					 <c:forEach items="${listoftimeslots}" var="listoftimeslots"> <!-- List of time slots dialy -->
					  
					 	<c:choose>
                             <c:when test="${listoftimeslots.day.id == 5}"> 
                             
                             
								<c:forEach begin="1" end="${listoftimeslots.totalSlots  }" varStatus="loop">
									
									<c:set var = "allocated"  value = "true"/><!-- Logic for allocation -->
									
									<c:forEach items="${timetablewithoutclass}" var="timetablewithoutclass">
									
									
								
									
									
									     
  									 
									
									
									
										<c:choose>
										
										
										
                             				<c:when test="${ (timetablewithoutclass.day.id == 5)  && (timetablewithoutclass.timeslot.id == loop.index) && (4 == timetablewithoutclass.assignsubject.section.id )  && (batch_id == timetablewithoutclass.assignsubject.batch.id ) && (semester_id == timetablewithoutclass.assignsubject.semester.id ) }">
                             				<!-- Validated the Commited -->
									
                             				
                             				
                             						
                             							<td    >${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type}) </td>
                             							
                             							
                             							<c:set var = "allocated"  value = "false"/>
                             							
                             				
    											
    											
    										</c:when>
    									</c:choose>
    								</c:forEach>
									
									<c:if test="${allocated}">
										<td ></td>	
									</c:if>
									
								</c:forEach>
                       	       
                           	</c:when>
                        </c:choose>        
                                 
                                 
                    	
                    </c:forEach>
					
				</tr>
			
			
			
				
				
				
							
			</table>
     
     
     
    </div>
    
  </div>

</div>
      
      

      
      
      
      
	
	<!-- Chat-launcher -->
	<div class="chat-wrapper" id="chating-area" >
		<div class='card'>
			<div class='header'>
				<ul class='list-unstyled team-info margin-0' id="check ">
					<li class='m-r-15' ><h2 id="teacher-name" ></h2></li>
					
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
						class='input-group-addon'> <a href="#" id='send'> <i class='zmdi zmdi-mail-send' id='send'></i></a>
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
                     TIME TABLE GENERATION 
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
                          
                          
                           <div class="col-lg-2 col-md-2 col-2">
                              
                                 <input type="button" id="commit"  class="btn btn-success" value="Commit" > 
                                 
                                 <input type="button" id="uncommit"  class="btn btn-success" value="Un Commit" >
                                  
                              
                              
                           </div>
                           
                           <div class="col-lg-2 col-md-2 col-2">
                              
                                 <input type="button" id="publish"     class="btn btn-primary" value="Publish" > 
                                  
                              
                              
                           </div>
                           <div class="col-lg-2 col-md-2 col-2">
                           <input type="button" id="send_notify"   class="btn btn-info" value="Send Notification to Teachers" />
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
                           <h6>Subjects</h6>
                           
                          Type: <span style="width:15px;height:15px;border:2px solid black;background:rgba(3, 169, 244, 0.42)" >THEORY</span>
                           <span style="width:15px;height:15px;border:2px solid black;background:#00800026" >PRACTICAL</span>
                           
                           <div id="teacherdata">
                           	<div class="left">
                   
			<table class="table table-bordered table-striped table-hover js-basic-example dataTable no-footer">
				                <c:forEach items="${listofteachers}" var="listofteachers">
				                 
                                 <c:choose>
                                    <c:when test="${listofteachers.subject.type == 'Theory'}">
                                    
                 
                                   
				<tr>
				
					<td >
					
					<b>Teacher :</b><u><b  id="teacher-name${listofteachers.id}">${listofteachers.teacher.name} </b></u><br> 
					
					 <b style="font-size: 10px;" id="subject-type${listofteachers.id}">${listofteachers.subject.type} </b>
					(<b style="font-size: 10px;">CH :</b><b id="credit-hour${listofteachers.id}">${listofteachers.subject.credit_hour} </b>)
					
					<div style="border: 3px dotted black">
						<div style='background:#03a9f46b;padding:2px' class="item subject" id="${listofteachers.id}" code="${listofteachers.subject.code}"  credit_hour="${listofteachers.subject.credit_hour}"   >${listofteachers.subject.code}  </div>
						
					</div>
					<a href="#" class="btn btn-success send-msg"  id="${listofteachers.teacher.user.id}"    data-teacher="${listofteachers.teacher.id}"  data-assign-subject="${listofteachers.id}" ><i class="material-icons">chat</i></a>	
					<%-- 	  <input type="button" class="btn btn-success send-msg" value="Send Message" id="${listofteachers.teacher.user.id}"    data-teacher="${listofteachers.teacher.id}"  data-assign-subject="${listofteachers.id}"   /> --%>
					
					</td>
				</tr>
                     
                                    </c:when>
                                 </c:choose>
                              </c:forEach>
                              <c:forEach items="${listofteachers}" var="listofteachers">
                                 <c:choose>
                                    <c:when test="${listofteachers.subject.type == 'Practical'}">
                         
				<tr>
				
					<td >
					 <b>Teacher :</b><u><b id="teacher-name${listofteachers.id}">${listofteachers.teacher.name} </b></u> </br>
					 <b id="subject-type${listofteachers.id}">${listofteachers.subject.type} </b>
					(<b>CH :</b><b id="credit-hour${listofteachers.id}">${listofteachers.subject.credit_hour} </b>) 
					
					
						<div style="border: 3px dotted black">
						<div style='background:#00800026' class="item subject" id="${listofteachers.id}" code="${listofteachers.subject.code}"  credit_hour="${listofteachers.subject.credit_hour}"   >${listofteachers.subject.code}  </div>
						</div>
							<a href="#" class="btn btn-success send-msg"  id="${listofteachers.teacher.user.id}"    data-teacher="${listofteachers.teacher.id}"  data-assign-subject="${listofteachers.id}" ><i class="material-icons">chat</i></a>
						
					
					</td>
				</tr>
                                    
                                      
                                    </c:when>
                                 </c:choose>
                              </c:forEach>
                              
				
				
			</table>
			
		</div>
		
        
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               
               
               
        
                    <div class="right">
                    <input type ="button" value="Random Allocation" id="randomAllocation" class="btn btn-success"  style="display:inline-block" />
                    <input type ="button" value="Clear" id="clear" class="btn btn-success"  style="display:none" />
                      <button type="button" class="btn btn-info " id="myBtn"  style="float:right" >View Others</button>
                    
                    
			<table class="table table-bordered table-striped table-hover js-basic-example dataTable no-footer"
			 style=" position: fixed;
  
  width: 70px;
  border: 3px solid #73AD21;">
		
		
				 <tr>
					<td ></td>
					<td >08:00</td>
					<td >09:00</td>
					<td >10:00</td>
					<td >11:00</td>
					<td >12:00</td>
					<td >01:00</td>
					<td >02:00</td>
				
					
				</tr>
				<tr>
					<td >Monday</td>
					
					
					 <c:forEach items="${listoftimeslots}" var="listoftimeslots"> <!-- List of time slots dialy -->
					  
					 	<c:choose>
                             <c:when test="${listoftimeslots.day.id == 1}"> <!-- One == MONDAY -->
                             
                             
								<c:forEach begin="1" end="${listoftimeslots.totalSlots  }" varStatus="loop">
									
									<c:set var = "allocated"  value = "true"/><!-- Logic for allocation -->
									
									<c:forEach items="${timetablewithoutclass}" var="timetablewithoutclass">
									
									<c:set value="${timetablewithoutclass.commited}" var="commited"/>
								
									
									
									     
  									 
									
									
									
										<c:choose>
										
										
										
                             				<c:when test="${ (timetablewithoutclass.day.id == 1)  && (timetablewithoutclass.timeslot.id == loop.index) && (section_id == timetablewithoutclass.assignsubject.section.id )  && (batch_id == timetablewithoutclass.assignsubject.batch.id ) && (semester_id == timetablewithoutclass.assignsubject.semester.id ) }">
                             				<!-- Validated the Commited -->
									<c:if test="${commited eq 1}">
									
 										<script>$('#commit').css("display","none");</script>
 										<script>$('#randomAllocation').css("display","none");</script>
									</c:if>
                             				
                             				
                             					<c:choose>
                             						<c:when test="${ (timetablewithoutclass.approvedByTeacher == 1)  }">
                             							<td   style="border: 2px solid blue" class="${timetablewithoutclass.assignsubject.subject.code } assigned slots" id="assigned_${listoftimeslots.day.id}_${loop.index}_${timetablewithoutclass.assignsubject.id}"  ><b> ${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type}) </b></td>
                             							<c:set var = "allocated"  value = "false"/>	
                             						</c:when>
                             						<c:otherwise>
                             							<td  timetableid="${timetablewithoutclass.id}"   class="${timetablewithoutclass.assignsubject.subject.code } assigned slots" id="assigned_${listoftimeslots.day.id}_${loop.index}_${timetablewithoutclass.assignsubject.id}"  >${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type}) </td>
                             							
                             							
                             							<c:set var = "allocated"  value = "false"/>
                             							
                             						</c:otherwise>
                             					</c:choose>
    											
    											
    										</c:when>
    									</c:choose>
    								</c:forEach>
									
									<c:if test="${allocated}">
										<td id="unassigned_${listoftimeslots.day.id}_${loop.index}" class="drop slots"></td>	
									</c:if>
									
								</c:forEach>
                       	       
                           	</c:when>
                        </c:choose>        
                                 
                                 
                    	
                    </c:forEach>
					
				</tr>
				<tr>
					<td >Tuesday</td>
					 	 <c:forEach items="${listoftimeslots}" var="listoftimeslots"> <!-- List of time slots dialy -->
					 
					 	<c:choose>
                             <c:when test="${listoftimeslots.day.id == 2}"> <!-- TWO == TUESDAY -->
                             
                             
								<c:forEach begin="1" end="${listoftimeslots.totalSlots  }" varStatus="loop">
									
									<c:set var = "allocated"  value = "true"/><!-- Logic for allocation -->
									
										<c:forEach items="${timetablewithoutclass}" var="timetablewithoutclass">
										<c:choose>
                             				<c:when test="${ (timetablewithoutclass.day.id == 2)  && (timetablewithoutclass.timeslot.id == loop.index) && (section_id == timetablewithoutclass.assignsubject.section.id )  && (batch_id == timetablewithoutclass.assignsubject.batch.id ) && (semester_id == timetablewithoutclass.assignsubject.semester.id ) }">
    											<c:choose>
                             						<c:when test="${ (timetablewithoutclass.approvedByTeacher == 1)  }">
                             							<td   style="border: 2px solid blue" class="${timetablewithoutclass.assignsubject.subject.code } assigned slots" id="assigned_${listoftimeslots.day.id}_${loop.index}_${timetablewithoutclass.assignsubject.id}"  ><b> ${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type})</b></td>
                             							<c:set var = "allocated"  value = "false"/>	
                             						</c:when>
                             						<c:otherwise>
                             							<td  timetableid="${timetablewithoutclass.id}"  class="${timetablewithoutclass.assignsubject.subject.code } assigned slots" id="assigned_${listoftimeslots.day.id}_${loop.index}_${timetablewithoutclass.assignsubject.id}"  >${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type})</td>
                             							<c:set var = "allocated"  value = "false"/>
                             						</c:otherwise>
                             					</c:choose>
                             				</c:when>
    									</c:choose>
    									
    								</c:forEach>
									
									<c:if test="${allocated}">
										<td id="unassigned_${listoftimeslots.day.id}_${loop.index}" class="drop slots"></td>	
									</c:if>
									
								</c:forEach>
                       	       
                           	</c:when>
                        </c:choose>        
                                 
                                 
                    	
                    </c:forEach>
				</tr>
				<tr>
					<td >Wednesday</td>
						 	 <c:forEach items="${listoftimeslots}" var="listoftimeslots"> <!-- List of time slots dialy -->
					 
					 	<c:choose>
                             <c:when test="${listoftimeslots.day.id == 3}"> <!-- Three == WEDNESDAY -->
                             
                             
								<c:forEach begin="1" end="${listoftimeslots.totalSlots  }" varStatus="loop">
									
									<c:set var = "allocated"  value = "true"/><!-- Logic for allocation -->
									
										<c:forEach items="${timetablewithoutclass}" var="timetablewithoutclass">
										<c:choose>
                             				<c:when test="${ (timetablewithoutclass.day.id == 3)  && (timetablewithoutclass.timeslot.id == loop.index) && (section_id == timetablewithoutclass.assignsubject.section.id )  && (batch_id == timetablewithoutclass.assignsubject.batch.id ) && (semester_id == timetablewithoutclass.assignsubject.semester.id ) }">
    											<c:choose>
                             						<c:when test="${ (timetablewithoutclass.approvedByTeacher == 1)  }">
                             							<td   style="border: 2px solid blue" class="${timetablewithoutclass.assignsubject.subject.code } assigned slots" id="assigned_${listoftimeslots.day.id}_${loop.index}_${timetablewithoutclass.assignsubject.id}"  ><b> ${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type})</b></td>
                             							<c:set var = "allocated"  value = "false"/>	
                             						</c:when>
                             						<c:otherwise>
                             							<td timetableid="${timetablewithoutclass.id}"   class="${timetablewithoutclass.assignsubject.subject.code } assigned slots" id="assigned_${listoftimeslots.day.id}_${loop.index}_${timetablewithoutclass.assignsubject.id}"  >${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type})</td>
                             							<c:set var = "allocated"  value = "false"/>
                             						</c:otherwise>
                             					</c:choose>
    										</c:when>
    									</c:choose>
    								</c:forEach>
									
									<c:if test="${allocated}">
										<td id="unassigned_${listoftimeslots.day.id}_${loop.index}" class="drop slots"></td>	
									</c:if>
									
								</c:forEach>
                       	       
                           	</c:when>
                        </c:choose>        
                                 
                                 
                    	
                    </c:forEach>
				</tr>
				<tr>
					<td >Thursday</td>
						 	 <c:forEach items="${listoftimeslots}" var="listoftimeslots"> <!-- List of time slots dialy -->
					 
					 	<c:choose>
                             <c:when test="${listoftimeslots.day.id == 4}"> <!-- Four == THURSDAY -->
                             
                             
								<c:forEach begin="1" end="${listoftimeslots.totalSlots  }" varStatus="loop">
									
									<c:set var = "allocated"  value = "true"/><!-- Logic for allocation -->
									
										<c:forEach items="${timetablewithoutclass}" var="timetablewithoutclass">
										<c:choose>
                             				<c:when test="${ (timetablewithoutclass.day.id == 4)  && (timetablewithoutclass.timeslot.id == loop.index) && (section_id == timetablewithoutclass.assignsubject.section.id )  && (batch_id == timetablewithoutclass.assignsubject.batch.id ) && (semester_id == timetablewithoutclass.assignsubject.semester.id ) }">
    											<c:choose>
                             						<c:when test="${ (timetablewithoutclass.approvedByTeacher == 1)  }">
                             							<td   style="border: 2px solid blue" class="${timetablewithoutclass.assignsubject.subject.code } assigned slots" id="assigned_${listoftimeslots.day.id}_${loop.index}_${timetablewithoutclass.assignsubject.id}"  ><b> ${timetablewithoutclass.assignsubject.subject.code}</b></td>
                             							<c:set var = "allocated"  value = "false"/>	
                             						</c:when>
                             						<c:otherwise>
                             							<td  timetableid="${timetablewithoutclass.id}"  class="${timetablewithoutclass.assignsubject.subject.code } assigned slots" id="assigned_${listoftimeslots.day.id}_${loop.index}_${timetablewithoutclass.assignsubject.id}"  >${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type})</td>
                             							<c:set var = "allocated"  value = "false"/>
                             						</c:otherwise>
                             					</c:choose>
    										</c:when>
    									</c:choose>
    								</c:forEach>
									
									<c:if test="${allocated}">
										<td id="unassigned_${listoftimeslots.day.id}_${loop.index}" class="drop slots"></td>	
									</c:if>
									
								</c:forEach>
                       	       
                           	</c:when>
                        </c:choose>        
                                 
                                 
                    	
                    </c:forEach>
				</tr>
				<tr>
					<td >Friday</td>
						 	 <c:forEach items="${listoftimeslots}" var="listoftimeslots"> <!-- List of time slots dialy -->
					 
					 	<c:choose>
                             <c:when test="${listoftimeslots.day.id == 5}"> <!-- five == Fridat -->
                             
                             
								<c:forEach begin="1" end="${listoftimeslots.totalSlots  }" varStatus="loop">
									
									<c:set var = "allocated"  value = "true"/><!-- Logic for allocation -->
									
										<c:forEach items="${timetablewithoutclass}" var="timetablewithoutclass">
										<c:choose>
                             				<c:when test="${ (timetablewithoutclass.day.id == 5)  && (timetablewithoutclass.timeslot.id == loop.index) && (section_id == timetablewithoutclass.assignsubject.section.id )  && (batch_id == timetablewithoutclass.assignsubject.batch.id ) && (semester_id == timetablewithoutclass.assignsubject.semester.id ) }">
    											<c:choose>
                             						<c:when test="${ (timetablewithoutclass.approvedByTeacher == 1)  }">
                             							<td   style="border: 2px solid blue" class="${timetablewithoutclass.assignsubject.subject.code } assigned slots" id="assigned_${listoftimeslots.day.id}_${loop.index}_${timetablewithoutclass.assignsubject.id}"  ><b> ${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type})</b></td>
                             							<c:set var = "allocated"  value = "false"/>	
                             						</c:when>
                             						<c:otherwise>
                             							<td  timetableid="${timetablewithoutclass.id}"  class="${timetablewithoutclass.assignsubject.subject.code } assigned slots" id="assigned_${listoftimeslots.day.id}_${loop.index}_${timetablewithoutclass.assignsubject.id}"  >${timetablewithoutclass.assignsubject.subject.code} (${timetablewithoutclass.assignsubject.subject.type})</td>
                             							<c:set var = "allocated"  value = "false"/>
                             						</c:otherwise>
                             					</c:choose>
    										</c:when>
    									</c:choose>
    								</c:forEach>
									
									<c:if test="${allocated}">
										<td id="unassigned_${listoftimeslots.day.id}_${loop.index}" class="drop slots"></td>	
									</c:if>
									
								</c:forEach>
                       	       
                           	</c:when>
                        </c:choose>        
                                 
                                 
                    	
                    </c:forEach>
				
				</tr>
				
			</table>
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
      <!-- Lib Scripts Plugin Js -->
      <script src="assets/bundles/vendorscripts.bundle.js"></script>
      <!-- Lib Scripts Plugin Js -->
      <!-- Jquery DataTable Plugin Js -->
      <script src="assets/bundles/mainscripts.bundle.js"></script>
      
      <script>

      
      function dragndrop (){
    	  
      
      var un_id=0;
		$(function(){
			$('.left .item').draggable({
				revert:true,
				proxy:'clone'
			});
			$('.right td.drop').droppable({
				onDragEnter:function(){
					$(this).addClass('over');
					un_id=this.id;
					
					
				},
				onDragLeave:function(){
					$(this).removeClass('over');

				},
				onDrop:function(e,source){
					$(this).removeClass('over');
					if ($(source).hasClass('assigneding')){
						$(this).append(source);


					} else {
						
						var c = $(source).clone().addClass('assigneding');
						$(this).empty().append(c);
						
						
					
											
						$('#randomAllocation').css("display","none");
						$('#clear').css("display","block");
						$('#commit').css("display","block");
						
					
						
						
						var assignSubject_id=$(source).attr("id");
						
						
						
					 	var day_id=un_id.split("_")[1];
					 	var slot_id=un_id.split("_")[2];
					 	
						var new_assign_id="assigned_"+day_id+"_"+slot_id+"_"+assignSubject_id+"_manual";
						$('#'+un_id).attr("id",new_assign_id);
						
						$('#'+new_assign_id).addClass("assigned");

						//alert(un_id);
						
						var creditHour_id="credit-hour"+assignSubject_id;
						
						
						var creditHour_value=$('#'+creditHour_id).text();
						
						creditHour_value=creditHour_value-1;
						$('#'+creditHour_id).text(creditHour_value);
						
						//alert("creditHour_id");
						//alert(creditHour_value);
						
						if (creditHour_value=="0"){
							
					//		$(source).css({'opacity':'0.5', 'pointer-events': 'none'});
							
						}
						
						  //  alert($(source).attr("id"));
						    

						c.draggable({
							revert:true
						});
					}
				}
			});
			$('.left').droppable({
				accept:'.assigneding',
				onDragEnter:function(e,source){
					$(source).addClass('trash');
				},
				onDragLeave:function(e,source){
					$(source).removeClass('trash');
				},
				onDrop:function(e,source){
					$(source).remove();
				}
			});
		});
		
      }
      dragndrop();
      
      
      
      
      
    	</script>
	
	
	
	<script>
		$(document).ready(function(){
			

			
			$("#commit").css("display","none");
			$("#uncommit").css("display","none");
			$("#publish").css("display","none");
			$("#send_notify").css("display","none");
	
		
			
			
			  $('#clear').click(function(){
					 
						location.reload();
						

				  });
			  
			  
			  
			  
			  $('#send_notify').click(function(){
				  

					$.ajax({
						url:'generatetimetable/notify',
						type:'get',
						
						success:function(msg){
							alert(msg);
							
							
						}
						
					});
				 
				  
			  });
			  
			  $('#commit').click(function(){
					 
					var subjects = $(".assigned").map(function() { return this.id });
					var subjects_slots=[];
					var day_id=[];
					var slot_id=[];
					var assignsubject_id=[];
					
					
					$.each(subjects, function(index, value) {
						subjects_slots.push(value);
						
						
					});
					
					$.each(subjects_slots, function(index, value) {
						
						if (value.split("_")[4]!=null){
							
							
							
							day_id.push(value.split("_")[1]);
							slot_id.push(value.split("_")[2]);
							assignsubject_id.push(value.split("_")[3]);
							
							
						}
						
						
						
						
						
					});
				
					
					
					
					
					
					$.ajax({
						url:'generatetimetable/commit',
						data:'subjects='+subjects_slots,
						type:'post',
						
						success:function(msg){
						location.reload();
							
							
						}
						
					});
					
					
					
					
					 
				
					

			  });
			  
			  var subjects = $(".assigned").map(function() { return this.id });
				
				
				var id =[];
				$.each(subjects, function(index, value) {
					
												
				

					id.push($('#'+value).attr("timetableid"));
					
				});

			  
			  validateCommit(id);
			  
			  
			  //Uncommited
			  
			  			  $('#uncommit').click(function(){
			  			
			  											
							

							$.ajax({
								url:'generatetimetable/uncommit',
								data:'id='+id,
								type:'post',
								
								success:function(msg){
									location.reload();

									
									
								}
								
							});
							
							
		
			  });

			//RANDOM ALLOCATION			
			$('#randomAllocation').click(function(){
				
				var subjects = $(".subject").map(function() { return this.id });
				
			
				
				
				
				
				var assigned_subjects = $(".assigned").map(function() { return this.id }); //it contains too many duplicates values
				
				
			
				
					var assigned_subjects_array=[];				
				  $.each(assigned_subjects, function(index, value) {
				  
					  assigned_subjects_array.push(value); 
				  });
				  
				  
				  var assigned_subjects_ids=[];
				  
				$.each(assigned_subjects_array, function(index, value) {
					  
					  assigned_subjects_ids.push(value.split("_")[3]); 
				  });
				
				
				 
				  
				 

				  
				  var assigned_subjects_ids1 = assigned_subjects_ids.filter(function(value, index, array) {
				      return index === array.indexOf(value);
				  });
				  
		/* $.each( assigned_subjects_ids1, function(index, value) {
			console.log(value);					  
				  });
		*/
				
				  
				  
			
				
				
				//this merge method remove the duplicates between two arrays
				var unassigned_subjects_id=$.merge($(subjects).not(assigned_subjects_ids1).get(),$(assigned_subjects_ids1).not(subjects).get()); //this is list of unassigned subject ids 
				 
		        console.log(unassigned_subjects_id);
				
				function unique(list) {
					  var result = [];
					  $.each(list, function(i, e) {
					    if ($.inArray(e, result) == -1) result.push(e);
					  });
					  return result;
					}
			
				
				var total_slots=[];
				 slots = $(".slots").map(function() { return this.id });
				
				  $.each(slots, function(index, value) {
					 	  
					  total_slots.push(value);
					
					  
					  });
				
				 
				  
				  
				  
				  $.ajax({
					  
					  url:'generatetimetable/slots',
					  data:'slots='+total_slots+'&unassigned_subjects_id='+unassigned_subjects_id,
					  type:'post',
					success:function(msg){
						
						//alert(msg);
						
						$("#commit").css("display","block");
						
										//	$('#teacherdata').css({'opacity':'0.5', 'pointer-events': 'none'});		
						for (obj in msg){
							
							var subjectId=msg[obj];
						
							
							
							if(subjectType(subjectId)=="Theory"){
								
								var htmlcode="<div style='background: rgba(3, 169, 244, 0.42); position: static; left: 35px; top: 363px;' class=' item subject assigneding '  >"+ codeGenerator(subjectId)  +"</div>";
							$('#'+idGenerator(subjectId)).html(htmlcode);
							$('#'+idGenerator(subjectId)).addClass("assigned");
							
							$('#'+idGenerator(subjectId)).attr("id",subjectId);
							
							
							
							}
							
							
if(subjectType(subjectId)=="Practical"){
								
								var htmlcode="<div style='background: rgba(0, 128, 0, 0.15); position: static; left: 35px; top: 432px;' class=' item subject assigneding '  >"+ codeGenerator(subjectId)  +"</div>";
							$('#'+idGenerator(subjectId)).html(htmlcode);
							$('#'+idGenerator(subjectId)).addClass("assigned");
							
	$('#'+idGenerator(subjectId)).addClass("assigned");
							
							$('#'+idGenerator(subjectId)).attr("id",subjectId);
							
							
							}
							
						}
						
						
						$('#randomAllocation').css("display","none");
						$('#clear').css("display","inline-block");
						
						
					}	  
						
				  
				  
						  
					  
				   
				  });
				  
				  
				  

				  
				  

				   

			});
			
			
			
			  function validateCommit(id){
		    	  
				  //Uncommited

					$.ajax({
						url:'generatetimetable/validatecommit',
						data:'id='+id,
						type:'post',
						
						success:function(msg){
							
							if (msg=="commited"){
								$('#teacherdata').css({'opacity':'0.5', 'pointer-events': 'none'});
								$("#uncommit").css("display","block");
								$("#publish").css("display","block");
								$("#send_notify").css("display","block");
								
								
							}
							else{
								//alert("uncommited");
							}

							
							
						}
						
					});
					
					


		      }
				

			
			
			
			
			
			
			  function idGenerator(id){
				  
				   var makeId=id.split("_");
				   if(makeId[0]=="unassigned"){
					   
					   return id;
				   }else {
					   return "unassigned_"+makeId[1]+"_"+makeId[2];
				   }
				   
				  
				  
			  }
			  
			  
			  function codeGenerator(id){
				  
				   var makeId=id.split("_");
				   if(makeId[0]=="unassigned"){
					   
					   return "";
				   }else {
					   return makeId[4];
				   }
				   
				  
				  
			  }
			  function subjectType(id){
				  
				   var makeId=id.split("_");
				   if(makeId[0]=="unassigned"){
					   
					   return "";
				   }else {
					   return makeId[5];
				   }
				   
				  
				  
			  }

		
			
			
			
			
		});
	</script>
	
	
	
	
	<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
   </body>
</html>