<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href='/resources/fullcalendar-2.5.0/fullcalendar.css' rel='stylesheet' />
<link href='/resources/fullcalendar-2.5.0/fullcalendar.print.css' rel='stylesheet' media='print' />
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
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		if(dd<10) {
		    dd='0'+dd
		}
		if(mm<10) {
		    mm='0'+mm
		} 
		var todayis = yyyy+'-'+mm+'-'+dd;
		var formerStart=null;
				$('#calendar').fullCalendar({
					eventSources:'/schedule/select',
					header: {
						left: 'prev,next today',
						center: 'title',
						right: 'month,agendaWeek,agendaDay'
					},
					defaultDate: todayis,
					eventClick: function(calEvent) {
				        //alert(calEvent.title);
				     	$("#ischeduleClick").empty();
				        $("#ischeduleClick").append("<div align='center'>"+calEvent.title+"</div>");
				        $("#ischeduleClick").dialog();
				    },
				    selectable: true,
					selectHelper: true,
						select: function(start, end) {
						$("#myModalSchedule").modal();
						$("#scheduleInsert").click(function(){
							var eventData;
							if ($("#insertScheduleId").val()!=null) {
								eventData = {
									title: $("#insertScheduleId").val(),
									start: start,
									end: end
								};
							var memberId=eventData.title;
							var startDate=eventData.start;
							var endDate=eventData.end;
							$.getJSON("/schedule/insert?memberId="+memberId
									+"&startDate="+startDate
									+"&endDate="+endDate,function(data){
								if(data.result=='success'){
			    					$("#scheduleInsertSuccess").modal();
			    					location.reload();
			    				}else{
			    					$("#scheduleInsertFail").modal();
			    				}
							});
								$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
							}
							$('#calendar').fullCalendar('unselect');
						});
					},
					editable: true,
					
					eventDragStart: function(event){
						formerStart=event.start.format();
					},
					
					eventDrop: function(event, delta, revertFunc) {
					    var memberId=event.title;
					    var startDate=event.start.format();
					    var endDate=event.end.format();
					    $("#myModalScheduleUpdate").modal();
					    $("#scheduleUpdate").click(function(){
					    	$.getJSON("/schedule/update?memberId="+memberId
									+"&startTime="+startDate
									+"&endTime="+endDate
									+"&formerStart="+formerStart,function(data){
									if(data.result=='success'){
										$("#scheduleUpdateSuccess").modal();
										location.reload();
				    				}else{
				    					$("#scheduleUpdateFail").modal();
					    			}
								});
					    });
					    $("#scheduleUpdateCancel").click(function(){
					    	revertFunc();
					    });
					},
					eventLimit: true // allow "more" link when too many events
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
		<form action="/schedule/schedule_trainer">
			<input type="submit" value="전체스케줄 보기" class="btn btn-primary">
		</form>
	</div>
		<div class="panel-body">
			<div id="calendar"></div>
			<div id="scheduleMemberClick" style="display:none;"></div>
		</div>
	<!--<div id="scheduleTab">
		<ul>
			<li><a href="#aaa">전체꺼</a></li>
			<li><a href="#bbb">강사꺼</a></li>
		</ul>
		<div id="aaa"><div id='calendar'></div></div>
		<div id="bbb"><div id='calendar'></div></div>
	</div>-->
	
	</section>
  </div>
</div>
	<!-- Modal -->
	<div class="modal fade schedule" id="myModalSchedule" role="dialog">\
		<div class="modal-dialog schedule">
			<div class="modal-content schedule">
				<div class="modal-header schedule">
					<button type="button" class="close schedule" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock schedule"></span> 스케줄 입력
					</h4>
				</div>
				<div class="modal-body schedule">
					<form role="form">
						<div class="form-group schedule">
							<label for="usrname"><span
								class="glyphicon glyphicon-user schedule"></span> 등록할 회원의 ID를 입력하세요:</label> <input
								type="text" class="form-control schedule" id="insertScheduleId"
								placeholder="Enter ID">
						</div>
					</form>
				</div>
				<div class="modal-footer schedule">
					<button type="submit" id="scheduleInsert" class="btn btn-success schedule" data-dismiss="modal">
						<span class="glyphicon glyphicon-off schedule"></span> 입력
					</button>
					<button type="submit" class="btn btn-danger schedule" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove schedule"></span> 취소
					</button>
				</div>
			</div>

		</div>
	</div>
	
	<div class="modal fade schedule update" id="myModalScheduleUpdate" role="dialog">\
		<div class="modal-dialog schedule update">
			<div class="modal-content schedule update">
				<div class="modal-body schedule update">
					<form role="form">
						<div class="form-group schedule update">
							<label for="usrname"><span
								class="glyphicon glyphicon-user schedule update"></span>스케줄을 수정하시겠습니까?</label>
						</div>
					</form>
				</div>
				<div class="modal-footer schedule update">
					<button type="submit" id="scheduleUpdate" class="btn btn-success schedule update" data-dismiss="modal">
						<span class="glyphicon glyphicon-off schedule update"></span> 수정
					</button>
					<button type="submit" id="scheduleUpdateCancel" class="btn btn-danger schedule update" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove schedule update"></span> 취소
					</button>
				</div>
			</div>

		</div>
	</div>
	
	</div>

	<div id="scheduleInsertSuccess" class="modal fade schedule" role="dialog">
		<div class="modal-dialog schedule">
			<div class="modal-content alert alert-success schedule">
				<strong>스케줄이 등록되었습니다.</strong>
			</div>
		</div>
	</div>
	<div id="scheduleInsertFail" class="modal fade schedule" role="dialog">
		<div class="modal-dialog schedule">
			<div class="modal-content alert alert-danger schedule">
				<strong>스케줄 등록에 실패했습니다.</strong>
			</div>
		</div>
	</div>
	<div id="scheduleUpdateSuccess" class="modal fade schedule" role="dialog">
		<div class="modal-dialog schedule">
			<div class="modal-content alert alert-success schedule">
				<strong>스케줄이 수정되었습니다.</strong>
			</div>
		</div>
	</div>
	<div id="scheduleUpdateFail" class="modal fade schedule" role="dialog">
		<div class="modal-dialog schedule">
			<div class="modal-content alert alert-danger schedule">
				<strong>스케줄 수정에 실패했습니다.</strong>
			</div>
		</div>
	</div>
	<div id="ischeduleClick" style="display:none;"></div>