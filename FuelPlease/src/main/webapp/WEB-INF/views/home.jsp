<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<%@ include file="include/header.jsp" %>



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


	<!-- ======= Mobile nav toggle button ======= -->
	<!-- <button type="button" class="mobile-nav-toggle d-xl-none"><i class="bi bi-list mobile-nav-toggle"></i></button> -->
	<i class="bi bi-list mobile-nav-toggle d-lg-none"></i>
	
  
	<main id="main">
  
	  <!-- ======= Services Section ======= -->
	  <section id="services" class="services">
		<div class="container" data-aos="fade-up">
  
			<div class="logo">
				<a href="${pageContext.request.contextPath}/">  
					<img src="${pageContext.request.contextPath}/img/FuelPlease_300.png" alt="로고이미지">
				</a>
			</div>

		  <!-- <div class="section-title">
			<h2>Fuel Please</h2>
		  </div> -->

		<form id="home-search-bar" action="${pageContext.request.contextPath}/mapview/searchResult" method="get">
			<div id="home-search-box" class="search-bar" role="search">
				<input type="text" id="search-bar" class="form-contorl" placeholder="search" aria-label="search" size="45" name="searchWord">
				<button type="submit" id="searchBtn">검색</button>
			</div>
		</form>
			
  
		  <div class="Homerow">
  
			<div id="gasolineBox" class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
			  <div class="icon-box iconbox-blue">
				<div class="icon">
				  <svg width="100" height="100" viewBox="0 0 600 600" xmlns="http://www.w3.org/2000/svg">
				  </svg>
				  <i class="bx bxl-dribbble"></i>
				</div>
				<h4><a href="${pageContext.request.contextPath}/mapview/gasolineMap">주유소</a></h4>
			  </div>
			</div>
  

			<div id="elecBox" class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200">
				<div class="icon-box iconbox-green">
					<div class="icon">
						<svg width="100" height="100" viewBox="0 0 600 600" xmlns="http://www.w3.org/2000/svg">
						</svg>
						<i class="bx bx-file"></i>
					</div>
					<h4><a href="${pageContext.request.contextPath}/mapview/elecChargeMap">전기충전소</a></h4>
				</div>
			</div>
			
  
			<div id="lpgBox" class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="300">
			  <div class="icon-box iconbox-pink">
				<div class="icon">
				  <svg width="100" height="100" viewBox="0 0 600 600" xmlns="http://www.w3.org/2000/svg">
				  </svg>
				  <i class="bx bx-tachometer"></i>
				</div>
				<h4><a href="${pageContext.request.contextPath}/mapview/lpgMap">LPG충전소</a></h4>
			  </div>
			</div>

		  </div>
  
		  <!-- 평균가격 뽑아내기 -->
		  <div>
			  <h4>이번주의 평균가격</h4>
			  <h5>휘발유</h5>
			  <p>${gas} 원</p>
			  <h5>고급휘발유</h5>
			  <p>${preGas} 원</p>
			  <h5>경유</h5>
			  <p>${dis} 원</p>
		  </div>
		</div>


	  </section><!-- End Services Section -->
  
  	  
	

      <%@ include file="include/footer.jsp" %>


  
	</main><!-- End #main -->
  
	
  
	<div id="preloader"></div>
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  
	<!-- Vendor JS Files -->
	<script src="${pageContext.request.contextPath }/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/aos/aos.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/typed.js/typed.min.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/waypoints/noframework.waypoints.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/php-email-form/validate.js"></script>
  
	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath }/js/main.js"></script>
  
	<script>
		const id = '${login}';
		console.log(id);
		
		document.getElementById('gasolineBox').onclick = () => {
			location.href = '${pageContext.request.contextPath}/mapview/gasolineMap';
		}
		document.getElementById('elecBox').onclick = () => {
			location.href = '${pageContext.request.contextPath}/mapview/elecChargeMap';
		}
		document.getElementById('lpgBox').onclick = () => {
			location.href = '${pageContext.request.contextPath}/mapview/lpgMap';
		}

		document.getElementById('searchBtn').onclick = () => {
			const searchWord = document.getElementById('search-bar').value;
			console.log(searchWord); //검색어 확인


		}



	</script>


  </body>
  
  
  
  </html>