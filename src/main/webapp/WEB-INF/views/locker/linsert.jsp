<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/custom/jquery-ui.min.css">
<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#date1").datepicker({
		dateFormat:'yy/mm/dd'
	});
	$("#date2").datepicker({
		dateFormat:'yy/mm/dd'
	});
});
</script>
</head>
<body>
<h1>락커정보등록</h1>
<form action="/locker/linsert" method="post">
	락커번호 <input type="text" name="lnum"><br>
	회원ID <input type="text" name="id"><br>
	성별 <input type="text" name="sex"><br>
	대여유무 <input type="text" name="rent"><br>
	대여시작일 <input type="text" name="rentstart" id="date1"><br>
	대여종료일 <input type="text" name="rentend" id="date2"><br>
	<input type="submit" value="등록">
</form>
</body>
</html>