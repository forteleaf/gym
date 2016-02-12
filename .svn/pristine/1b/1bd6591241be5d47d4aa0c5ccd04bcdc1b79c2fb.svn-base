<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/resources/js/Chart.js"></script>
<!-- 차트를 위한 스ㅎ크립트 -->
<style>
	.bg-info {
    background: rgba(0, 0, 0, 0.5) none repeat scroll 0% 0%;
    text-align: left;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		//탭기능
		$('#myTab a').click(function (e) {
			e.preventDefault()
			$(this).tab('show')
		})
		
		//////////////
		function checkOk($target){
			$target.next().remove();
			$target.after("<span class=\"glyphicon glyphicon-ok form-control-feedback\"></span>").parent().attr("class","form-group has-success has-feedback");
		}
		function checkErr($target){
			$target.next().remove();
			$target.after("<span class=\"glyphicon glyphicon-remove form-control-feedback\"></span>").parent().attr("class","form-group has-error has-feedback");
		}
	
		//정보추가 스크립트
		$("#insertexer").click(function(){
        	$("#insertexForm").modal();
    	});
		$("#exinsert").submit(function(event) {
			if ($("#exnamei").val().length <= 0) {
				$('#errorMsgComm').html("<strong> Warning!! </strong> 운동명을 입력 해 주세요.");
				$('#errorMsg').collapse("show");
				checkErr($('#exnamei'));
				event.preventDefault();
			} else if ($("#calorie").val().length <= 0) {
				$('#errorMsgComm').html("<strong> Warning!! </strong> 칼로리소모량을 입력 해 주세요.");
				$('#errorMsg').collapse("show");
				checkErr($('#calorie'));
				event.preventDefault();
			} else if ($("#aero").val().length <= 0) {
				$('#errorMsgComm').html("<strong> Warning!! </strong> 유산소 운동효과을 입력 해 주세요.");
				$('#errorMsg').collapse("show");
				checkErr($('#aero'));
				event.preventDefault();
			} else if ($("#strength").val().length <= 0) {
				$('#errorMsgComm').html("<strong> Warning!! </strong> 기대근력향상을 입력 해 주세요.");
				$('#errorMsg').collapse("show");
				checkErr($('#strength'));
				event.preventDefault();
			} else if ($("#stamina").val().length <= 0) {
				$('#errorMsgComm').html("<strong> Warning!! </strong> 지구력향상효과를 입력 해 주세요.");
				$('#errorMsg').collapse("show");
				checkErr($('#stamina'));
				event.preventDefault();
			} else {
				$("#exinsert").submit();
			}
		});
		
///////////////////////////////////////////////////////////////////////////////////////////////
		$(".exupdate").click(function(){
	       	$("#updateexForm").modal();
        	var exnum=$(this).next().text();
        	$.getJSON('/exer/exerdetail/' + exnum, function(data){
        		var exnum=data.exnum;
        		var exname=data.exname;
        		var exclass=data.exclass;
        		var calo=data.calo;
    			var aero=data.aero;
    			var stren=data.stren;
    			var sta=data.sta;
    			var exinfo=data.info
    			$("#uexnum").val(exnum);
     			$("#uexname").val(data.exname);
    			$("#ucalo").val(calo);
    			$("#uaero").val(aero);
    			$("#ustren").val(stren);
    			$("#usta").val(sta);
    			$("#uexerinfo").val(exinfo);
     		});
    	});
		$("#updateex").submit(function(event) {
			if ($("#uexname").val().length <= 0) {
				$('#uerrorMsgComm').html("<strong> Warning!! </strong> 운동명을 입력 해 주세요.");
				$('#uerrorMsg').collapse("show");
				checkErr($('#uexname'));
				event.preventDefault();
			} else if ($("#ucalo").val().length <= 0) {
				$('#uerrorMsgComm').html("<strong> Warning!! </strong> 칼로리소모량을 입력 해 주세요.");
				$('#uerrorMsg').collapse("show");
				checkErr($('#ucalo'));
				event.preventDefault();
			} else if ($("#uaero").val().length <= 0) {
				$('#uerrorMsgComm').html("<strong> Warning!! </strong> 유산소 운동효과을 입력 해 주세요.");
				$('#uerrorMsg').collapse("show");
				checkErr($('#uaero'));
				event.preventDefault();
			} else if ($("#ustren").val().length <= 0) {
				$('#uerrorMsgComm').html("<strong> Warning!! </strong> 기대근력향상을 입력 해 주세요.");
				$('#uerrorMsg').collapse("show");
				checkErr($('#ustren'));
				event.preventDefault();
			} else if ($("#usta").val().length <= 0) {
				$('#uerrorMsgComm').html("<strong> Warning!! </strong> 지구력향상효과를 입력 해 주세요.");
				$('#uerrorMsg').collapse("show");
				checkErr($('#usta'));
				event.preventDefault();
			} else {
				$("#updateex").submit();
			}
		});
///////////////////////////////////////////////////////////////////////////////////////////////
		//그래프 스크립트
		$(".loadexer").parent().click(function(){
			var exnum=$(this).find("span").text();
			$.getJSON('/exer/exerdetail/' + exnum, function(data,option){
				var exname=data.exname;
				var calo=data.calo;
				var aero=data.aero;
				var stren=data.stren;
				var sta=data.sta;
				var exinfo=data.info;
				$("#showexname").html(exname);
				$("#showcalo").html(calo);
				$("#showaero").html(aero);
				$("#showstren").html(stren);
				$("#showsta").html(sta);
				$("#showexinfo").html(exinfo);
				var data = {
				    labels: ["칼로리:" + calo,"유산소:" + aero,"근력:" + stren,"지구력:" + sta],
					    datasets: [
							{
							    label: "My Second dataset",
							    fillColor: "rgba(151,187,205,0.8)",
					            strokeColor: "rgba(151,187,205,1)",
					            pointColor: "rgba(151,187,205,1)",
					            pointStrokeColor: "#fff",
					            pointHighlightFill: "#fff",
					            pointHighlightStroke: "rgba(151,187,205,1)",
							    data: [calo, aero, stren, sta]
					        }
					    ]
					};
				var ctx = $("#myChart").get(0).getContext("2d");
				var myRadarChart = new Chart(ctx).Radar(data);
			});
		});
	});
