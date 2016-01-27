<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.min.css">
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	var pageNum;	
	list(1);
	$("#btnadd").click(function(){		
		var fbnum=${dto.fbnum}
		var id=$("#id").val();
		var comments=$("#comments").val().replace(/\n/g, '<br>');
		var fcref=$("#fcref").val();
		var fclev=$("#fclev").val();
		var fcstep=$("#fcstep").val();
		var fcnum=$("#fcnum").val();
		if(comments==''){
			alert("내용을 입력해 주세요");
			return;
		}
		if(fcnum==""){
			fcnum=0;
		}
		if(fcref==""){
			fcref=0;
		}
		if(fclev==""){
			fclev=0;
		}
		if(fcstep==""){
			fcstep=0;
		}
		$.ajax({
			url:"/fboard/detail/fcinsert?fbnum="+fbnum+"&id="+id+"&comments="+comments+"&fcref="+fcref+"&fclev="+fclev+"&fcstep="+fcstep+"&fcnum="+fcnum,
				success:function(data){
				if($(data).find("info").text()=="success"){
					alert("글 등록 성공!");
					$("#list").children().each(function(){
						$("#list").children().remove();
					});
					list();
					$("#comments").val("");
				}else{
					alert("글 등록 실패!");
				}
			}
		});
	});	
	$("#list").on("click","a.fcdel",function(){
		var fbnum=${dto.fbnum}
		var fcnum=$(this).parent().find("span.fcnum").text();
		$.ajax({
			url:"/fboard/detail/fcdelete?fcnum="+fcnum,
			success:function(data){
				if($(data).find("info").text()=="success"){
					alert("글 삭제 성공!");
					list();
				}else{
					alert("글 삭제 실패!");
				}
			}
		});
		
	});
	$("#list").on("click","a.fcrep",function(event){
		event.preventDefault();
		var fbnum=${dto.fbnum}
		var fcnum=$(this).parent().find("span.fcnum").text();
		var fcref=$(this).parent().find("span.fcref").text();
		var fclev=$(this).parent().find("span.fclev").text();
		var fcstep=$(this).parent().find("span.fcstep").text();
		$("#commRe").modal();
		$("#fcnum1").prop('value',fcnum);
		$("#fcref1").prop('value',fcref); 
		$("#fclev1").prop('value',fclev);
		$("#fcstep1").prop('value',fcstep);	
	});
	$("#list").on("click","a.fcupdate",function(event){
		event.preventDefault();
		var fbnum=${dto.fbnum}
		var fcnum=$(this).parent().find("span.fcnum").text();
		var comments=$(this).parent().find("span.comments").text();
		$("#commUp").modal();
		$("#fcnum2").prop('value',fcnum);
		$("#comments2").prop('value',comments);	
	});
	$("#btnrep").click(function(){		
		var fbnum=${dto.fbnum}
		var id=$("#id1").val();
		
		var comments=$("#comments1").val().replace(/\n/g, '<br>');
		var fcref=$("#fcref1").val();
		var fclev=$("#fclev1").val();
		var fcstep=$("#fcstep1").val();
		var fcnum=$("#fcnum1").val();
		$.ajax({
			url:"/fboard/detail/fcinsert?fbnum="+fbnum+"&id="+id+"&comments="+comments+"&fcref="+fcref+"&fclev="+fclev+"&fcstep="+fcstep+"&fcnum="+fcnum,
				success:function(data){
				if($(data).find("info").text()=="success"){
					alert("글 등록 성공!");
					$("#list").children().each(function(){
						$("#list").children().remove();
					});
					list();
					$("#comments1").val("");
					event.preventDefault();
					$("#commRe").modal("hide");
				}else{
					alert("글 등록 실패!");
				}
			}
		});
	});
	$("#btnup").click(function(){		
		
		var comments=$("#comments2").val().replace(/\n/g, '<br>');
		var fcnum=$("#fcnum2").val();
		
		$.ajax({
			url:"/fboard/detail/fcupdate?fcnum="+fcnum+"&comments="+comments,
				success:function(data){
				if($(data).find("info").text()=="success"){
					alert("글 등록 성공!");
					$("#list").children().each(function(){
						$("#list").children().remove();
					});
					list();
					$("#comments2").val("");
					event.preventDefault();
					$("#commUp").modal("hide");
				}else{
					alert("글 등록 실패!");
				}
			}
		});
	});	
	$("#btnup1").click(function(){
		event.preventDefault();
		$("#commUp").modal("hide");
	});
	$("#btnrep1").click(function(){
		event.preventDefault();
		$("#commRe").modal("hide");
	});	
});
function list(pageNum){
	$("#list").children().remove();
	$("#page").children().remove();
	if(pageNum==null){
		pageNum=1;
	}
	var sid='${id}';
	var fbnum=${dto.fbnum}
	$.ajax({
		url:"/fboard/detail/fclist?fbnum="+fbnum+"&pageNum="+pageNum+"&sid="+sid,
		dataType:"xml",
		success:function(data){
			var startPage;
			var endPage;
			var pageNum;
			var pageCount;
			$(data).find("comment").each(function(){
				var fcnum=$(this).find("fcnum").text();
				var id=$(this).find("id").text();
				var comments=$(this).find("comments").text();
				var fcref=$(this).find("fcref").text();
				var fclev=$(this).find("fclev").text();
				var fcstep=$(this).find("fcstep").text();
				var regdate=$(this).find("regdate").text();
				var savefile=$(this).find("savefile").text();
				startPage=$(this).find("startPage").text();
				endPage=$(this).find("endPage").text();
				pageNum=$(this).find("pageNum").text();
				pageCount=$(this).find("pageCount").text();
				comments=decodeURIComponent(comments);
				if(sid==''){
					if(fclev>0){
						var a="";
						var b="↘"
						for(var j=0;j<fclev;j++){
							a+="&nbsp;&nbsp;";
							
						}
						$("#list").append("<div class='panel-heading'><span>"+a+b
								+"<img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"
								+id+"</span></div><div class='panel-body'>"+a+a+"<span class='comments'>"+comments+"</span><br>"
							+a+a+regdate+"<span style='display:none' class='fcnum'>"
								+fcnum+"</span><span style='display:none' class='fcref'>"
								+fcref+"</span><span style='display:none' class='fclev'>"
								+fclev+"</span><span style='display:none' class='fcstep'>"+fcstep+"</span></div>");	
					}else{
					$("#list").append("<div class='panel-heading'><img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"
							+id+"</div><div class='panel-body'><span class='comments'>"+comments+"</span><br>"
							+regdate+"<span style='display:none' class='fcnum'>"
						+fcnum+"</span><span style='display:none' class='fcref'>"
						+fcref+"</span><span style='display:none' class='fclev'>"
						+fclev+"</span><span style='display:none' class='fcstep'>"+fcstep+"</span></div>")
					}
				}else if(id==sid){
					if(fclev>0){
						var a="";
						var b="↘"
						for(var j=0;j<fclev;j++){
							a+="&nbsp;&nbsp;";
							
						}
						$("#list").append("<div class='panel-heading'><span>"+a+b
								+"<img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"
								+id+"</span></div><div class='panel-body'>"+a+a+"<span class='comments'>"+comments+"</span><br>"
								+a+a+regdate+"<a href='' class='fcdel'>삭제</a><a href='' class='fcrep'>답글</a><a href='' class='fcupdate'>수정</a><span style='display:none' class='fcnum'>"
								+fcnum+"</span><span style='display:none' class='fcref'>"
								+fcref+"</span><span style='display:none' class='fclev'>"
								+fclev+"</span><span style='display:none' class='fcstep'>"+fcstep+"</span></div>");	
					}else{
					$("#list").append("<div class='panel-heading'>"
							+"<img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"
							+id+"</div><div class='panel-body'><span class='comments'>"+comments+"</span><br>"
						+regdate+"<a href='' class='fcdel'>삭제</a><a href='' class='fcrep'>답글</a><a href='' class='fcupdate'>수정</a><span style='display:none' class='fcnum'>"
						+fcnum+"</span><span style='display:none' class='fcref'>"
						+fcref+"</span><span style='display:none' class='fclev'>"
						+fclev+"</span><span style='display:none' class='fcstep'>"+fcstep+"</span></div>")
					}
				}else{
					if(fclev>0){
						var a="";
						var b="↘"
						for(var j=0;j<fclev;j++){
							a+="&nbsp;&nbsp;";
							
						}
						$("#list").append("<div class='panel-heading'><span>"+a+b+
								"<img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"+id
								+"</span></div><div class='panel-body'>"
								+a+a+"<span class='comments'>"+comments+"</span><br>"
								+a+a+regdate+"<a href='' class='fcrep'>답글</a><span style='display:none' class='fcnum'>"
								+fcnum+"</span><span style='display:none' class='fcref'>"
								+fcref+"</span><span style='display:none' class='fclev'>"
								+fclev+"</span><span style='display:none' class='fcstep'>"+fcstep+"</span></div>");	
					}else{
					$("#list").append("<div class='panel-heading'>"
							+"<img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"+id
							+"</div><div class='panel-body'>"
							+"<br><span class='comments'>"+comments+"</span><br>"
								+regdate+"<br><a href='' class='fcrep'>답글</a><span style='display:none' class='fcnum'>"
						+fcnum+"</span><span style='display:none' class='fcref'>"
						+fcref+"</span><span style='display:none' class='fclev'>"
						+fclev+"</span><span style='display:none' class='fcstep'>"+fcstep+"</span></div>")
					}
				}
				
			});
			var bapage=startPage-1;
			var fopage=endPage+1;
			if(startPage>=11){
				$("#page").append("<a href='javascript:list("+bapage+")'>[이전]</a>")
			}
			for(var i=startPage;i<=endPage;i++){
				$("#page").append("<a href='javascript:list("+i+")'>["+i+"]</a>")
			}
			if(endPage<pageCount){
				$("#page").append("<a href='javascript:list("+fopage+")'>[다음]</a>")
			}
		}
		
	
	});
	
}
var btndeletefb = function(num){
	console.log("삭제버튼" +num);
	$('#confirmremovefb').modal('show');
	//
	$('#btndeletefb').click(function(){
		location.href="/fboard/delete?fbnum="+num;
	});
	$('#btncancel').click(function(){
		$('#confirmremovefb').modal('hide');
	});
}


