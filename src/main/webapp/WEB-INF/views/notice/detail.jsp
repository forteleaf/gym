<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<style type="text/css">
	
</style>
<script type="text/javascript">
var btndeletenot = function(num){
	console.log("삭제버튼" +num);
	$('#confirmremovenot').modal('show');
	//
	$('#btndeletenot').click(function(){
		location.href="/notice/delete?ntnum="+num;
	});
	$('#btncancel').click(function(){
		$('#confirmremovenot').modal('hide');
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
		<td><a href="/notice/detail?ntnum=${next.ntnum }">다음글:${next.title }</a></td>
		</c:otherwise>
	</c:choose>
		
	</tr>
	<tr>
		<c:choose>
		<c:when test="${empty prev.title  }">
	 	
	 </c:when>
	 <c:otherwise>
		<td><a href="/notice/detail?ntnum=${prev.ntnum }">이전글:${prev.title }</a></td>
		</c:otherwise>
	</c:choose>
		
	</tr>
	<tr>
	<td>
		<c:choose>
		<c:when test="${dto.id==id }">
		<a onclick="btndeletenot(${dto.ntnum })" class="btn btn-primary btn-xs" role="button">삭제</a>
		<a href="/notice/update?ntnum=${dto.ntnum }" class="btn btn-primary btn-xs" role="button">수정</a>
		</c:when> 
		</c:choose>
		<a href="/notice/nlist" class="btn btn-primary btn-xs" role="button">목록</a>	</td>
	</tr>	
</table>
</div>
<div style="height: 100px;"></div>
<!-- 삭제 확인버튼 -->
<div id="confirmremovenot" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">
    	<div class="panel panel-danger">
		  <div class="panel-heading">
		  <div class="panel-body"><strong>경고!!</strong><br/>글을 삭제 하시겠습니까?</div></div>
		  <div class="panel-footer text-center">
		    <button class="btn btn-danger glyphicon glyphicon-ok" id="btndeletenot">삭제하기</button>
		    <button class="btn btn-info glyphicon glyphicon-remove" id="btncancel">취소</button>
		  </div>
		</div>
  </div>
</div>