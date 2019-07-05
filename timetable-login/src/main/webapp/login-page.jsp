<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js " lang="en">

<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

    <title>:: Oreo University Admin ::</title>
    <!-- Favicon-->
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextPath}/resources/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/authentication.css">
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/color_skins.css">
</head>

<body class="theme-blush authentication sidebar-collapse">
<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top navbar-transparent">
    <div class="container">        
        <div class="navbar-translate n_logo">
            <a class="navbar-brand" href="javascript:void(0);" title="" target="_blank">Muet Time Table</a>
            <button class="navbar-toggler" type="button">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
            </button>
        </div>
        <div class="navbar-collapse">
            <ul class="navbar-nav">
                              
                <li class="nav-item">
                    <a class="nav-link btn btn-white btn-round" href="${contextPath}/registration">SIGN UP</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- End Navbar -->
<div class="page-header">
    <div class="page-header-image" style="background-image:url(${contextPath}/resources/assets/images/login.jpg)"></div>
    <div class="container">
        <div class="col-md-12 content-center">
            <div class="card-plain">
                <form method="POST" action="${contextPath}/login" >
                
                
                    <div class="header">
                        <div class="logo-container">
                            <img src="${contextPath}/resources/assets/images/logo.svg" alt="">
                        </div>
                        <h5>Sign in</h5>
                        <span class="input-group-addon" style="color:red">${error}</span>
                            <div class="form-group ${error != null ? 'has-error' : ''}">
                                    <span>${message}</span>
                    </div>
                    <div class="content">        
                                                            
                        <div class="input-group">
                            <input type="text" name="username" class="form-control" placeholder="Enter User Name">
                            <span class="input-group-addon">
                                <i class="zmdi zmdi-account-circle"></i>
                            </span>
                        </div>
                        <div class="input-group">
                            <input type="password" name="password" placeholder="Password" class="form-control" />
                           
                            <span class="input-group-addon">
                                <i class="zmdi zmdi-lock"></i>
                            </span>
                             
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </div>
                    </div>
                    <div class="footer text-center">
                     <button class="btn btn-primary btn-round btn-lg btn-block " type="submit">Sign In</button>
                        
                    </div>
                </form>
            </div>
        </div>
    </div>
    <footer class="footer">
        <div class="container">
            
            <div class="copyright">
                &copy;
                <script>
                    document.write(new Date().getFullYear())
                </script>,
                <span>Designed by <a href="http://thememakker.com/" target="_blank">ThemeMakker</a></span>
            </div>
        </div>
    </footer>
</div>

<!-- Jquery Core Js -->
<script src="${contextPath}/resources/assets/bundles/libscripts.bundle.js"></script>
<script src="${contextPath}/resources/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->

<script>
   $(".navbar-toggler").on('click',function() {
    $("html").toggleClass("nav-open");
});
//=============================================================================
$('.form-control').on("focus", function() {
    $(this).parent('.input-group').addClass("input-group-focus");
}).on("blur", function() {
    $(this).parent(".input-group").removeClass("input-group-focus");
});
</script>
</body>

<!-- Mirrored from thememakker.com/templates/oreo/university/html/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 04 May 2019 10:02:35 GMT -->
</html>