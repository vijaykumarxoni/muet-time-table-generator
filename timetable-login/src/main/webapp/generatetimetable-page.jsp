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
      
      
      <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">
	<script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
      
      
      
      
      <script type="text/javascript">
      

         	
         	
         	
         		
        // }); // ready end
         
      </script>
      
      
      	<style type="text/css">
		.left{
			width:120px;
			float:left;
		}
		.left table{
			background:#144a6e61;
		}
		.left td{
			background:#ffffff;
		}
		.right{
			float:right;
			width:570px;
		}
		.right table{
			background:#E0ECFF;
			width:100%;
		}
		.right td{
			background:#fafafa;
			color:#444;
			text-align:center;
			padding:2px;
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
		
		.assigned{
			border:1px solid #BC2A4D;
		}
		.trash{
			background-color:red;
		}
		
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
      <jsp:include page="common/right-bar.jsp"></jsp:include>
    



	
	
    
    
    
    
    
    
    
    
    
      <!-- Main Content -->
      <section class="content contact">
         <div class="block-header">
            <div class="row">
               <div class="col-lg-7 col-md-6 col-sm-12">
                  <h2>
                     Time Table <small>Welcome to MUET Time Table </small>
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
                          
                          
                           <div class="col-lg-2 col-md-2 col-2">
                              
                                 <input type="button" id="commit"  class="btn btn-success" value="Commit" > 
                                  
                              
                              
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
                           <h6>Teachers</h6>
                           <div id="teacherdata">
                           	<div class="left">
			<table class="table table-bordered table-striped table-hover js-basic-example dataTable no-footer">
				                <c:forEach items="${listofteachers}" var="listofteachers">
                                 <c:choose>
                                    <c:when test="${listofteachers.subject.type == 'Theory'}">
                                    
                 
                                   
				<tr>
				
					<td >
					 
					<b>CH :</b><b id="credit-hour${listofteachers.id}">${listofteachers.subject.credit_hour} </b>
						<div style='background:#03a9f46b' class="item" id="${listofteachers.id}" >${listofteachers.subject.code}  </div>
						
					
					</td>
				</tr>
                     
                                    </c:when>
                                 </c:choose>
                              </c:forEach>
                              <c:forEach items="${listofteachers}" var="listofteachers">
                                 <c:choose>
                                    <c:when test="${listofteachers.subject.type == 'Practical'}">
                                    <tr>
					<td   id="English" >
						<div style='background:#00800026' class="item" id="English" >${listofteachers.subject.code} <small class='text-muted'><b>(${listofteachers.subject.type})</b></div>
					
					</td>
				</tr>
                                    
                                      
                                    </c:when>
                                 </c:choose>
                              </c:forEach>
                              
				
				
			</table>
		</div>
                           
                           
                         <!--   
                              <c:forEach items="${listofteachers}" var="listofteachers">
                                 <c:choose>
                                    <c:when test="${listofteachers.subject.type == 'Theory'}">
                                       <div style='background:#0035ff47'>
                                          <hr>
                                          
                                          
                                          <small class=''><b>${listofteachers.subject.code}</small>
                                          <small class='text-muted'><b>(${listofteachers.subject.type})</b>
                                          </small> 
                                          
													                                          
                                           
                                       </div>
                                    </c:when>
                                 </c:choose>
                              </c:forEach>
                              <c:forEach items="${listofteachers}" var="listofteachers">
                                 <c:choose>
                                    <c:when test="${listofteachers.subject.type == 'Practical'}">
                                       <div style='background:#00800026'    >
                                          <hr>
                                          
                                          
                                          <small class=''><b>${listofteachers.subject.code}</small>
                                          <small class='text-muted'><b>(${listofteachers.subject.type})</b>
                                          </small> 
                                          
                                        
                                       </div>
                                    </c:when>
                                 </c:choose>
                              </c:forEach>
                              
                               -->
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
                    <div class="right">
			<table class="table table-bordered table-striped table-hover js-basic-example dataTable no-footer">
				<tr>
					<td class="blank"></td>
					<td class="title">Monday</td>
					<td class="title">Tuesday</td>
					<td class="title">Wednesday</td>
					<td class="title">Thursday</td>
					<td class="title">Friday</td>
				</tr>
				<tr>
					<td class="time">08:00</td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
				</tr>
				<tr>
					<td class="time">09:00</td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
				</tr>
				<tr>
					<td class="time">10:00</td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
				</tr>
				<tr>
					<td class="time">11:00</td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
				</tr>
				<tr>
					<td class="time">12:00</td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
				</tr>
				
				<tr>
					<td class="time">01:00</td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
				</tr>
				<tr>
					<td class="time">02:00</td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					
				</tr>
				<tr>
					<td class="time">03:00</td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					
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
		$(function(){
			$('.left .item').draggable({
				revert:true,
				proxy:'clone'
			});
			$('.right td.drop').droppable({
				onDragEnter:function(){
					$(this).addClass('over');
					
				},
				onDragLeave:function(){
					$(this).removeClass('over');
				},
				onDrop:function(e,source){
					$(this).removeClass('over');
					if ($(source).hasClass('assigned')){
						$(this).append(source);

					} else {
						
						var c = $(source).clone().addClass('assigned');
						$(this).empty().append(c);
						
					
						
						
						var assignSubject_id=$(source).attr("id");
						var creditHour_id="credit-hour"+assignSubject_id;
						
						
						var creditHour_value=$('#'+creditHour_id).text();
						
						creditHour_value=creditHour_value-1;
						$('#'+creditHour_id).text(creditHour_value);
						
						
						alert(creditHour_value);
						
						if (creditHour_value=="0"){
							
							$(source).css({'opacity':'0.5', 'pointer-events': 'none'});
							
						}
						
						
						
						
						
						
						
						
						  //  alert($(source).attr("id"));
						    

						c.draggable({
							revert:true
						});
					}
				}
			});
			$('.left').droppable({
				accept:'.assigned',
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
	</script>
   </body>
</html>