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
      
          <style>
              @font-face {
                  font-family: 'KIMM_Bold';
                  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2');
                  font-weight: 700;
                  font-style: normal;
                  }
          </style>

          <style>
            
          </style>
  
     
      
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

        <nav id="navbar" class="navbar nav-menu">

          <ul class="menu-left">

            <li><a href="${pageContext.request.contextPath}/" class="nav-link scrollto active"><img src="${pageContext.request.contextPath}/img/FuelPlease_300.png" alt="로고이미지" style="width: 130px;"></a></li>
            <li><a href="${pageContext.request.contextPath}/mapview/gasolineMap" class="nav-link scrollto"> <span>주유소</span></a></li>
            <li><a href="${pageContext.request.contextPath}/mapview/elecChargeMap" class="nav-link scrollto"> <span>전기충전소</span></a></li>
            <li><a href="${pageContext.request.contextPath}/mapview/lpgMap" class="nav-link scrollto"> <span>LPG충전소</span></a></li>
            <li><a href="${pageContext.request.contextPath}/infoboard/boardList" class="nav-link scrollto"> <span>Board</span></a></li>
            <c:if test="${login != null}">
              <li><a href="${pageContext.request.contextPath}/caraccount/accountList" class="nav-link scrollto"> <span>Car Account</span></a></li>
              <li><a href="${pageContext.request.contextPath}/user/userBookmark" class="nav-link scrollto"> <span>즐겨찾기</span></a></li>
            </c:if>
            
          </ul>
          
          <ul class="menu-right">            
            <c:if test="${login == null}">
              <li><a href="${pageContext.request.contextPath}/user/userLogin" class="member"> <span>Login</span></a></li>
              <li><a href="${pageContext.request.contextPath}/user/userJoin" class="member"> <span>회원가입</span></a></li>
            </c:if>
            <c:if test="${login != null}">
              <li><a id="myPage" href="${pageContext.request.contextPath}/user/userMypage" class="nav-link scrollto"> <span><strong id="userId"></strong>님 환영합니다! [MyPage]</span></a></li>
              <li><a href="${pageContext.request.contextPath}/user/userLogout" class="member" id="logout"> <span>Logout</span></a></li>
            </c:if>

            
          </ul>
        </nav>
        
        

      </header><!-- End Header -->

      <script>
        const loginId = '${login}';
        if(loginId !== '') {
          document.getElementById('userId').textContent = loginId;
        }
        
          // document.getElementById('myPage').textContent = '${login}' + '님 환영합니다! [MyPage]';
          // document.getElementById('logout').onclick = () => {
          //   alert(`${login}님` + ' 로그아웃 되었습니다.');
          // }
        
      </script>
     
</body>
</html>