<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/caraccount/carAccount.css">
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />

<%@ include file="../include/header.jsp"%>
<section>
	<div class="calendar-container">
		<div class="calendar">
			<div class="month">
				<i class="fas fa-angle-left prev"></i>
				<div class="date">
					<h1></h1>
					<p></p>
				</div>
				<i class="fas fa-angle-right next"></i>
			</div>
			<div class="weekdays">
				<div class="sunday">Sun</div>
				<div>Mon</div>
				<div>Tue</div>
				<div>Wed</div>
				<div>Thu</div>
				<div>Fri</div>
				<div class="saturday">Sat</div>
			</div>
			<div class="days"></div>
		</div>
	</div>
</section>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/js/caraccount/carAccount.js"></script>

<script>
    document.querySelector('.days').addEventListener('click', (e) => {
        const value = e.target.textContent;
        console.log(value);
    })

</script>