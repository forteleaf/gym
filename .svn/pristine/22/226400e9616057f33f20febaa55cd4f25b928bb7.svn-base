<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.min.css">
<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#tab").tabs();
		llist();
		$("#man").on("click","tr td",function(event){
			var lnum=$(this).text();
			$.ajax({
				url:"/locker/locget?lnum=" + lnum,
				dataType:"xml",
				success:function(data){
					$(data).find("locker").each(function(){
						$("#loc").empty();
						event.preventDefault();	
						var lnum=$(this).find("lnum").text();
						var id=$(this).find("id").text();
						var sex=$(this).find("sex").text();
						var rent=$(this).find("rent").text();
						var rentstart=$(this).find("rentstart").text();
						var rentend=$(this).find("rentend").text();
						if(rent==1){
							var ss="락커번호:<input type='text' value='"+ lnum +"'disabled='true' id='mlnum' name='mlnum'><br>"
							+"회원ID:<input type='text' value='"+ id +"'disabled='true' id='mid' name='mid'>"
							+"<select name='sex' value='"+ sex +"'disabled='true' hidden='true' id='msex'>"
							+"<option value='1' selected='selected'>남자</option>"
							+"<option value='2'>여자</option></select>"
							+"<br>"
							+"대여유무:<select name='rent' value='"+ rent +"'disabled='true' id='mrent'>"
							+"<option value='1' selected='selected'>사용중</option>"
							+"<option value='2'>사용가능</option></select>"
							+"<br>"
							+"대여시작일:<input type='text' value='"+ rentstart +"'disabled='true' id='mrentstart' name='mrentstart'><br>"
							+"대여종료일:<input type='text' value='"+ rentend +"'disabled='true' id='mrentend' name='mrentend'><br><br>"
							+"<input type='button' value='입력' id='mconfirm'>&nbsp"
							+"<input type='button' value='수정' id='mupdate' style='display:none'>&nbsp"
							+"<input type='button' value='등록' id='minsert' style='display:none'>&nbsp"
							+"<input type='reset' value='삭제' id='mdelete'>&nbsp"
						}else{
							var ss="락커번호:<input type='text' value='"+ lnum +"'disabled='true' id='mlnum' name='mlnum'><br>"
							+"회원ID:<input type='text' value='"+ id +"'disabled='true' id='mid' name='mid'>"
							+"<select name='sex' value='"+ sex +"'disabled='true' hidden='true' id='msex'>"
							+"<option value='1' selected='selected'>남자</option>"
							+"<option value='2'>여자</option></select>"
							+"<br>"
							+"대여유무:<select name='rent' value='"+ rent +"'disabled='true' id='mrent'>"
							+"<option value='1'>사용중</option>"
							+"<option value='2' selected='selected'>사용가능</option></select>"
							+"<br>"
							+"대여시작일:<input type='text' value='"+ rentstart +"'disabled='true' id='mrentstart' name='mrentstart'><br>"
							+"대여종료일:<input type='text' value='"+ rentend +"'disabled='true' id='mrentend' name='mrentend'><br><br>"
							+"<input type='button' value='입력' id='mconfirm'>&nbsp;"
							+"<input type='button' value='수정' id='mupdate' style='display:none'>&nbsp;"
							+"<input type='button' value='등록' id='minsert' style='display:none'>&nbsp;"
							+"<input type='reset' value='삭제' id='mdelete'>&nbsp;"
						}
						$("#loc").append("<div>" + ss + "</div>");
						$( "#loc" ).dialog();
						$(function(){
							$("#mrentstart").datepicker({
								dateFormat:'yy/mm/dd'
							});
							$("#mrentend").datepicker({
								dateFormat:'yy/mm/dd'
							});
						});
						$("#mupdate").click(function(){
							var lnum=$("#mlnum").val();
							var id=$("#mid").val();
							var sex=$("#msex").val();
							var rent=$("#mrent").val();
							var rentstart=$("#mrentstart").val();
							var rentend=$("#mrentend").val();
							$.ajax({
								url:"/locker/lupdate?lnum="+lnum+"&id="+id+"&sex="+sex+"&rent="+rent+
										"&rentstart="+rentstart+"&rentend="+rentend,
								dataType:"xml",
								success:function(data){
								if($(data).find("info").text()=="success"){
									alert("업데이트성공");
									$("#loc").dialog("close");
									llist();
								}else{
									alert("업데이트실패")
								}
							}
						});
					})
					$("#mdelete").click(function(){
							var lnum=$("#mlnum").val();
							$.ajax({
								url:"/locker/ldelete?lnum="+lnum,
								dataType:"xml",
								success:function(data){
								if($(data).find("info").text()=="success"){
									alert("삭제성공");
									$("#loc").dialog("close");
									llist();
								}else{
									alert("삭제실패")
								}
							}
						});
					})
					$("#mconfirm").click(function(){
						$("#mid").attr("disabled",false);
						$("#msex").attr("disabled",false);
						$("#mrent").attr("disabled",false);
						$("#mrentstart").attr("disabled",false);
						$("#mrentend").attr("disabled",false);
						$("#minsert").css("display","inline");
						$("#mupdate").css("display","inline");
					});
					$("#minsert").click(function(){
							var lnum=$("#mlnum").val();
							var id=$("#mid").val();
							var sex=$("#msex").val();
							var rent=$("#mrent").val();
							var rentstart=$("#mrentstart").val();
							var rentend=$("#mrentend").val();
							$.ajax({
								url:"/locker/linsert?lnum="+lnum+"&id="+id+"&sex="+sex+"&rent="+rent+
										"&rentstart="+rentstart+"&rentend="+rentend,
								dataType:"xml",
								success:function(data){
								if($(data).find("info").text()=="success"){
									alert("등록성공");
									$("#loc").dialog("close");
									llist();
								}else{
									alert("등록실패")
								}
							}
						});
					});
				});
			}
		});
	});
		$("#girl").on("click","tr td",function(event){
			var lnum=$(this).text();
			$.ajax({
				url:"/locker/locget?lnum=" + lnum,
				dataType:"xml",
				success:function(data){
					$(data).find("locker").each(function(){
						$("#loc").empty();
						event.preventDefault();	
						var lnum=$(this).find("lnum").text();
						var id=$(this).find("id").text();
						var sex=$(this).find("sex").text();
						var rent=$(this).find("rent").text();
						var rentstart=$(this).find("rentstart").text();
						var rentend=$(this).find("rentend").text();
						if(rent==1){
							var ss="락커번호:<input type='text' value='"+ lnum +"'disabled='true' id='fnum' name='fnum'><br>"
							+"회원ID:<input type='text' value='"+ id +"'disabled='true' id='fid' name='fid'>"
							+"<select name='fsex' value='"+ sex +"'disabled='true' hidden='true' id='fsex'>"
							+"<option value='1'>남자</option>"
							+"<option value='2' selected='selected'>여자</option></select>"
							+"<br>"
							+"대여유무:<select name='frent' value='"+ rent +"'disabled='true' id='frent'>"
							+"<option value='1' selected='selected'>사용중</option>"
							+"<option value='2'>사용가능</option></select>"
							+"<br>"
							+"대여시작일:<input type='text' value='"+ rentstart +"'disabled='true' id='frentstart' name='frentstart'><br>"
							+"대여종료일:<input type='text' value='"+ rentend +"'disabled='true' id='frentend' name='frentend'><br><br>"
							+"<input type='button' value='입력' id='fconfirm'>&nbsp"
							+"<input type='button' value='수정' id='fupdate' style='display:none'>&nbsp"
							+"<input type='button' value='등록' id='finsert' style='display:none'>&nbsp"
							+"<input type='reset' value='삭제' id='fdelete'>&nbsp"
						}else{
							var ss="락커번호:<input type='text' value='"+ lnum +"'disabled='true' id='fnum' name='fnum'><br>"
							+"회원ID:<input type='text' value='"+ id +"'disabled='true' id='fid' name='fid'>"
							+"<select name='fsex' value='"+ sex +"'disabled='true' hidden='true' id='fsex'>"
							+"<option value='1'>남자</option>"
							+"<option value='2' selected='selected'>여자</option></select>"
							+"<br>"
							+"대여유무:<select name='rent' value='"+ rent +"'disabled='true' id='frent'>"
							+"<option value='1'>사용중</option>"
							+"<option value='2' selected='selected'>사용가능</option></select>"
							+"<br>"
							+"대여시작일:<input type='text' value='"+ rentstart +"'disabled='true' id='frentstart' name='frentstart'><br>"
							+"대여종료일:<input type='text' value='"+ rentend +"'disabled='true' id='frentend' name='frentend'><br><br>"
							+"<input type='button' value='입력' id='fconfirm'>&nbsp;"
							+"<input type='button' value='수정' id='fupdate' style='display:none'>&nbsp;"
							+"<input type='button' value='등록' id='finsert' style='display:none'>&nbsp;"
							+"<input type='reset' value='삭제' id='fdelete'>&nbsp;"
						}
						$("#loc").append("<div>" + ss + "</div>");
						$( "#loc" ).dialog();
						$(function(){
							$("#frentstart").datepicker({
								dateFormat:'yy/mm/dd'
							});
							$("#frentend").datepicker({
								dateFormat:'yy/mm/dd'
							});
						});
						$("#fupdate").click(function(){
							var lnum=$("#fnum").val();
							var id=$("#fid").val();
							var sex=$("#fsex").val();
							var rent=$("#frent").val();
							var rentstart=$("#frentstart").val();
							var rentend=$("#frentend").val();
							$.ajax({
								url:"/locker/lupdate?lnum="+lnum+"&id="+id+"&sex="+sex+"&rent="+rent+
										"&rentstart="+rentstart+"&rentend="+rentend,
								dataType:"xml",
								success:function(data){
								if($(data).find("info").text()=="success"){
									alert("업데이트성공");
									$("#loc").dialog("close");
									llist();
								}else{
									alert("업데이트실패")
								}
							}
						});
					})
					$("#fdelete").click(function(){
							var lnum=$("#fnum").val();
							$.ajax({
								url:"/locker/ldelete?lnum="+lnum,
								dataType:"xml",
								success:function(data){
								if($(data).find("info").text()=="success"){
									alert("삭제성공");
									$("#loc").dialog("close");
									llist();
								}else{
									alert("삭제실패")
								}
							}
						});
					})
					$("#fconfirm").click(function(){
						$("#fid").attr("disabled",false);
						$("#fsex").attr("disabled",false);
						$("#frent").attr("disabled",false);
						$("#frentstart").attr("disabled",false);
						$("#frentend").attr("disabled",false);
						$("#finsert").css("display","inline");
						$("#fupdate").css("display","inline");
					});
					$("#finsert").click(function(){
							var lnum=$("#fnum").val();
							var id=$("#fid").val();
							var sex=$("#fsex").val();
							var rent=$("#frent").val();
							var rentstart=$("#frentstart").val();
							var rentend=$("#frentend").val();
							$.ajax({
								url:"/locker/linsert?lnum="+lnum+"&id="+id+"&sex="+sex+"&rent="+rent+
										"&rentstart="+rentstart+"&rentend="+rentend,
								dataType:"xml",
								success:function(data){
								if($(data).find("info").text()=="success"){
									alert("등록성공");
									$("#loc").dialog("close");
									llist();
								}else{
									alert("등록실패")
								}
							}
						});
					});
				});
			}
		});
	});
})
function llist(){
		$("#man .td").css("backgroundColor","#5AD2FF");
		$("#girl .td").css("backgroundColor","#FF6EED");
	$.ajax({
		url:"/locker/llist",
		dataType:"xml",
		success:function(data){
			$(data).find("list").each(function(){
				var lnum=$(this).find("lnum").text();
				var rent=$(this).find("rent").text();
				//console.log(lnum);
				$("#man .btn").each(function(){
					var btn=$(this).val();
					if(lnum==btn){
						$(this).parent().css("backgroundColor","silver");
					}
				})
				$("#girl .btn").each(function(){
					var btn=$(this).val();
					if(lnum==btn){
						$(this).parent().css("backgroundColor","silver");
					}
				})
			})
		}
	});
}
</script>

