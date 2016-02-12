<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<link href='/resources/fullcalendar-2.5.0/fullcalendar.css' rel='stylesheet' />
<link href='/resources/fullcalendar-2.5.0/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='/resources/js/jquery-ui.min.js'></script>


<script src='/resources/fullcalendar-2.5.0/lib/moment.min.js'></script>
<script src='/resources/fullcalendar-2.5.0/fullcalendar.min.js'></script>
<script src='/resources/fullcalendar-2.5.0/lang/ko.js'></script>

<!-- 정보수정하기 버튼 클릭 시 작동할 Script-->
<script>
$(document).ready(function(){
	//수정 form
	$("#updatebtn").click(function(){
        $("#myUpdateForm").modal();
	});
	$('#myTab a').click(function (e) {
		e.preventDefault()
		$(this).tab('show')
  	});
	$( "#calendartabs" ).tabs();
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

	$('#calendartabs li#two').click(function(e){
		$('#calendar2').fullCalendar({
			eventSources:'/schedule/list',
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: todayis,
			eventClick: function(calEvent) {
				alert(calEvent.title);
		    },
			editable: true,
			eventLimit: true // allow "more" link when too many events
		});
		
	});
});
	
</script>
<style>

</style>
	
<div class="row">
	<div class="col-xs-5">
		<div id="userdetail">
		<section class="panel">
		<div class="panel-heading"> ${id }님의 정보 </div>
		<table class="table table-hover">
			<tr>
				<td rowspan="6" align="center" width="180px">
					<c:choose>
						<c:when test="${dto.savefile == null}">
							사진없음<br>
						</c:when>
						<c:otherwise>
							<img src="/resources/userphoto/${dto.savefile }" class="img-rounded" style="height:200px;width:200px"><br>
						</c:otherwise>
					</c:choose>
				</td>
				<td>ID:${dto.id }</td>
			</tr>
			<tr>
				<td>이름:${dto.uname }</td>
			</tr>
			<tr>
				<td>
				<c:choose>
					<c:when test="${dto.sex==1 }">
						성별:남자
					</c:when>
					<c:otherwise>
						성별:여자
					</c:otherwise>
				</c:choose>	
				</td>
			</tr>
			<tr>
				<td>EMAIL:${dto.email }</td>
			</tr>
			<tr>
				<td>주소:${dto.addr }</td>
			</tr>
			<tr>
				<td>전화번호:${dto.phone }</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<div class="btn-group">
					<button type="button" class="btn btn-primary" id="updatebtn">정보수정하기</button>
					<c:choose>
						<c:when test="${grade==2 }">
							<button type="button" class="btn btn-primary" id="infoup">경력정보 수정하기</button>
						</c:when>
					</c:choose>
				</div>
				</td>
			</tr>
		</table>
		</section>
		</div>
		 <section class="panel">
		 <div class="panel-heading"> ${id }님의 기록</div>
		<div role="tabpanel" id="userchart">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#calochart" aria-controls="calochart" role="tab" data-toggle="tab">주간칼로리소모차트</a></li>
				<li role="presentation"><a href="#weichart" aria-controls="weichart" role="tab" data-toggle="tab">주간 체중표</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane fade in active" id="calochart">
					<jsp:include  page="/WEB-INF/views/diary/userexer.jsp" flush="false">
				  		<jsp:param value="${id }" name="id"/>
				  	</jsp:include>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="weichart">
					<jsp:include  page="/WEB-INF/views/diary/userweight.jsp" flush="false">
				  		<jsp:param value="${id }" name="id"/>
				  	</jsp:include>
				</div>
			</div>
		</div>
		</section>
	</div>
	<div class="col-xs-7">
	 <section class="panel">
	 <div class="panel-heading"> 다이어리 & 스케줄 </div>
		<div id="calendartabs" >
			<ul>
				<li id="one"><a href="#t1">다이어리</a></li>
				<li id="two"><a href="#t2">스케줄</a></li>	
			</ul>
			<div id="t1">
			<div id="cal1">
					<jsp:include page="/WEB-INF/views/diary/userdiary.jsp"></jsp:include>
			  	</div>
			</div>
			<div id="t2">
				<div id="cal2">
					<div id='calendar2'></div>
				</div>
			</div>
		</div>
		</section>
	</div>
</div>





<!-- 강사 경력추가 및 수정 폼 -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#infoup").click(function(){
			$("#infoForm").modal();
		});
	});