</script>

<div role="tabpanel">
 <!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#exall" aria-controls="exall" role="tab" data-toggle="tab">전체목록</a></li>
		<li role="presentation"><a href="#ex1" aria-controls="ex1" role="tab" data-toggle="tab">가슴&어깨</a></li>
		<li role="presentation"><a href="#ex2" aria-controls="ex2" role="tab" data-toggle="tab">팔</a></li>
		<li role="presentation"><a href="#ex3" aria-controls="ex3" role="tab" data-toggle="tab">등</a></li>
		<li role="presentation"><a href="#ex4" aria-controls="ex4" role="tab" data-toggle="tab">복부</a></li>
		<li role="presentation"><a href="#ex5" aria-controls="ex5" role="tab" data-toggle="tab">하체</a></li>
  	</ul>
  	
	<!-- Tab panes -->
	<div class="row">
		<div class="col-xs-4">	
		
		<section class="panel">
		<div class="panel-heading"> 운동목록 </div>
			<div style="position: relative; overflow: hidden; width: auto; height: 550px;" class="slimScrollDiv">
			<div style="overflow: auto; width: auto; height: 530px;" class="panel-body" id="noti-box">
			<div class="tab-content">
			<div role="tabpanel" class="tab-pane fade in active" id="exall">
				<table class="table table-condensed" style="color:#8c8c8c">
					<tr>
						<th>운동명</th>
						<c:choose>
							<c:when test="${grade<=2 }">
								<th width="50">수정</th>
								<th width="50">삭제</th>
							</c:when>
						</c:choose>	
					</tr>
					<c:forEach var="dto" items="${list }" varStatus="vs">
						<tr>
							<td><a class="loadexer">${dto.exname }</a><span hidden="true">${dto.exnum }</span></td>
							<c:choose>
								<c:when test="${grade<=2 }">
									<td><a id="signup"><input type="button" value="수정" class="exupdate"><span hidden="true">${dto.exnum }</span></a></td>
									<td><a href="/exer/delete?exnum=${dto.exnum }"><input type="button" value="삭제"></a></td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div role="tabpanel" class="tab-pane fade" id="ex1">
				<table class="table table-hover" >
					<tr>
						<th>운동명</th>
						<c:choose>
							<c:when test="${grade<=2 }">
								<th width="50">수정</th>
								<th width="50">삭제</th>
							</c:when>
						</c:choose>	
					</tr>
					<c:forEach var="dto" items="${ex1 }" varStatus="vs">
						<tr>
							<td><a class="loadexer">${dto.exname }</a><span hidden="true">${dto.exnum }</span></td>
							<c:choose>
								<c:when test="${grade<=2 }">
									<td><a id="signup"><input type="button" value="수정" class="exupdate"><span hidden="true">${dto.exnum }</span></a></td>
									<td><a href="/exer/delete?exnum=${dto.exnum }"><input type="button" value="삭제"></a></td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div role="tabpanel" class="tab-pane fade" id="ex2">
				<table class="table table-hover" >
					<tr>
						<th>운동명</th>
						<c:choose>
							<c:when test="${grade<=2 }">
								<th width="50">수정</th>
								<th width="50">삭제</th>
							</c:when>
						</c:choose>	
					</tr>
					<c:forEach var="dto" items="${ex2 }" varStatus="vs">
						<tr>
							<td><a class="loadexer">${dto.exname }</a><span hidden="true">${dto.exnum }</span></td>
							<c:choose>
								<c:when test="${grade<=2 }">
									<td><a id="signup"><input type="button" value="수정" class="exupdate"><span hidden="true">${dto.exnum }</span></a></td>
									<td><a href="/exer/delete?exnum=${dto.exnum }"><input type="button" value="삭제"></a></td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div role="tabpanel" class="tab-pane fade" id="ex3">
				<table class="table table-hover" >
					<tr>
						<th>운동명</th>
						<c:choose>
							<c:when test="${grade<=2 }">
								<th width="50">수정</th>
								<th width="50">삭제</th>
							</c:when>
						</c:choose>	
					</tr>
					<c:forEach var="dto" items="${ex3 }" varStatus="vs">
						<tr>
							<td><a class="loadexer">${dto.exname }</a><span hidden="true">${dto.exnum }</span></td>
							<c:choose>
								<c:when test="${grade<=2 }">
									<td><a id="signup"><input type="button" value="수정" class="exupdate"><span hidden="true">${dto.exnum }</span></a></td>
									<td><a href="/exer/delete?exnum=${dto.exnum }"><input type="button" value="삭제"></a></td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div role="tabpanel" class="tab-pane fade" id="ex4">
				<table class="table table-hover" >
					<tr>
						<th>운동명</th>
						<c:choose>
							<c:when test="${grade<=2 }">
								<th width="50">수정</th>
								<th width="50">삭제</th>
							</c:when>
						</c:choose>	
					</tr>
					<c:forEach var="dto" items="${ex4 }" varStatus="vs">
						<tr>
							<td><a class="loadexer">${dto.exname }</a><span hidden="true">${dto.exnum }</span></td>
							<c:choose>
								<c:when test="${grade<=2 }">
									<td><a id="signup"><input type="button" value="수정" class="exupdate" ><span hidden="true">${dto.exnum }</span></a></td>
									<td><a href="/exer/delete?exnum=${dto.exnum }"><input type="button" value="삭제"></a></td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div role="tabpanel" class="tab-pane fade" id="ex5">
				<table class="table table-hover" >
					<tr>
						<th>운동명</th>
						<c:choose>
							<c:when test="${grade<=2 }">
								<th width="50">수정</th>
								<th width="50">삭제</th>
							</c:when>
						</c:choose>	
					</tr>
					<c:forEach var="dto" items="${ex5 }" varStatus="vs">
						<tr>
							<td><a class="loadexer">${dto.exname }</a><span hidden="true">${dto.exnum }</span></td>
							<c:choose>
								<c:when test="${grade<=2 }">
									<td><a id="signup"><input type="button" value="수정" class="exupdate"><span hidden="true">${dto.exnum }</span></a></td>
									<td><a href="/exer/delete?exnum=${dto.exnum }"><input type="button" value="삭제"></a></td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
			</div>
			</div>
			</div>
			</div>			
		</section>
		</div>
		

	
