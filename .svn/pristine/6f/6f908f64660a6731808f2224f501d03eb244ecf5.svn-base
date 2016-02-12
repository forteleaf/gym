<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href='/resources/fullcalendar-2.5.0/fullcalendar.css'
	rel='stylesheet' />
<link href='/resources/fullcalendar-2.5.0/fullcalendar.print.css'
	rel='stylesheet' media='print' />
<link href='/resources/css/jquery-ui.min.css' rel='stylesheet' />
<link href='/resources/fullcalendar-2.5.0/jquery-ui.theme.css' rel='stylesheet' />
<script src='/resources/js/jquery-ui.min.js'></script>
<script src='/resources/fullcalendar-2.5.0/lib/moment.min.js'></script>
<script src='/resources/fullcalendar-2.5.0/fullcalendar.min.js'></script>
<script src='/resources/fullcalendar-2.5.0/lang/ko.js'></script>
<script>
	$(document).ready(function() {
		$("#scheduleTab").tabs();
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() + 1; //January is 0!
		var yyyy = today.getFullYear();
		if (dd < 10) {
			dd = '0' + dd
		}
		if (mm < 10) {
			mm = '0' + mm
		}
		var todayis = yyyy + '-' + mm + '-' + dd;
		$('#calendar').fullCalendar({
			eventSources : '/schedule/list',
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay'
			},
			defaultDate : todayis,
			eventClick : function(calEvent) {
				//alert(calEvent.title);
				$("#scheduleTrainerClick").empty();
		        $("#scheduleTrainerClick").append("<div align='center' style='width:350px;'>"+calEvent.title+"</div>");
		        $("#scheduleTrainerClick").dialog();
			},
			eventLimit : true
		// allow "more" link when too many events
		});
	});
</script>
<style>
#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
<div class="row">
  <div class="col-xs-10 col-xs-offset-1">
    <section class="panel">
	<div class="panel-heading text-right">
		<form action="/schedule/schedule">
			<input type="submit" value="나의스케줄 보기" class="btn btn-primary">
		</form>
	</div>
		<div class="panel-body">
<!--<div id="scheduleTab">
		<ul>
			<li><a href="#aaa">전체꺼</a></li>
			<li><a href="#bbb">강사꺼</a></li>
		</ul>
		<div id="aaa"><div id='calendar'></div></div>
		<div id="bbb"><div id='calendar'></div></div>
	</div>-->
			<div id="calendar"></div>
			<div id="scheduleMemberClick" style="display:none;"></div>
		</div>
	</section>
  </div>
</div>