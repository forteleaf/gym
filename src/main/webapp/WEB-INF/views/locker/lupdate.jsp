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
<h1>락커수정</h1>
<form action="" method="post">
	락커번호 <input type="text" name="lnum" value="${dto.lnum }"><br>
	회원ID <input type="text" name="id" value="${dto.id }"><br>
	성별 <input type="text" name="sex" value="${dto.sex }"><br>
	대여유무 <input type="text" name="rent" value="${dto.rent }"><br>
	대여시작일 <input type="text" name="rentstart" id="date1" value="${dto.rentstart }"><br>
	대여종료일 <input type="text" name="rentend" id="date2" value="${dto.rentend }"><br>
	<input type="submit" value="수정">
</form>
</body>
</html>