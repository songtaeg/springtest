<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/layout/menu.jsp"></jsp:include>
 	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
    <title>MyCalendar</title>
    <style>
		#calendar{
			width: 40%;  /* 캘린더의 너비를 필요에 따라 조정 */
			height: 350px; /* 캘린더의 높이를 필요에 따라 조정 */
			margin: 0 auto; /* 캘린더를 수평으로 중앙 정렬 */
		}
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
            });
            calendar.render();
        });
    </script>
</head>
<body>
    <h1>MyCalendar</h1>
    <div id='calendar'></div>
</body>
</html>