</script> 

<div style="background-color: #ffffff;">
<div>
<table  width="1000"table class="table table-hover">
	<tr>
		
		<td><div align="left"><h2><small>${dto.title }</small></h2></div><div align="right">조회수:${dto.hit }</div></td>
	</tr>
	<tr>
	
		<td>
		<div >
			<div>${dto.content }</div>
			<div style="float: right"><img src='/resources/userphoto/${savefile }' class="img-rounded" style='height:70px;'></div>
			<div style="float: right">등록자:${dto.id }<br>등록일:${dto.regdate }</div>					
		</div>
		</td>
	</tr>
	<tr>
		<c:choose>
		<c:when test="${empty next.title  }">
	 	
	 	</c:when>
	 <c:otherwise>
		 <td><a href="/fboard/detail?fbnum=${next.fbnum }">다음글:${next.title }</a></td>
		</c:otherwise>
	</c:choose>
		
	</tr>
	<tr>
		<c:choose>
		<c:when test="${empty prev.title  }">
	 	
	 </c:when>
	 <c:otherwise>
		<td><a href="/fboard/detail?fbnum=${prev.fbnum }">이전글:${prev.title }</a></td>
		</c:otherwise>
	</c:choose>
		
	</tr>
	<tr>
		<td>
		<c:choose>
		<c:when test="${dto.id==id }">
		<a onclick="btndeletefb(${dto.fbnum })" class="btn btn-primary btn-xs" role="button">삭제</a>
		<a href="/fboard/update?fbnum=${dto.fbnum }" class="btn btn-primary btn-xs" role="button">수정</a>
		</c:when> 
		</c:choose>
		<a href="/fboard/plist" class="btn btn-primary btn-xs" role="button">목록</a>	
		</td>
	</tr>	