<div class="col-xs-8">	
<section class="panel">
<div class="panel-heading"> 운동효과 </div>
<div style="position: relative; overflow: hidden; width: auto; height: 550px;" class="slimScrollDiv">
			<div style="overflow: auto; width: auto; height: 530px;" class="panel-body" id="noti-box">
<div class="row">
	<div class="col-xs-7 text-center">
		<div style="float:top">
			<h3><span id="showexname" style="color:#8c8c8c"></span></h3>
		</div>
	
		<div>
			<canvas id="myChart" width="400" height="400"></canvas>
		</div>	
	</div>
	<div class="col-xs-5">
		<table class="table table-hover">
			<tr><td><label class="label label-primary">소모칼로리</label></td><td><span id="showcalo"></span></td></tr>
			<tr><td><label class="label label-primary">유산소</label></td><td><span id="showaero"></span></td></tr>
			<tr><td><label class="label label-primary">근력</label></td><td><span id="showstren"></span></td></tr>
			<tr><td><label class="label label-primary">지구력</label></td><td><span id="showsta"></span></td></tr>
			<tr><td colspan="2"><label class="label label-primary">운동설명</label><td></tr>
			<tr><td colspan="2"><span id="showexinfo"></span></td></tr>
			<c:choose>
				<c:when test="${grade<=2 }">
					<tr><td colspan="2" align="right">
						<a id="signup"><input type="button" value="운동추가" id="insertexer" class="btn btn-primary btn-sm"></a>
					</td></tr>
				</c:when>
			</c:choose>		
		</table>	
	</div>