<div id="tab">
	<ul>
		<li><a href="#man">락커(남)</a></li>
		<li><a href="#girl">락커(여)</a></li>
	</ul>
	<div id="man">
		<table border="1" style="color: black;border-color: blue;border-width:medium;">
			<tr>
				<c:forEach var="male" begin="1" end="100" step="1">
					<td align="center" width="80px" height="60px" nowrap class="td" bgcolor="#dff0d8">
					<input type="hidden" class="btn" value="${male }">
					<span>${male}</span>
					</td>
				<c:if test="${male mod 10==0 }">
					</tr><tr>
				</c:if>
				<c:if test="${male==100 }">
					</tr>
				</c:if>
				</c:forEach>
		</table>
		<div id="cur">
			<div style="float: left;">사용중 - &nbsp;</div><div style="width: 10px; height: 10px; background-color: silver;float: left; margin-top: 6px;"></div>
			 <div style="clear: both;"></div>
			<div style="float: left;">미사용 - &nbsp;</div><div style="width: 10px; height: 10px; background-color: #5AD2FF;float: left; margin-top: 6px;"></div>
		</div>
	</div>
	<div id="girl">
		<table border="1" style="color: black;border-color: red;border-width:medium;">
			<tr>
				<c:forEach var="female" begin="101" end="200" step="1">
					<td align="center" width="80px" height="60px" nowrap class="td" bgcolor="yellow">
					<input type="hidden" class="btn" value="${female }">
					<span>${female}</span>
					</td>
				<c:if test="${female mod 10==0 }">
					</tr><tr>
				</c:if>
				<c:if test="${female==200 }">
					</tr>
				</c:if>
				</c:forEach>
		</table>
		<div id="cur">
			<div style="float: left;">사용중 - &nbsp;</div><div style="width: 10px; height: 10px; background-color: silver;float: left; margin-top: 6px;"></div>
			 <div style="clear: both;"></div>
			<div style="float: left;">미사용 - &nbsp;</div><div style="width: 10px; height: 10px; background-color: #FF6EED;float: left; margin-top: 6px;"></div>
		</div>
	</div>
</div>
<div id="loc" style="display: none;"></div>
<div style="height:100px"></div>