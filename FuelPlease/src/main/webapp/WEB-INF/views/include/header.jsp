<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Fuel Please</title>
</head>
<body>
   <!-- ======= Header ======= -->
	<header id="header" class="d-flex flex-column justify-content-center">
  
        <nav id="navbar" class="navbar nav-menu">
          <ul>
            <li><a href="#hero" class="nav-link scrollto active"><i class="bx bx-home"></i> <span>Home</span></a></li>
            <li><a href="#about" class="nav-link scrollto"><i class="bx bx-user"></i> <span>주유소</span></a></li>
            <li><a href="#resume" class="nav-link scrollto"><i class="bx bx-file-blank"></i> <span>전기충전소</span></a></li>
            <li><a href="#portfolio" class="nav-link scrollto"><i class="bx bx-book-content"></i> <span>LPG충전소</span></a></li>
            <li><a href="#services" class="nav-link scrollto"><i class="bx bx-server"></i> <span>Board</span></a></li>
            <li><a href="${pageContext.request.contextPath}/infoboard/boardList" class="nav-link scrollto"><i class="bx bx-server"></i> <span>Board</span></a></li>
            
            <c:if test="${login == null}">
            	<li><a href="${pageContext.request.contextPath}/user/userLogin" class="nav-link scrollto"><i class="bx bx-envelope"></i> <span>Login</span></a></li>
          	</c:if>
          	<c:if test="${login != null}">
            	<li><a href="${pageContext.request.contextPath}/user/userMypage" class="nav-link scrollto"><i class="bx bx-envelope"></i> <span>MyPage</span></a></li>
            	<li><a href="${pageContext.request.contextPath}/user/userLogout" class="nav-link scrollto"><i class="bx bx-envelope"></i> <span>Logout</span></a></li>
          	</c:if>
            
           
          </ul>
        </nav><!-- .nav-menu -->
    
      </header><!-- End Header -->
</body>
</html>