</script>
<div class="modal fade" id="infoForm" role="dialog">
    <div class="modal-dialog">
    	<div class="modal-content">
       		<div class="modal-header" style="padding:35px 50px;">
        		<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4><span class="glyphicon glyphicon-user"></span>경력정보 수정하기</h4>
        	</div>
	        <div id="errorMsg" class="collapse">
	            <div class="alert alert-warning">
	              <span id="errorMsgComm"></span>
	 			</div>
			</div>
			<div class="modal-body" style="padding:40px 50px;">
			<!-- 정보수정폼 시작 -->
        	<form role="form" method="post" action="/instructor/infoupdate" enctype="multipart/form-data" id="infoupdate">
        		<input type="hidden" value="${dto.id }" name="id">
				<div class="row">
					<div class="col-xd-6 col-sm-6 col-md-6">
						<div class="form-group">
							<label for="inum">사원번호 : </label>
							<input type="text" id="inum" name="inum" class="form-control" value="${idto.inum }" disabled="disabled">
						</div>
					</div>
					<div class="col-xd-6 col-sm-6 col-md-6">
						<div class="form-group">
							<label for="iname">이름 : </label>
							<input type="text" id="iname" name="iname" class="form-control" value="${dto.uname }" disabled="disabled">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xd-6 col-sm-6 col-md-6">
						<div class="form-group">
							<label for="isal">급여 : </label>
							<input type="text" id="isal" name="isal" class="form-control" value="${idto.sal }" disabled="disabled">
						</div>
					</div>
					<div class="col-xd-6 col-sm-6 col-md-6">
						<div class="form-group">
							<label for="isal">입사일 : </label>
							<input type="text" id="ijoin" name="ijoin" class="form-control" value="${idto.ijoin }" disabled="disabled">
						</div>
					</div>
				</div>
				<div class="form-group">
				<label for="info">경력정보 : </label><br>
					<textarea rows="10" cols="50" id="info" name="info" class="form-control"
						placeholder="Enter Infomation">${idto.info }</textarea>
				</div>
			<button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>수정하기</button>
			</form>
			</div>
			<div class="modal-footer">
          		<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 취소</button>
        	</div>	
		</div>
	</div>
</div>