</table>
</div>

<!-- 리플/수정 ver.modal -->
<div class="modal fade" id="commRe" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="panel panel-default">
        <div class="panel-heading">
        	<input type="hidden" id="id1" value="${id }">
			<a href="#"><img src='/resources/userphoto/${savefile1}' class='img-circle' style='height:45px;width:45px'>${id }</a>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="panel-body">
          <textarea id="comments1" rows="3" cols="60" style="width: 70%"></textarea><br>
	<input type="hidden" id="fcref1"><input type="hidden" id="fcnum1" >
<input type="hidden" id="fclev1"><input type="hidden" id="fcstep1">
        </div>
        <div class="panel-footer text-center">
         <input type="button" value="덧글등록" id="btnrep">
         <input type="button" value="취소" id="btnrep1">
        </div>
      </div>
    </div>
  </div>
<div class="modal fade" id="commUp" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="panel panel-default">
        <div class="panel-heading">
        	<input type="hidden" id="fcnum2" >
	<a href="#"><img src='/resources/userphoto/${savefile1 }' class='img-circle' style='height:45px;width:45px'>${id }</a>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="panel-body">
          <textarea id="comments2" rows="3" cols="60" style="width: 70%"></textarea><br>
	
        </div>
        <div class="panel-footer text-center">
         <input type="button" value="수정" id="btnup">
         <input type="button" value="취소" id="btnup1">
        </div>
      </div>
    </div>
  </div>


