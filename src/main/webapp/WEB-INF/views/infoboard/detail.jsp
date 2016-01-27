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
		var ifnum=${dto.ifnum}
		var id=$("#id").val();
		var comments=$("#comments").val().replace(/\n/g, '<br>');
		var icref=$("#icref").val();
		var iclev=$("#iclev").val();
		var icstep=$("#icstep").val();
		var icnum=$("#icnum").val();
		if(comments==''){
			alert("내용을 입력해 주세요");
			return;
		}
		if(icnum==""){
			icnum=0;
		}
		if(icref==""){
			icref=0;
		}
		if(iclev==""){
			iclev=0;
		}
		if(icstep==""){
			icstep=0;
		}
		$.ajax({
			url:"/infoboard/detail/icinsert?ifnum="+ifnum+"&id="+id+"&comments="+comments+"&icref="+icref+"&iclev="+iclev+"&icstep="+icstep+"&icnum="+icnum,
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
	$("#list").on("click","a.icdel",function(){
		var ifnum=${dto.ifnum}
		var icnum=$(this).parent().find("span.icnum").text();
		$.ajax({
			url:"/infoboard/detail/icdelete?icnum="+icnum,
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
	$("#list").on("click","a.icrep",function(event){
		event.preventDefault();
		var ifnum=${dto.ifnum}
		var comments=$(this).parent().find("span.comments").text();
		var icnum=$(this).parent().find("span.icnum").text();
		var icref=$(this).parent().find("span.icref").text();
		var iclev=$(this).parent().find("span.iclev").text();
		var icstep=$(this).parent().find("span.icstep").text();
		$("#commRe").modal();
		
		$("#icnum1").prop('value',icnum);
		$("#icref1").prop('value',icref); 
		$("#iclev1").prop('value',iclev);
		$("#icstep1").prop('value',icstep);	
	});
	$("#list").on("click","a.icupdate",function(event){
		event.preventDefault();
		var ifnum=${dto.ifnum}
		var icnum=$(this).parent().find("span.icnum").text();
		var comments=$(this).parent().find("span.comments").text();
		
		$("#commUp").modal();
		$("#icnum2").prop('value',icnum);
		$("#comments2").prop('value',comments);	
	});
	$("#btnrep").click(function(){		
		var ifnum=${dto.ifnum}
		var id=$("#id1").val();
		var comments=$("#comments1").val().replace(/\n/g, '<br>');
		var icref=$("#icref1").val();
		var iclev=$("#iclev1").val();
		var icstep=$("#icstep1").val();
		var icnum=$("#icnum1").val();
		$.ajax({
			url:"/infoboard/detail/icinsert?ifnum="+ifnum+"&id="+id+"&comments="+comments+"&icref="+icref+"&iclev="+iclev+"&icstep="+icstep+"&icnum="+icnum,
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
		var icnum=$("#icnum2").val();
		
		$.ajax({
			url:"/infoboard/detail/icupdate?icnum="+icnum+"&comments="+comments,
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
	var ifnum=${dto.ifnum}
	$.ajax({
		url:"/infoboard/detail/iclist?ifnum="+ifnum+"&pageNum="+pageNum+"&sid="+sid,
		dataType:"xml",
		success:function(data){
			var startPage;
			var endPage;
			var pageNum;
			var pageCount;
			$(data).find("comment").each(function(){
				var icnum=$(this).find("icnum").text();
				var id=$(this).find("id").text();
				var comments=$(this).find("comments").text();
				var icref=$(this).find("icref").text();
				var iclev=$(this).find("iclev").text();
				var icstep=$(this).find("icstep").text();
				var regdate=$(this).find("regdate").text();
				var savefile=$(this).find("savefile").text();
				startPage=$(this).find("startPage").text();
				endPage=$(this).find("endPage").text();
				pageNum=$(this).find("pageNum").text();
				pageCount=$(this).find("pageCount").text();
				comments=decodeURIComponent(comments);
				if(sid==''){
					if(iclev>0){
						var a="";
						var b="↘"
						for(var j=0;j<iclev;j++){
							a+="&nbsp;&nbsp;";
							
						}
						$("#list").append("<div class='panel-heading'><span>"+a+b
								+"<img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"
								+id+"</span></div><div class='panel-body'>"+a+a+"<span class='comments'>"+comments+"</span><br>"
							+a+a+regdate+"<span style='display:none' class='icnum'>"
								+icnum+"</span><span style='display:none' class='icref'>"
								+icref+"</span><span style='display:none' class='iclev'>"
								+iclev+"</span><span style='display:none' class='icstep'>"+icstep+"</span></div>");	
					}else{
					$("#list").append("<div class='panel-heading'><img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"
							+id+"</div><div class='panel-body'><span class='comments'>"+comments+"</span><br>"
							+regdate+"<span style='display:none' class='icnum'>"
						+icnum+"</span><span style='display:none' class='icref'>"
						+icref+"</span><span style='display:none' class='iclev'>"
						+iclev+"</span><span style='display:none' class='icstep'>"+icstep+"</span></div>")
					}
				}else if(id==sid){
					if(iclev>0){
						var a="";
						var b="↘"
						for(var j=0;j<iclev;j++){
							a+="&nbsp;&nbsp;";
							
						}
						
						$("#list").append("<div class='panel-heading'><span>"+a+b
								+"<img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"
								+id+"</span></div><div class='panel-body'>"+a+a+"<span class='comments'>"+comments+"</span><br>"
								+a+a+regdate+"<a href='' class='icdel'>삭제</a><a href='' class='icrep'>답글</a><a href='' class='icupdate'>수정</a><span style='display:none' class='icnum'>"
								+icnum+"</span><span style='display:none' class='icref'>"
								+icref+"</span><span style='display:none' class='iclev'>"
								+iclev+"</span><span style='display:none' class='icstep'>"+icstep+"</span></div>");	
					}else{
					$("#list").append("<div class='panel-heading'>"
							+"<img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"
							+id+"</div><div class='panel-body'><span class='comments'>"+comments+"</span><br>"
						+regdate+"<a href='' class='icdel'>삭제</a><a href='' class='icrep'>답글</a><a href='' class='icupdate'>수정</a><span style='display:none' class='icnum'>"
						+icnum+"</span><span style='display:none' class='icref'>"
						+icref+"</span><span style='display:none' class='iclev'>"
						+iclev+"</span><span style='display:none' class='icstep'>"+icstep+"</span></div>")
					}
				}else{
					if(iclev>0){
						var a="";
						var b="↘"
						for(var j=0;j<iclev;j++){
							a+="&nbsp;&nbsp;";
							
						}
						
						$("#list").append("<div class='panel-heading'><span>"+a+b+
								"<img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"+id
								+"</span></div><div class='panel-body'>"
								+a+a+"<span class='comments'>"+comments+"</span><br>"
								+a+a+regdate+"<a href='' class='icrep'>답글</a><span style='display:none' class='icnum'>"
								+icnum+"</span><span style='display:none' class='icref'>"
								+icref+"</span><span style='display:none' class='iclev'>"
								+iclev+"</span><span style='display:none' class='icstep'>"+qcstep+"</span></div>");	
					}else{
					$("#list").append("<div class='panel-heading'>"
							+"<img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"+id
							+"</div><div class='panel-body'>"
							+"<br><span class='comments'>"+comments+"</span><br>"
								+regdate+"<br><a href='' class='icrep'>답글</a><span style='display:none' class='icnum'>"
						+icnum+"</span><span style='display:none' class='icref'>"
						+icref+"</span><span style='display:none' class='iclev'>"
						+iclev+"</span><span style='display:none' class='icstep'>"+icstep+"</span></div>")
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
//삭제 확인
var btndeleteifb = function(num){
	console.log("삭제버튼" +num);
	$('#confirmremoveifb').modal('show');
	//
	$('#btndeleteifb').click(function(){
		location.href="/infoboard/delete?ifnum="+num;
	});
	$('#btncancel').click(function(){
		$('#confirmremoveifb').modal('hide');
	});
}

</script> 

<div style="background-color: #ffffff;">
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
		<td><a href="/infoboard/detail?ifnum=${next.ifnum }">다음글:${next.title }</a></td>
		</c:otherwise>
	</c:choose>
		
	</tr>
	<tr>
		<c:choose>
		<c:when test="${empty prev.title  }">	
		 </c:when>
	 	<c:otherwise>
		<td><a href="/infoboard/detail?ifnum=${prev.ifnum }">이전글:${prev.title }</a></td>
		</c:otherwise>
	</c:choose>
	</tr>
	<tr>
		<td>
		<c:choose>
		<c:when test="${dto.id==id }">
		<a onclick="btndeleteifb(${dto.ifnum })" class="btn btn-primary btn-xs" role="button">삭제</a>
		<a href="/infoboard/update?ifnum=${dto.ifnum }" class="btn btn-primary btn-xs" role="button">수정</a>
		</c:when> 
		</c:choose>
		<a href="/infoboard/plist" class="btn btn-primary btn-xs" role="button">목록</a>
		</td>	
	</tr>	
</table>

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
	<input type="hidden" id="icref1"><input type="hidden" id="icnum1" >
<input type="hidden" id="iclev1"><input type="hidden" id="icstep1">
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
        	<input type="hidden" id="icnum2" >
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
	<input type="hidden" id="icnum1" >
<input type="hidden" id="id1" value="${id }"><br>
	<a href="#"><img src='/resources/userphoto/${savefile }' class='img-circle' style='height:45px;width:45px'>${id }</a><br>
	<textarea id="comments1" rows="3" cols="60" style="width: 70%"></textarea><br>
	<input type="hidden" id="icref1">
<input type="hidden" id="iclev1"><input type="hidden" id="icstep1">
	<input type="button" value="덧글등록" id="btnrep"><input type="button" value="취소" id="btnrep1">
</div>
<div id="commUp" style='padding:5px; width: 100%; border: 1px solid gray; display: none'>
	<input type="hidden" id="icnum2" >
	<a href="#"><img src='/resources/userphoto/${savefile }' class='img-circle' style='height:45px;width:45px'>${id }</a><br>
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

<input type="hidden" id="id" value="${id }">
<a href="#"><img src='/resources/userphoto/${savefile }' class='img-circle' style='height:45px;width:45px'>${id }</a><br>
<textarea rows="3" cols="60" id="comments" style="width: 70%"></textarea>
	<c:choose>
	<c:when test="${empty id }">
	 	 로그인 후 글작성
	 </c:when>
	 <c:otherwise>
		<input type="button" value="덧글등록" id="btnadd">
	</c:otherwise>
	</c:choose>
<input type="hidden" id="icnum"><input type="hidden" id="iclev"><input type="hidden" id="icref">
<input type="hidden" id="icstep">
</div>
<div id="page"></div>
</div>
<div style="height: 100px;"></div>
<!-- 삭제 확인버튼 -->
<div id="confirmremoveifb" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">
    	<div class="panel panel-danger">
		  <div class="panel-heading">
		  <div class="panel-body"><strong>경고!!</strong><br/>글을 삭제 하시겠습니까?</div></div>
		  <div class="panel-footer text-center">
		    <button class="btn btn-danger glyphicon glyphicon-ok" id="btndeleteifb">삭제하기</button>
		    <button class="btn btn-info glyphicon glyphicon-remove" id="btncancel">취소</button>
		  </div>
		</div>
  </div>
</div>