<!-- 회원정보 수정을 위한 Script -->
<script>
var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
function checkOk($target){
	$target.next().remove();
	$target.after("<span class=\"glyphicon glyphicon-ok form-control-feedback\"></span>").parent().attr("class","form-group has-success has-feedback");
}
function checkErr($target){
	$target.next().remove();
	$target.after("<span class=\"glyphicon glyphicon-remove form-control-feedback\"></span>").parent().attr("class","form-group has-error has-feedback");
}
$(document).ready(function() {
	$("#ipwd").focusout(function() {
		var pwd = $("#ipwd").val();
		if (pwd.length <= 0) {
			$('#errorMsgComm').html("<strong> Warning </strong> 비밀번호를 입력 해 주세요.");
			$('#errorMsg').collapse("show");
			//$("#pwdmsg").html("비밀번호를 입력하시오.");
			checkErr($('#ipwd'));
		} else {
			$('#errorMsg').collapse("hide");
			//$("#pwdmsg").html("");
		}
	});
	$("#pwdch").focusout(function() {
		var pwd = $("#ipwd").val();
		var pwdch = $("#pwdch").val();
		if (pwd != pwdch) {
			$('#errorMsgComm').html("<strong> Warning </strong> 비밀번호가 일치하지 않습니다.");
			$('#errorMsg').collapse("show");
			checkErr($('#ipwd'));
			checkErr($('#pwdch'));
			//$("#pwdchmsg").html("비밀번호가 일치하지 않습니다");
		} else {
			if($('#ipwd').val().length <= 0){
				$('#errorMsgComm').html("<strong> Warning </strong> 비밀번호를 입력 해 주세요.");
				$('#errorMsg').collapse("show");
				checkErr($('#ipwd'));
				return;
			}
			$('#errorMsg').collapse("hide");
			checkOk($('#ipwd'));
			checkOk($('#pwdch'));
			//$("#pwdchmsg").html("비밀번호가 일치합니다");
		}
	});
	$("#updateForm").submit(function(event) {
		if ($("#ipwd").val().length <= 0) {
			$('#errorMsgComm').html("<strong> Warning!! </strong> 비밀번호를 입력 해 주세요.");
			$('#errorMsg').collapse("show");
			checkErr($('#ipwd'));
			//alert("비밀번호를 입력하시오.");
			event.preventDefault();
		} else if ($("#ipwd").val() != $("#pwdch").val()) {
			$('#errorMsgComm').html("<strong> Warning </strong> 비밀번호가 일치하지 않습니다.");
			$('#errorMsg').collapse("show");
			checkErr($('#pwdch'));
			checkErr($('#ipwd'));
			//alert("비밀번호가 일치하지 않습니다.");
			event.preventDefault();
		} else if ($("#uname").val().length <= 0) {
			$('#errorMsgComm').html("<strong> Warning!! </strong> 이름을 입력하세요.");
			$('#errorMsg').collapse("show");
			checkErr($('#uname'));
			//alert("이름를 입력하시오.");
			event.preventDefault();
		} else if ($("#phone").val().length <= 0) {
			$('#errorMsgComm').html("<strong> Warning </strong> 전화번호를 입력해 주세요");
			$('#errorMsg').collapse("show");
			checkErr($('#phone'));
			//alert("전화번호를 입력하시오.");
			event.preventDefault();
		} else if ($("#email").val().length <= 0) {
			$('#errorMsgComm').html("<strong> Warning </strong> 이메일을 입력해 주세요.");
			$('#errorMsg').collapse("show");
			checkErr($('#email'));
			//alert("이메일을 입력하시오.");
			event.preventDefault();
		} else {
			$("form").submit();
		}
	});

	$(function() {
		$("#file1").change(function() {
			if (typeof (FileReader) != "undefined") {
				var dvPreview = $("#dvPreview");
				dvPreview.html("");
				$($(this)[0].files).each(function() {
					var file = $(this);
					if (regex.test(file[0].name.toLowerCase())) {
						var reader = new FileReader();
						reader.onload = function(e) {
							var img = $("<img />");
							img.attr("style", "height:150px;width: 150px");
							img.attr("src", e.target.result);
							img.attr("margin","auto");
							$('#dvPreview1').collapse('show');
							dvPreview.append(img);
						}
						reader.readAsDataURL(file[0]);
					} else {
						alert(file[0].name + "은 이미지파일이 아닙니다.");
						$("#file1").val("");
						$('#dvPreview1').collapse('hide');
						dvPreview.html("");
						return false;
					}
				});
			} else {
				alert("이 브라우져는 HTML5를 지원하지 않습니다.");
			}
		});
	});
});
</script>
<!-- 수정하기 form -->
<div class="modal fade" id="myUpdateForm" role="dialog">
    <div class="modal-dialog">
    	<div class="modal-content">
       		<div class="modal-header" style="padding:35px 50px;">
        		<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4><span class="glyphicon glyphicon-user"></span>정보수정하기</h4>
        	</div>
	        <div id="errorMsg" class="collapse">
	            <div class="alert alert-warning">
	              <span id="errorMsgComm"></span>
	 			</div>
			</div>
			<div class="modal-body" style="padding:40px 50px;">
			<!-- 정보수정폼 시작 -->
        	<form role="form" method="post" action="/user/update" enctype="multipart/form-data" id="updateForm">
        		<input type="hidden" value="${dto.id }" name="id">
				<div class="form-group">
				<label for="uname">이름 : </label>
					<input type="text" id="uname" name="uname" class="form-control"
						placeholder="Enter Name" value="${dto.uname }">
				</div>
				<div class="row">
			  <div class="col-xd-6 col-sm-6 col-md-6">
				<div class="form-group">
					<span class="glyphicon glyphicon-eye-open"></span><label for="pwd">비밀번호 : </label><input type="password" id="ipwd" name="pwd" class="form-control"
						placeholder="Enter Password"><br>
						<!-- <span id="pwdmsg"></span> -->
				</div>
			  </div>
			  <div class="col-xs-6 col-sm-6 col-md-6">
				<div class="form-group">
					<label for="pwdch">비밀번호확인 : </label><input type="password" id="pwdch" class="form-control" placeholder="Enter Passwrod"><br>
						<!-- <span id="pwdchmsg"></span> -->
				</div>
			  </div>
			</div>
			<div class="form-group">
				<span class="glyphicon glyphicon-phone"></span><label for="email">전화번호 : </label>
				<input type="text" id="phone" name="phone" class="form-control"
					placeholder="Enter PhoneNumber" value="${dto.phone }">
			</div>
			<div class="form-group">
				<span class="glyphicon glyphicon-envelope"></span><label for="email">이메일 : </label>
				<input type="email" id="email" name="email" class="form-control"
					placeholder="Enter Email" value="${dto.email }">
			</div>
			<div class="form-group">
				<label for="addr">주소 : </label>
				<input type="text" id="addr" name="addr" class="form-control" placeholder="Enter Address" value="${dto.addr }">
			</div>
			<div class="form-group">
				<label for="birth">생년월일 : </label>
				<input type="date" id="birth" name="birth" class="form-control" value="${dto.birth }">
			</div>
			<div class="form-group">
				<label >성별 : </label>
				<c:choose>
					<c:when test="${dto.sex==1 }">
						<label class="radio-inline">
		 					<input type="radio" name="sex" class="optradio" value="1" checked="checked"> 남자
		  				</label>
						<label class="radio-inline">
							<input type="radio" name="sex" class="optradio" value="2"> 여자
						</label>
					</c:when>
					<c:otherwise>
						<label class="radio-inline">
		 					<input type="radio" name="sex" class="optradio" value="1"> 남자
		  				</label>
						<label class="radio-inline">
							<input type="radio" name="sex" class="optradio" value="2" checked="checked"> 여자
						</label>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="collapse" id="dvPreview1">
				<div id="dvPreview" class="img-thumbnail"></div>
			</div>
			<div class="form-group">
				<span class="glyphicon glyphicon-picture"></span><label>사진</label>
				<input type="file" name="file1" id="file1" multiple="multiple" class="file">
			</div>
			<button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>수정하기</button>
			</form>
			</div>
			<div class="modal-footer">
          		<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 취소</button>
        	</div>	
		</div>
	</div>
</div>














