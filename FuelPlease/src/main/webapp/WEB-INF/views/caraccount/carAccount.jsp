<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='${pageContext.request.contextPath}/css/caraccount/packages/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/css/caraccount/packages/daygrid/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/css/caraccount/packages/timegrid/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/css/caraccount/packages/core/main.js'></script>
<script src='${pageContext.request.contextPath}/css/caraccount/packages/interaction/main.js'></script>
<script src='${pageContext.request.contextPath}/css/caraccount/packages/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath}/css/caraccount/packages/timegrid/main.js'></script>
<!-- Favicons -->
<link href="${pageContext.request.contextPath }/img/favicon.png" rel="icon">
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      defaultDate: '2023-06-01',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('Event Title:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
      ]
    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
  <div id='calendar'></div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
