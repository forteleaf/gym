<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<style>
	#calendar {
		max-width: 1000px;
		margin: 0 auto;
	}
   <%-- 
    select {
      width: 200px;
    }
--%>
</style>
<link href='/resources/fullcalendar-2.5.0/fullcalendar.css' rel='stylesheet' />
<link href='/resources/fullcalendar-2.5.0/fullcalendar.print.css' rel='stylesheet' media='print' />
<link href='/resources/css/jquery-ui.min.css' rel='stylesheet' />
<script src='/resources/fullcalendar-2.5.0/lib/jquery.min.js'></script>
<script src='/resources/js/jquery-ui.min.js'></script>
<script src='/resources/js/bootstrap.min.js'></script>
<script src='/resources/fullcalendar-2.5.0/lib/moment.min.js'></script>
<script src='/resources/js/fullcalendar.js'></script>
<script src='/resources/fullcalendar-2.5.0/lang/ko.js'></script>

<script type="text/javascript">

$(document).ready(function() {
	//http://fullcalendar.io/docs/
//	$("#scheduleTab").tabs();
	
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
	eventSources:[{
		url:'/diary/selectid',//참조소스
		color: 'green',//색깔설정
		}],
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		defaultDate: todayis,
		selectable: true,
		selectHelper: true,
			select: function(start, end) {
			/*
			$.getJSON("/diary/check/" + start, function(data){
				if(data.check=="true"){
				}else{
					alert("다이어리가 존재합니다.");
				}
			});
			*/
					$("#diaryform").modal();
			var eventData;
			var id;
			var exername;
			var d_title;
			var diary;
				eventData = {start: start,end: end};
			var startDate=eventData.start;
			var endDate=eventData.end; 
			var weight;
				$("#startd").val(eventData.start);
				$("#endd").val(eventData.end);
				$("#diaryinsert").submit(function(){
					id=$("#id").val();
					exername=$("#exerlist option:selected").val();
					d_title=$("#d_title").val();
					diary=$("#diary").val();
					weight=$("#weight").val();
					$.getJSON("/diary/insert?id="+id
							+"&startDate="+startDate
							+"&endDate="+endDate
							+"&exername="+exername
							+"&diary="+diary
							+"&d_title="+d_title
							+"&weight="+weight, function(data){
						if(data.result=='success'){
							alert("다이어리가 등록되었습니다.");
						}else{
							alert("다이어리 등록에 실패했습니다.");
						}
					});
				});
				$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
				$('#calendar').fullCalendar('unselect');
		},
		eventClick: function(calEvent) {
			$("#ud_num").val(calEvent.d_num);
			$("#ud_title").val(calEvent.d_title);
			$("#udiary").val(calEvent.diary);
			$("#uweight").val(calEvent.weight);
			var ud_num=$("#ud_num").val();
			var ud_title=$("#ud_title").val();
			var udiary=$("#udiary").val();
			var uweight=$("#uweight").val();
			var uexername;
			
			//저장된 운동정보 얻이오기
			$("#uexerlist").append("<option class='uexerdetail' value=" + calEvent.exername + ">" + calEvent.exername + "</option>");
				uexername=$("#uexerlist option:selected").val();
				$("#uexerclass").click(function(){
					$(".uexerdetail").remove();
					var uexclass=$("#uexerclass option:selected").val();
					$.getJSON('/exer/exclass/' + uexclass, function(data){
						$.each(data, function(i,obj){
							uexername=obj.exname;
							$("#uexerlist").append("<option class='uexerdetail' value="+ uexername +" selected='selected'>" + uexername + "</option>");
						});
					});
				});
	        $("#diaryupdate").modal();
	        //다이어리 삭제
	        $("#deletediary").submit(function(){
	        	$.getJSON('/diary/delete/' + calEvent.d_num,function(data){
	        		if(data.result=='success'){
	        			alert("다이어리가 삭제되었습니다.");
	        		}else{
	        			alert("다이어리 삭제에 실패했습니다.");
	        		}
	        	});
	        }); 
	        //다이어리 수정
	        $("#updatediary").submit(function(){
	        	//alert("타이틀:"+ud_title+",다이어리내용:"+udiary+",운동명:"+uexername+",번호:"+ud_num + ",체중" + uweight);
	        	
	        	ud_num=$("#ud_num").val();
				ud_title=$("#ud_title").val();
				udiary=$("#udiary").val();
				uweight=$("#uweight").val();
				uexername=$("#uexerlist option:selected").val();
				alert("변경운동:" + uexername);
				//uexername $("#uweight").val();
	        	$.getJSON("/diary/update?ud_title=" + ud_title
	        			+"&udiary=" + udiary
	        			+"&uexername=" + uexername
		       			+"&ud_num=" + ud_num
		       			+"&uweight=" + uweight, function(data){
	        		if(data.result=='success'){
	        			alert("다이어리가 수정되었습니다.");
	        		}else{
	        			alert("다이어리 수정에 실패했습니다.");
	        		}	
	       		});
	        });
	    },
		editable: true,
		
		eventDragStart: function(event){
			//alert("드레그?");
			//formerStart=event.start.format();
		},
		eventResize : function( event, jsEvent, ui, view ) { 
			alert("드레그?");
		},
		//시간수정
		eventDrop: function(event, delta, revertFunc) {
			//var dinum=event.d_num;
			//alert("ss:" + dinum);
			alert("이벤트수정");
		},
		eventLimit: true, // allow "more" link when too many events
		views:{
			agenda:{
				eventLimit:1  // adjust to 1 only for agendaWeek/agendaDay
			}
		}
		
	});
	//운동입력선택
	$("#exerclass").click(function(){
		$(".exerdetail").remove();
		var exclass=$("#exerclass option:selected").val();
		$.getJSON('/exer/exclass/' + exclass, function(data){
			$.each(data, function(i,obj){
				var exname=obj.exname;
				$("#exerlist").append("<option class='exerdetail' value="+ exname +" selected='selected'>" + exname + "</option>");
			});
		});
	});
});
</script>
<div id='calendar' ></div>
<!-- 다이어리 인서트 모달 -->
<div class="modal fade" id="diaryform" role="dialog">
    <div class="modal-dialog">
    	<div class="modal-content">
       		<div class="modal-header" style="padding:35px 50px;">
        		<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4><span class="glyphicon glyphicon-list-alt"></span>다이어리 추가하기</h4>
        	</div>
	        <div id="uerrorMsg" class="collapse">
	            <div class="alert alert-warning">
	              <span id="uerrorMsgComm"></span>
	 			</div>
			</div>
			<div class="modal-body" style="padding:40px 50px;">
	       	<form role="form" id="diaryinsert">
        	<div class="form-group">
      		<label for="exerclass">운동명 : </label>
				<select name="exerclass" id="exerclass">
					<option value="1" class="exclass">가슴&어깨</option>
					<option value="2" >팔</option>
					<option value="3" >등</option>
					<option value="4" >복부</option>
					<option value="5" >하체</option>
				</select>
    			<select name="exerlist" id="exerlist"></select>
				<input type="hidden" value="${id }" id="id" name="id">
				<input type="hidden" id="startd" name="startd">
				<input type="hidden" id="endd" name="endd">
			</div>
			<div class="form-group">
				<label for="d_title">제목 : </label>
					<input type="text" id="d_title" name="d_title" class="form-control"
						placeholder="Enter Title">
			</div>
        	<div class="form-group">
				<label for="diary">다이어리 : </label><br>
				<textarea rows="10" cols="50" id="diary" name="diary" class="form-control"
						placeholder="Enter Diary"></textarea>
			</div>
			<div class="form-group">
				<label for="weight">현재체중(kg) : </label><br>
				<input type="text" id="weight" name="weight" class="form-control"
						placeholder="Enter weight">
			</div>
			<button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>등록하기</button>
			</form>
			</div>
			<div class="modal-footer">
          		<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 취소</button>
        	</div>	
		</div>
	</div>
