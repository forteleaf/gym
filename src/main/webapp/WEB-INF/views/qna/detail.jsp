<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.min.css">
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<style type="text/css">
	
</style>
<script type="text/javascript">
$(document).ready(function(){
	var pageNum;	
	list(1);
	$("#btnadd").click(function(){		
		var qnanum=${dto.qnanum}
		var id=$("#id").val();
		var comments=$("#comments").val().replace(/\n/g, '<br>');
		
		var qcref=$("#qcref").val();
		var qclev=$("#qclev").val();
		var qcstep=$("#qcstep").val();
		var qcnum=$("#qcnum").val();
		if(comments==''){
			alert("내용을 입력해 주세요");
			return;
		}
		if(qcnum==""){
			qcnum=0;
		}
		if(qcref==""){
			qcref=0;
		}
		if(qclev==""){
			qclev=0;
		}
		if(qcstep==""){
			qcstep=0;
		}
		$.ajax({
			url:"/qna/detail/qcinsert?qnanum="+qnanum+"&id="+id+"&comments="+comments+"&qcref="+qcref+"&qclev="+qclev+"&qcstep="+qcstep+"&qcnum="+qcnum,
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
	// 삭제하기 이벤트
	$("#list").on("click","a.qcdel",function(){
		var qnanum=${dto.qnanum}
		var qcnum=$(this).parent().find("span.qcnum").text();
		
			$.ajax({
				url:"/qna/detail/qcdelete?qcnum="+qcnum,
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
	$("#list").on("click","a.qcrep",function(event){
		event.preventDefault();
		var qnanum=${dto.qnanum}
		var qcnum=$(this).parent().find("span.qcnum").text();
		var qcref=$(this).parent().find("span.qcref").text();
		var qclev=$(this).parent().find("span.qclev").text();
		var qcstep=$(this).parent().find("span.qcstep").text();
		$("#commRe").modal();
		$("#qcnum1").prop('value',qcnum);
		$("#qcref1").prop('value',qcref); 
		$("#qclev1").prop('value',qclev);
		$("#qcstep1").prop('value',qcstep);	
	});
	$("#list").on("click","a.qcupdate",function(event){
		event.preventDefault();
		var qnanum=${dto.qnanum}
		var qcnum=$(this).parent().find("span.qcnum").text();
		var comments=$(this).parent().find("span.comments").text();
		
		$("#commUp").modal();
		$("#qcnum2").prop('value',qcnum);
		$("#comments2").prop('value',comments);	
	});
	$("#btnrep").click(function(){		
		var qnanum=${dto.qnanum}
		var id=$("#id1").val();
		var comments=$("#comments1").val().replace(/\n/g, '<br>');
		var qcref=$("#qcref1").val();
		var qclev=$("#qclev1").val();
		var qcstep=$("#qcstep1").val();
		var qcnum=$("#qcnum1").val();
		if(comments==''){
			alert("내용을 입력해 주세요");
			return;
		}
		$.ajax({
			url:"/qna/detail/qcinsert?qnanum="+qnanum+"&id="+id+"&comments="+comments+"&qcref="+qcref+"&qclev="+qclev+"&qcstep="+qcstep+"&qcnum="+qcnum,
				success:function(data){
				if($(data).find("info").text()=="success"){
					alert("글 등록 성공!");
					$("#list").children().each(function(){
						$("#list").children().remove();
					});
					list();
					$("#comments1").val("");
					$("#commRe").modal("hide");
				}else{
					alert("글 등록 실패!");
				}
			}
		});
	});
	$("#btnup").click(function(){		
		
		var comments=$("#comments2").val().replace(/\n/g, '<br>');
		var qcnum=$("#qcnum2").val();
		if(comments==''){
			alert("내용을 입력해 주세요");
			return;
		}
		$.ajax({
			url:"/qna/detail/qcupdate?qcnum="+qcnum+"&comments="+comments,
				success:function(data){
				if($(data).find("info").text()=="success"){
					alert("글 등록 성공!");
					$("#list").children().each(function(){
						$("#list").children().remove();
					});
					list();
					$("#comments2").val("");
				
					$("#commUp").modal("hide");
				}else{
					alert("글 등록 실패!");
				}
			}
		});
	});
	$("#btnup1").click(function(){
	
	$("#commUp").modal("hide");
	});
	$("#btnrep1").click(function(){
		
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
	var qnanum=${dto.qnanum}
	$.ajax({
		url:"/qna/detail/qclist?qnanum="+qnanum+"&pageNum="+pageNum+"&sid="+sid,
		dataType:"xml",
		success:function(data){
			var startPage;
			var endPage;
			var pageNum;
			var pageCount;
			$(data).find("comment").each(function(){
				var qcnum=$(this).find("qcnum").text();
				var id=$(this).find("id").text();
				var comments=$(this).find("comments").text();
				var qcref=$(this).find("qcref").text();
				var qclev=$(this).find("qclev").text();
				var qcstep=$(this).find("qcstep").text();
				var regdate=$(this).find("regdate").text();
				var savefile=$(this).find("savefile").text();
				startPage=$(this).find("startPage").text();
				endPage=$(this).find("endPage").text();
				pageNum=$(this).find("pageNum").text();
				pageCount=$(this).find("pageCount").text();
				comments=decodeURIComponent(comments);
				
				if(sid==''){
					if(qclev>0){
						var a="";
						var b="↘";
						for(var j=0;j<qclev;j++){
							a+="&nbsp;&nbsp;";		
						}
						$("#list").append("<div class='panel-heading'><span>"+a+b+"</span>"
									+"<img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"
									+id+"</div><div class='panel-body'>"+a+a+"<span class='comments'>"+comments+"</span><br>"
								+a+a+regdate+"<span style='display:none' class='qcnum'>"
								+qcnum+"</span><span style='display:none' class='qcref'>"
								+qcref+"</span><span style='display:none' class='qclev'>"
								+qclev+"</span><span style='display:none' class='qcstep'>"+qcstep+"</span></div>");	
					}else{
					$("#list").append("<div class='panel-heading'><img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"
							+id+"</div><div class='panel-body'><span class='comments'>"+comments+"</span><br>"
						+regdate+"<span style='display:none' class='qcnum'>"
						+qcnum+"</span><span style='display:none' class='qcref'>"
						+qcref+"</span><span style='display:none' class='qclev'>"
						+qclev+"</span><span style='display:none' class='qcstep'>"+qcstep+"</span></div>")
					}
				}else if(id==sid){
					if(qclev>0){
						var a="";
						var b="↘";
						for(var j=0;j<qclev;j++){
							a+="&nbsp;&nbsp;";
							
						}
						$("#list").append("<div class='panel-heading'><span>"+a+b+"</span>"+
								"<img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"
								+id+"</div><div class='panel-body'>"+a+a+"<span class='comments'>"+comments+"</span><br>"
								+a+a+regdate+"<a href='' class='qcdel'>삭제</a><a href='' class='qcrep'>답글</a><a href='' class='qcupdate'>수정</a><span style='display:none' class='qcnum'>"
								+qcnum+"</span><span style='display:none' class='qcref'>"
								+qcref+"</span><span style='display:none' class='qclev'>"
								+qclev+"</span><span style='display:none' class='qcstep'>"+qcstep+"</span></div>");	
					}else{
					$("#list").append("<div class='panel-heading'>"
							+"<img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"
							+id+"</div><div class='panel-body'><span class='comments'>"+comments+"</span><br>"
						+regdate+"<a href='' class='qcdel'>삭제</a><a href='' class='qcrep'>답글</a><a href='' class='qcupdate'>수정</a><span style='display:none' class='qcnum'>"
						+qcnum+"</span><span style='display:none' class='qcref'>"
						+qcref+"</span><span style='display:none' class='qclev'>"
						+qclev+"</span><span style='display:none' class='qcstep'>"+qcstep+"</span></div>")
					}
				}else{
					if(qclev>0){
						var a="";
						var b="↘";
						for(var j=0;j<qclev;j++){
							a+="&nbsp;&nbsp;";
							
						}
						$("#list").append("<div class='panel-heading'><span>"+a+b+"</span>"
								+"<img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"+id
								+"</div><div class='panel-body'>"
								+a+a+"<span class='comments'>"+comments+"</span><br>"
								+a+a+regdate+"<a href='' class='qcrep'>답글</a><span style='display:none' class='qcnum'>"
								+qcnum+"</span><span style='display:none' class='qcref'>"
								+qcref+"</span><span style='display:none' class='qclev'>"
								+qclev+"</span><span style='display:none' class='qcstep'>"+qcstep+"</span></div>");	
					}else{
					$("#list").append("<div class='panel-heading'>"
					+"<img src='/resources/userphoto/"+savefile+"' class='img-circle' style='height:45px;width:45px'>"+id
					+"</div><div class='panel-body'>"
					+"<br><span class='comments'>"+comments+"</span><br>"
						+regdate+"<a href='' class='qcrep'>답글</a><span style='display:none' class='qcnum'>"
						+qcnum+"</span><span style='display:none' class='qcref'>"
						+qcref+"</span><span style='display:none' class='qclev'>"
						+qclev+"</span><span style='display:none' class='qcstep'>"+qcstep+"</span></div>")
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
// 삭제 확인
var btndeleteqna = function(num){
	console.log("삭제버튼" +num);
	$('#confirmremoveqna').modal('show');
	//
	$('#btndeleteqna').click(function(){
		location.href="/qna/delete?qnanum="+num;
	});
	$('#btncancel').click(function(){
		$('#confirmremoveqna').modal('hide');
	});
}

</script> 

<div style="background-color: #FFFFFF;">
<table  width="1000"table class="table table-hover">
	<tr>
		 
		<th><div align="left"><h2><small>${dto.title }</small></h2></div><div align="right">조회수:${dto.hit }</div></th>
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
		<td><a href="/qna/detail?qnanum=${next.qnanum }">다음글:${next.title }</a></td>
		</c:otherwise>
	</c:choose>
	</tr>
	<tr>
		<c:choose>
		<c:when test="${empty prev.title  }">
	 	
	 </c:when>
	 <c:otherwise>
		<td><a href="/qna/detail?qnanum=${prev.qnanum }">이전글:${prev.title }</a></td>
		</c:otherwise>
	</c:choose>
	</tr>
	<tr>
		<td>
		<c:choose>
		<c:when test="${dto.id==id }">
		<a onclick="btndeleteqna(${dto.qnanum })" class="btn btn-primary btn-xs" role="button">삭제</a>
		<a href="/qna/update?qnanum=${dto.qnanum }" class="btn btn-primary btn-xs" role="button">수정</a>
<%-- 		<a href="/qna/delete?qnanum=${dto.qnanum }" class="btn btn-primary btn-xs" role="button">삭제</a>
		<a href="/qna/update?qnanum=${dto.qnanum }" class="btn btn-primary btn-xs" role="button">수정</a> --%>

		</c:when> 
		</c:choose>
		<a href="/qna/plist" class="btn btn-primary btn-xs" role="button">목록</a>	
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
	<input type="hidden" id="qcref1"><input type="hidden" id="qcnum1" >
<input type="hidden" id="qclev1"><input type="hidden" id="qcstep1">
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
        	<input type="hidden" id="qcnum2" >
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
	<input type="hidden" id="qcnum1" >
<input type="hidden" id="id1" value="${id }"><br>
	<a href="#"><img src='/resources/userphoto/${savefile1 }' class='img-circle' style='height:45px;width:45px'>${id }</a><br>
	<textarea id="comments1" rows="3" cols="60" style="width: 70%"></textarea><br>
	<input type="hidden" id="qcref1">
<input type="hidden" id="qclev1"><input type="hidden" id="qcstep1">
	<input type="button" value="덧글등록" id="btnrep"><input type="button" value="취소" id="btnrep1">
</div>
<div id="commUp" style='padding:5px; width: 100%; border: 1px solid gray; display: none'>
	<input type="hidden" id="qcnum2" >
	<a href="#"><img src='/resources/userphoto/${savefile1}' class='img-circle' style='height:45px;width:45px'>${id }</a><br>
	<textarea id="comments2" rows="3" cols="60" style="width: 70%"></textarea><br>
	<input type="button" value="덧글등록" id="btnup"><input type="button" value="취소" id="btnup1">
</div>
 -->
<div id="list" class="panel panel-default"></div>
<button data-toggle="collapse" data-target="#comm" class="btn-primary btn-xs">댓글등록</button>
<div style='padding:5px; width: 100%; border: 1px solid gray' id="comm" class="collapse">
<input type="hidden" id="id" value="${id }">
<a href="#"><img src='/resources/userphoto/${savefile1 }' class='img-circle' style='height:45px;width:45px'>${id }</a><br>
<textarea id="comments" cols="60" rows="3" style="width: 70%" ></textarea>
	<c:choose>
	<c:when test="${empty id }">
	 	 로그인 후 글작성
	 </c:when>
	 <c:otherwise>
		<input type="button" value="덧글등록" id="btnadd" >
	</c:otherwise>
	</c:choose>
<input type="hidden" id="qcnum"><input type="hidden" id="qclev"><input type="hidden" id="qcref">
<input type="hidden" id="qcstep">
</div>
<div id="page"></div>
</div>
<div style="height: 100px;"></div>

<!-- 삭제 확인버튼 -->
<div id="confirmremoveqna" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">
    	<div class="panel panel-danger">
		  <div class="panel-heading">
		  <div class="panel-body"><strong>경고!!</strong><br/>글을 삭제 하시겠습니까?</div></div>
		  <div class="panel-footer text-center">
		    <button class="btn btn-danger glyphicon glyphicon-ok" id="btndeleteqna">삭제하기</button>
		    <button class="btn btn-primary glyphicon glyphicon-remove" id="btncancel">취소</button>
		  </div>
		</div>
  </div>
</div>