<!-- 
<div id="commRe" style='padding:5px; width: 100%; border: 1px solid gray; display: none'>
	<input type="hidden" id="fcnum1" >
<input type="hidden" id="id1" value="${id }"><br>
	<a href="#"><img src='/resources/userphoto/${savefile1 }' class='img-circle' style='height:45px;width:45px'>${id }</a><br>
	<textarea id="comments1" rows="3" cols="60" style="width: 70%"></textarea><br>
	<input type="hidden" id="fcref1">
<input type="hidden" id="fclev1"><input type="hidden" id="fcstep1">
	<input type="button" value="덧글등록" id="btnrep"><input type="button" value="취소" id="btnrep1">
</div>
<div id="commUp" style='padding:5px; width: 100%; border: 1px solid gray; display: none'>
	<input type="hidden" id="fcnum2" >
	<a href="#"><img src='/resources/userphoto/${savefile1 }' class='img-circle' style='height:45px;width:45px'>${id }</a><br>
	<textarea id="comments2" rows="3" cols="60" style="width: 70%"></textarea><br>
	<input type="button" value="덧글등록" id="btnup"><input type="button" value="취소" id="btnup1">
</div>
 -->
<div id="list" class="panel panel-default"></div>
<c:choose>
	<c:when test="${empty id }"> 	 
	 </c:when>
	 <c:otherwise>
		<button data-toggle="collapse" data-target="#comm" class="btn-primary btn-xs">댓글등록</button>
	</c:otherwise>
	</c:choose>

<div style='padding:5px; width: 100%; border: 1px solid gray' id="comm" class="collapse">

<input type="hidden" id="id" value="${id }" >
<a href="#"><img src='/resources/userphoto/${savefile1 }' class='img-circle' style='height:45px;width:45px'>${id }</a><br>
<textarea rows="3" cols="60" id="comments" style="width: 70%"></textarea>
<c:choose>
	<c:when test="${empty id }">
	 	 로그인 후 글작성
	 </c:when>
	 <c:otherwise>
		<input type="button" value="덧글등록" id="btnadd">
	</c:otherwise>
	</c:choose>
<input type="hidden" id="fcnum"><input type="hidden" id="fclev"><input type="hidden" id="fcref">
<input type="hidden" id="fcstep">
</div>
<div id="page"></div>
</div>
<div style="height: 100px;"></div>
<!-- 삭제 확인버튼 -->
<div id="confirmremovefb" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">
    	<div class="panel panel-danger">
		  <div class="panel-heading">
		  <div class="panel-body"><strong>경고!!</strong><br/>글을 삭제 하시겠습니까?</div></div>
		  <div class="panel-footer text-center">
		    <button class="btn btn-danger glyphicon glyphicon-ok" id="btndeletefb">삭제하기</button>
		    <button class="btn btn-info glyphicon glyphicon-remove" id="btncancel">취소</button>
		  </div>
		</div>
  </div>
</div>