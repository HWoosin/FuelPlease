<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    
    <title>Fuel Please</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    
    <!-- Favicons -->
    <link href="${pageContext.request.contextPath }/img/favicon.png" rel="icon">
    
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
      <!--
          <style>
              @font-face {
                  font-family: 'KIMM_Bold';
                  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2');
                  font-weight: 700;
                  font-style: normal;
  }
          </style>
  
      -->
      
    <!-- Vendor CSS Files -->
    <!--  <link href="/vendor/aos/aos.css" rel="stylesheet">-->
    <link href="${pageContext.request.contextPath }/vendor/aos/aos.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    
    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
    
    <!-- =======================================================
    * Template Name: MyResume
    * Updated: Mar 10 2023 with Bootstrap v5.2.3
    * Template URL: https://bootstrapmade.com/free-html-bootstrap-template-my-resume/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
    </head>
<body>
   <!-- ======= Header ======= -->
	<header id="header" class="d-flex flex-column justify-content-center">
    
        <div class="logo">
            <img src="${pageContext.request.contextPath}/img/FuelPlease_logo.png" alt="로고이미지">
        </div>

        <nav id="navbar" class="navbar nav-menu">
          
          <ul class="text-align">
            <li><a href="#"><i class="bx bx-home"></i> <span>Home</span></a></li>
            <li><a href="#" class=""><span>주유소</span></a></li>
            <li><a href="#" class=""><span>전기충전소</span></a></li>
            <li><a href="#" class=""><span>LPG충전소</span></a></li>
            <li><a href="${pageContext.request.contextPath}/infoboard/boardList"> <span>Board</span></a></li>
            <li><a href="${pageContext.request.contextPath}/user/userMypage"> <span>MyPage</span></a></li>
            
          </ul>
          
          <div class="search-bar" role="search">
            <input type="search" class="form-contorl" placeholder="search" aria-label="search" size="45">
          </div>

          <ul>
            <li><a href="${pageContext.request.contextPath}/user/userLogin" class="member"> <span>Login</span></a></li>
            <li><a href="${pageContext.request.contextPath}/user/userLogout" class="member"> <span>Logout</span></a></li>
            <li><a href="${pageContext.request.contextPath}/user/userJoin" class="member"> <span>회원가입</span></a></li>
          </ul>
        </nav>
        
        

      </header><!-- End Header -->
</body>
</html>