</div>
</div>
</div>
</section>
</div>
</div>
</div>

<!-- 정보추가를 위한거지 -->
<div class="modal fade" id="insertexForm" role="dialog">
    <div class="modal-dialog">
    	<div class="modal-content">
       		<div class="modal-header" style="padding:35px 50px;">
        		<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4><span class="glyphicon glyphicon-list-alt"></span>운동정보추가하기</h4>
        	</div>
	        <div id="errorMsg" class="collapse">
	            <div class="alert alert-warning">
	              <span id="errorMsgComm"></span>
	 			</div>
			</div>
			<div class="modal-body" style="padding:40px 50px;">
			<!-- 운동추가폼 시작 -->
        	<form role="form" method="post" action="/exer/insert" id="exinsert">
        	<div class="form-group">
				<label for="exname">운동명 : </label>
					<input type="text" id="exnamei" name="exname" class="form-control"
						placeholder="Enter Name">
					<!-- 
					 <input type="hidden" id="exnum" name="exnum" value="0">
					 -->
					
			</div>
			<div class="form-group">
				<label ><span class="glyphicon glyphicon-ok-circle"></span>운동분류</label><br>
				<label class="radio-inline">
 					<input type="radio" name="exclass" class="optradio" value="1" checked="checked"> 가슴&어깨
  				</label>
				<label class="radio-inline">
					<input type="radio" name="exclass" class="optradio" value="2"> 팔
				</label>
				<label class="radio-inline">
					<input type="radio" name="exclass" class="optradio" value="3"> 등
				</label>
				<label class="radio-inline">
					<input type="radio" name="exclass" class="optradio" value="4"> 복부
				</label>
				<label class="radio-inline">
					<input type="radio" name="exclass" class="optradio" value="5"> 하체
				</label>
			</div>
			<div class="row">
				<div class="col-xd-6 col-sm-6 col-md-6">
					<div class="form-group">
						<span class="glyphicon glyphicon-arrow-up"></span><label for="calorie">칼로리소모 </label>
						<input type="text" id="calorie" name="calorie" class="form-control"
							placeholder="Enter Calorie"><br>
					</div>
			  	</div>
				<div class="col-xd-6 col-sm-6 col-md-6">
					<div class="form-group">
						<span class="glyphicon glyphicon-arrow-up"></span><label for="aero">유산소운동 효과 </label>
						<input type="text" id="aero" name="aero" class="form-control"
							placeholder="Enter Eero"><br>
					</div>
			  	</div>
			</div>
			<div class="row">
				<div class="col-xd-6 col-sm-6 col-md-6">
					<div class="form-group">
						<span class="glyphicon glyphicon-arrow-up"></span><label for="strength">근력운동 효과 </label>
						<input type="text" id="strength" name="strength" class="form-control"
							placeholder="Enter Strength"><br>
					</div>
			  	</div>
				<div class="col-xd-6 col-sm-6 col-md-6">
					<div class="form-group">
						<span class="glyphicon glyphicon-arrow-up"></span><label for="stamina">지구력증가 효과 </label>
						<input type="text" id="stamina" name="stamina" class="form-control"
							placeholder="Enter Stamina"><br>
					</div>
			  	</div>
			</div>
			<div class="form-group">
				<label for="uname"><span class="glyphicon glyphicon-pencil"></span>운동설명 : </label><br>
					<textarea rows="10" cols="50" id="exerinfo" name="exerinfo" class="form-control"
						placeholder="Enter Infomation"></textarea>
			</div>
        	<button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>추가하기</button>
			</form>
			</div>
			<div class="modal-footer">
          		<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 취소</button>
        	</div>	
		</div>
	</div>
