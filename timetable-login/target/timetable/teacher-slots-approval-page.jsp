<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.muet.timetable.beans.*"%>
<%@ page import="com.muet.timetable.dao.*"%>
<%@ page import="com.muet.timetable.daoImpl.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!doctype html>
<html class="no-js " lang="en">

<!-- Mirrored from thememakker.com/templates/oreo/university/html/events.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 04 May 2019 10:02:33 GMT -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

<title>:: Muet University Admin ::</title>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<!-- Favicon-->
<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/plugins/fullcalendar/fullcalendar.min.css">
<!-- Custom Css -->
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/color_skins.css">
      <script src="/assets/js/jquery.min.js"></script>






</head>
<body class="theme-blush">
<jsp:include page="teacher_common/left-bar.jsp"></jsp:include>
<jsp:include page="teacher_common/header.jsp"></jsp:include>
	<jsp:include page="teacher_common/right-bar.jsp"></jsp:include>
	<jsp:include page="teacher_common/chat-box.jsp"></jsp:include>

<!-- Page Loader -->
<div class="page-loader-wrapper">
    <div class="loader">
        <div class="m-t-30"><img class="zmdi-hc-spin" src="assets/images/logo.svg" width="48" height="48" alt="Oreo"></div>
        <p>Please wait...</p>        
    </div>
</div>
<!-- Overlay For Sidebars -->
<div class="overlay"></div>
<!-- Top Bar -->

<!-- Left Sidebar -->

<!-- Right Sidebar -->



<section class="content page-calendar">
    <div class="block-header">
        <div class="row">
            <div class="col-lg-7 col-md-6 col-sm-12">
                <h2>Slots
                <small>Welcome to Muet</small>
                </h2>
            </div>
            <div class="col-lg-5 col-md-6 col-sm-12">
                <ul class="breadcrumb float-md-right">
                    <li class="breadcrumb-item"><a href="index.html"><i class="zmdi zmdi-home"></i> Muet</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0);">Teacher</a></li>
                    <li class="breadcrumb-item active">Slots Approval</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container-fluid">  
       
       
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="card">
                    <div class="header">
                        <h2>
                        
                             <strong>From :- <c:out value="Department Of ${assignsubject.batch.dept.name}" /></strong>
                             
                             <small style="color:black;"> <c:out value="${assignsubject.subject.name}" /></small> <small style="color:black;"> <c:out value="(${assignsubject.subject.type})" /></small>
                           </h2>
                    </div>
                   
                </div>
      </div> 
            <div class="col-md-12 col-lg-12 col-xl-12">
                <div class="card">
                    <!-- cards body starts here  -->
                    <div class="body">
                        
                        
                         <table class="table table-hover m-b-0 c_list">
                                        <thead>
                                            <tr>
                                            
                                                <th>Day/Slot</th>
                                                <th>First</th>                                    
                                                <th data-breakpoints="xs">Second</th>   
                                                 <th data-breakpoints="xs">Third</th>   
                                                  <th data-breakpoints="xs">Fourth</th>                                    
                                                <th data-breakpoints="xs">Fifth</th>
                                                <th data-breakpoints="xs">Sixth</th>
                                                <th data-breakpoints="xs">Seventh</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach var="timeslotapproval" items="${timeslotapproval}" varStatus="outerloop">    
                                            <tr>
                                                <td>
                                                     <p><c:out value="${timeslotapproval.day.name}" /></p>
                                                </td>
                                             <c:forEach var="timeslot"  begin="1" end="${timeslotapproval.timeslot.id}" varStatus="innerloop">                
                                                
                                                <td>
                                                     <div class="checkbox" >
 													<c:choose>
 													<c:when test="${timeslot == timeslotapproval.timeslot.id}">
 													
 													
 													 <div style='border: 3px solid blue;'>
 													 <input type='hidden' id="${timeslotapproval.id}"  class="timeslotwithoutroom" />
 													 <input id="${timeslotapproval.timeslot.id}" type="checkbox" onclick="" class="slotscheck" checked >
                                                        
                                                        <label for="${outerloop.index}${innerloop.index}" >&nbsp;</label>
                                                         <c:out value="${timeslotapproval.timeslot.startTime}  "/>
                                                         
                                                         </div>
    
 														 </c:when>
 														 
 														
  
  
													</c:choose>
 													
 													
 													                                                  
                                                        
                                                    </div>
                                                </td>
                                                
                                                                  
                                            </c:forEach>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                            </table>
                    </div>
                    <!-- cards body ends here  -->
                </div>
            </div>
        </div>     
           <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="card">
                    <div class="header">
                        
                            <div class="form-group">
                                  <input type="button" class="btn btn-success" id="approve" value="Approve" >
                                    <input type="button" class="btn btn-info" id="request" value="Request For Change" >
                                       <input type="button" class="btn btn-primary" id="msg" value="Message" >
                          </div>
                              
                    </div>
                   
                </div>

                
      </div>    
    </div>
   
</section>
<!-- Default Size -->

<!-- Jquery Core Js --> 
<script src="assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 
<script src="assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 

<script src="assets/bundles/fullcalendarscripts.bundle.js"></script><!--/ calender javascripts --> 

<script src="assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js --> 
<script src="assets/js/pages/calendar/calendar.js"></script>
</body>




<script type="text/javascript">

var ids = $(".timeslotwithoutroom").map(function() { return this.id });
var array_ids=[];
$.each(ids, function(index, value) {
	
	array_ids.push(value);
	
	
});

$('#approve').click(function(){
	
	$.ajax({
		url:"slotsapproval/approve",
		type:"post",
		data:"timeslotwithoutroom="+array_ids,
		success:function(msg){
			alert(msg);
		}
		
	});	
	
});






</script>





</html>
