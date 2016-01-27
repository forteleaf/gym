<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/iCheck/all.css" rel="stylesheet" type="text/css" />

<style>
  .bg-info {
    background: rgba(0, 0, 0, 0.5) none repeat scroll 0% 0%;
    text-align: left;
  }
</style>
<script>
 $(function(){
	// 우수회원 받아오기
	$.getJSON('/analysize/getBestInstructor', function(data) {
		$('#bestimage').attr({"src":"/resources/userphoto/"+data.savefile});
		$('#userscount').html(data.name);
	});
	// 수익, 인원
	$.getJSON('/analysize/mathSales',function(data){
		$('#cntUsers').html(data.cntUsers);
		$('#cntTrainer').html(data.cntTrainer);
		$('#mathAllSales').html(((data.cntUsers * 100000) - data.trainerSal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ " 원");
	});
 });
</script>
<div class="row" style="margin-bottom: 5px;">
	<div class="col-md-3">
		<div class="sm-st clearfix">
			<span class="sm-st-icon st-red"><img id="bestimage"></span>
			<div class="sm-st-info">
				<span><span id="userscount"></span></span> 우수 사원
			</div>
		</div>
	</div>
	<div class="col-md-3">
		<div class="sm-st clearfix">
			<span class="sm-st-icon st-violet"><i class="glyphicon glyphicon-usd"></i></span>
			<div class="sm-st-info">
				<span id="mathAllSales"></span> 총매출
			</div>
		</div>
	</div>
	<div class="col-md-3">
		<div class="sm-st clearfix">
			<span class="sm-st-icon st-blue"><i class="glyphicon glyphicon-user"></i></span>
			<div class="sm-st-info">
				<span id="cntUsers"></span> 회원수
			</div>
		</div>
	</div>
	<div class="col-md-3">
		<div class="sm-st clearfix">
			<span class="sm-st-icon st-green"><i class="glyphicon glyphicon-knight"></i></span>
			<div class="sm-st-info">
				<span id="cntTrainer"></span> 트레이너수
			</div>
		</div>
	</div>
</div>
<div class="row">
  <div class="col-xs-8">
  <section class="panel bg-success">
	<div class="panel-heading"> 직원별 급여 </div>
		<div class="panel-body">
			<div style="width:700">
			<jsp:include page="/WEB-INF/views/admin/payinfo.jsp"></jsp:include>
			</div>
		</div>
	</section>
    <div class="">
    </div>
  </div>
  
  <!-- 오른쪽 QNA 게시판 알림 -->
  <div class="col-xs-4">
    <section class="panel">
        <header class="panel-heading">
            문의 사항들 <span class="badge badge-important"><span id="qnacnt">10</span></span>
        </header>
        <div style="position: relative; overflow: hidden; width: auto; height: 434px;" class="slimScrollDiv">
          <div style="overflow: auto; width: auto; height: 400px;" class="panel-body" id="noti-box">
          <c:forEach var="qnalist" items="${qnalist }" >
            <div class="alert alert-success">
                <button data-dismiss="alert" class="close close-sm" type="button">
                    <i class="fa fa-times"></i>
                </button>
                <a href="/qna/detail?qnanum=${qnalist.qnanum}&sid=${id}">
                <strong><label class="label label-primary">qna</label></strong> ${qnalist.title } <small>-- ${qnalist.regdate }</small>
                </a>
            </div>
          </c:forEach>
        </div><div style="background: rgb(0, 0, 0) none repeat scroll 0% 0%; width: 5px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 5px; z-index: 99; right: 1px; height: 217.687px;" class="slimScrollBar"></div><div style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 5px; background: rgb(51, 51, 51) none repeat scroll 0% 0%; opacity: 0.2; z-index: 90; right: 1px;" class="slimScrollRail"></div></div>
    </section>
    </div>
  </div>