</div>
<!-- -------------------------------------------------------------------------- -->
<!-- 정보수정를 위한거지 -->

<div class="modal fade" id="updateexForm" role="dialog">
    <div class="modal-dialog">
    	<div class="modal-content">
       		<div class="modal-header" style="padding:35px 50px;">
        		<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4><span class="glyphicon glyphicon-list-alt"></span>운동정보수정하기</h4>
        	</div>
	        <div id="uerrorMsg" class="collapse">
	            <div class="alert alert-warning">
	              <span id="uerrorMsgComm"></span>
	 			</div>
			</div>
			<div class="modal-body" style="padding:40px 50px;">
			<!-- 운동추가폼 시작 -->
        	<form role="form" method="post" action="/exer/update" id="updateex">
        	<div class="form-group">
				<label for="exname">운동명 : </label>
					<input type="text" id="uexname" name="exname" class="form-control"
						placeholder="Enter Name">
					<input type="hidden" id="uexnum" name="exnum">
			</div>
			<div class="form-group">
				<label ><span class="glyphicon glyphicon-ok-circle"></span>운동분류</label><br>
				<label class="radio-inline">
 					<input type="radio" name="exclass" class="optradio" value="1" checked="checked"> 가슴&어깨
  				</label>
				<label class="radio-inline">
					<input type="radio" name="exclass" class="optradio" value="2"> 팔
				</label>
				<label class="radio-inline">
					<input type="radio" name="exclass" class="optradio" value="3"> 등
				</label>
				<label class="radio-inline">
					<input type="radio" name="exclass" class="optradio" value="4"> 복부
				</label>
				<label class="radio-inline">
					<input type="radio" name="exclass" class="optradio" value="5"> 하체
				</label>
			</div>
			<div class="row">
				<div class="col-xd-6 col-sm-6 col-md-6">
					<div class="form-group">
						<span class="glyphicon glyphicon-arrow-up"></span><label for="calorie">칼로리소모 </label><input type="text" id="ucalo" name="calorie" class="form-control"
							placeholder="Enter Calorie"><br>
					</div>
			  	</div>
				<div class="col-xd-6 col-sm-6 col-md-6">
					<div class="form-group">
						<span class="glyphicon glyphicon-arrow-up"></span><label for="aero">유산소운동 효과 </label><input type="text" id="uaero" name="aero" class="form-control"
							placeholder="Enter Eero"><br>
					</div>
			  	</div>
			</div>
			<div class="row">
				<div class="col-xd-6 col-sm-6 col-md-6">
					<div class="form-group">
						<span class="glyphicon glyphicon-arrow-up"></span><label for="strength">근력운동 효과 </label><input type="text" id="ustren" name="strength" class="form-control"
							placeholder="Enter Strength"><br>
					</div>
			  	</div>
				<div class="col-xd-6 col-sm-6 col-md-6">
					<div class="form-group">
						<span class="glyphicon glyphicon-arrow-up"></span><label for="stamina">지구력증가 효과 </label><input type="text" id="usta" name="stamina" class="form-control"
							placeholder="Enter Stamina"><br>
					</div>
			  	</div>
			</div>
			<div class="form-group">
				<label for="uname"><span class="glyphicon glyphicon-pencil"></span>운동설명 : </label><br>
					<textarea rows="10" cols="50" id="uexerinfo" name="exerinfo" class="form-control"
						placeholder="Enter Infomation"></textarea>
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









