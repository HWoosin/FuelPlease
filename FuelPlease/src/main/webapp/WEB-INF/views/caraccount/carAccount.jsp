<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='${pageContext.request.contextPath}/css/caraccount/packages/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/css/caraccount/packages/daygrid/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/css/caraccount/packages/timegrid/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/css/caraccount/packages/list/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/css/caraccount/packages/core/main.js'></script>
<script src='${pageContext.request.contextPath}/css/caraccount/packages/interaction/main.js'></script>
<script src='${pageContext.request.contextPath}/css/caraccount/packages/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath}/css/caraccount/packages/timegrid/main.js'></script>
<script src='${pageContext.request.contextPath}/css/caraccount/packages/list/main.js'></script>
<!-- Favicons -->
<link href="${pageContext.request.contextPath }/img/favicon.png" rel="icon">

<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 100px auto 50px;	
  }

  .fc-day {
	cursor: pointer;
  }

  .fc-day:hover {
	background-color: #7998ff;
  }

  .fc-day-number {
	color: black;
  }

  .fc-sat span{
	color: blue;
  }

  .fc-sat .fc-day-number {
	color: blue;
  }

  .fc-sun span{
	color: red;
  }

  .fc-sun .fc-day-number {
	color: red;
  }

</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
  <div id='calendar'></div>
<%@ include file="../include/footer.jsp" %>
</body>
<script>

	document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');
  
	  var calendar = new FullCalendar.Calendar(calendarEl, {
		plugins: [ 'interaction', 'dayGrid', 'timeGrid','list'],
		header: {
		  left: 'prev,next today',
		  center: 'title',
		  right: 'dayGridMonth,listWeek'
		},
		defaultDate: '2023-06-01',
		navLinks: true, // can click day/week names to navigate views
		selectable: true,
		selectMirror: true,
		select: function(arg) {
		  var title = prompt('지출 금액 입력(단위: 원)');
		  if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
		  fetch('${pageContext.request.contextPath}/caraccount/addAccount', {
				method : 'post',
				headers: {
					'Content-type' : 'application/json'
				}, 
				body: JSON.stringify({
					'content': title,
            		'allDay': arg.start
				})
			})
        }
		  calendar.unselect()
		},
		eventClick: function(arg) {
		  console.log("#등록된 일정 클릭#");
  
		  if(confirm('등록된 일정을 삭제 하시겠습니까?')) {
			  arg.event.remove();
		  }
		},
  
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		events:[] 
		
	  });
  
	  calendar.render();
	});
  
  </script>
</html>
