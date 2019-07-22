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
</head>
<body class="theme-blush">
<jsp:include page="common/left-bar.jsp"></jsp:include>
<jsp:include page="common/header.jsp"></jsp:include>
	<jsp:include page="common/right-bar.jsp"></jsp:include>
	<jsp:include page="common/chat-box.jsp"></jsp:include>

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
                    <li class="breadcrumb-item"><a href="javascript:void(0);">App</a></li>
                    <li class="breadcrumb-item active">Slots</li>
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
                        
                             <strong>From :- <c:out value="Department Of ${requestslots.sender.department.name}" /></strong>
                             <input type="hidden" name="totalCreditHours" id="totalCreditHours" value="${requestslots.assignSubject.subject.credit_hour}">
                             <input type="hidden" name="assignsubjectid" id="assignsubjectid" value="${requestslots.assignSubject.id}">
                             <input type="hidden" name="teacherid" id="teacherid" value="${requestslots.user.id}">
                             <input type="hidden" name="userid" id="userid" value="${requestslots.sender.id}">
                             <small style="color:black;"> <c:out value="${requestslots.assignSubject.subject.name}" /></small> 
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
                                          <c:forEach var="TimeslotDaily" items="${TimeslotDaily}" varStatus="outerloop">    
                                            <tr>
                                                <td>
                                                     <p><c:out value="${TimeslotDaily.day.name}" /></p>
                                                </td>
                                             <c:forEach var="totalTimeslotDaily"  begin="1" end="${TimeslotDaily.totalSlots}" varStatus="innerloop">                
                                                
                                                <td>
                                                     <div class="checkbox">
                                                        <input id="${outerloop.index}${innerloop.index}" type="checkbox" onclick="getelement(this.id)" class="slotscheck" >
                                                        <label for="${outerloop.index}${innerloop.index}" >&nbsp;</label>
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
                        <h2>
                         <div class="form-group">
 								<strong>My Message</strong><br>                              
 						  </div> 
                          <div class="form-group">
                                    <input type="text" class="form-control" id="description" placeholder="Description">
                          </div>                          
                        </h2>
                    </div>
                   
                </div>
                <button class="btn btn-success btn-sm btn-success btn-round waves-effect" id="Submitslots" >Submit</button>
                
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

    var credithour = parseInt(document.getElementById("totalCreditHours").value);
    var count = 0;
    var arr = new Array();
    arr=[];
    document.getElementById("Submitslots").disabled = true;
    
    function addnotification(){
    	
    	var senderid =  $('#teacherid').val();
    	var recieverid =  $('#userid').val();
    	var desc = $('#description').val();
    	var assignsubjectid = $('#assignsubjectid').val();
    	$.ajax({

			url : 'notificationresponse/save',
			type : 'post',
			async:false,
			data : {
				
				'assignsubject.id' : assignsubjectid,
				'user_sender.id' : recieverid,
				'teacher.id' :senderid ,
				'description' : desc,
				
				
			},
			success : function(msg) {
				
				

			}

		}); //ajax end
    	
    }    
    
    
    
    function checkInRow(str){
    	 
    	var checkSameRowSlot=str.charAt(0);
    	
         for (var i = 0; i < arr.length; i++) {
     		var v=arr[i].charAt(0);
     		if(v==checkSameRowSlot){
            return true;
            }
         
         }
         
        
	     return false;
    	
    }
    
    
    function getelement(id){
    	
    	
    	if(document.getElementById(id).checked == true){
    		if(count>credithour-1){
    			document.getElementById(id).checked = false;
    			document.getElementsByClassName("slotscheck").disabled = true;
    		
	
    		}
    		else{

        		alert("The count value is "+count);

    		if(checkInRow(id)==false){
    			arr[count]=id;
    			if(count==credithour-1){
    	    		document.getElementById("Submitslots").disabled = false;
    	    	}
    	        
    			count++;

        		
	
    		}
    		
    		else if(checkInRow(id)==true){
    			document.getElementById(id).checked = false;
    		}

    		}
    		
    		
    		
    		
    	}
 
    	else if(document.getElementById(id).checked == false){
    		count--;
    		var index = arr.indexOf(id);
    		if (index !== -1) arr.splice(index, 1);
    	}
    	
    	
   
    }
    
    

    
    
    
    $(document).ready(function() {
    	$('#Submitslots').click(function() {
    		var assignsubjectid = $('#assignsubjectid').val();


        	for(var i=0;i<credithour;i++){
        		var slotValue=arr[i];
        		var	dayid = parseInt(slotValue.charAt(0))+1;
        		var	slot = parseInt(slotValue.charAt(1));
        			
    		
    		$.ajax({

    			url : 'slots/save',
    			type : 'post',
    			data : {
    				
    				'assignsubject.id' : assignsubjectid,
    				'day.id' : dayid,
    				'timeslot.id' :slot ,
    				
    				
    			},
    			success : function(msg) {
    				
    					
    				
    			}

    		}); //ajax end
        	}
    		addnotification();
    	}); //addbtnclick end
    	
    }); // ready end
</script>





<!-- Mirrored from thememakker.com/templates/oreo/university/html/events.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 04 May 2019 10:02:34 GMT -->
</html>