</div>
<!-- 조회,수정모달 -->
<div class="modal fade" id="diaryupdate" role="dialog">
    <div class="modal-dialog">
    	<div class="modal-content">
       		<div class="modal-header" style="padding:35px 50px;">
        		<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4><span class="glyphicon glyphicon-list-alt"></span>다이어리 보기</h4>
        	</div>
	        <div id="uerrorMsg" class="collapse">
	            <div class="alert alert-warning">
	              <span id="uerrorMsgComm"></span>
	 			</div>
			</div>
			<div class="modal-body" style="padding:40px 50px;">
        	<form role="form" id="updatediary">
        	<div class="form-group">
				<label for="uexerclass">운동명 : </label>
					<select name="uexerclass" id="uexerclass">
						<option value="1" selected="selected">가슴&어깨</option>
						<option value="2" >팔</option>
						<option value="3" >등</option>
						<option value="4" >복부</option>
						<option value="5" >하체</option>
					</select>
		   			<select name="uexerlist" id="uexerlist"></select>
		   			<input type="hidden" id="ud_num" name="ud_num">
		  			<input type="hidden" id="ustartd" name="ustartd">
					<input type="hidden" id="uendd" name="uendd">
			</div>
			<div class="form-group">
				<label for="utitle">제목 : </label>
					<input type="text" id="ud_title" name="ud_title" class="form-control"
						placeholder="Enter Exercise">
			</div>
        	<div class="form-group">
				<label for="exname">다이어리 : </label><br>
				<textarea rows="10" cols="50" id="udiary" name="udiary" class="form-control"
						placeholder="Enter Diary"></textarea>
			</div>
			<div class="form-group">
				<label for="uweight">현재체중(kg) : </label><br>
				<input type="text" id="uweight" name="uweight" class="form-control"
						placeholder="Enter weight">
			</div>
			<button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>수정하기</button>
			</form>
			<form role="form" id="deletediary">
			<button type="submit" class="btn btn-danger btn-block" id="deldiary"><span class="glyphicon glyphicon-remove"></span>삭제하기</button>
			</form>
			</div>
			<div class="modal-footer">
          		<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 취소</button>
        	</div>	
		</div>
	</div>
</div>





	