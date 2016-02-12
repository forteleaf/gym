<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>락커번호</th><th>회원번호</th><th>성별</th>
		<th>대여유무</th><th>대여시작일</th><th>대여종료일</th>
		<th>수정</th><th>삭제</th>
	</tr>
	<c:forEach var="dto" items="${llist }">
		<tr>
			<td>${dto.lnum }</td>
			<td>${dto.num }</td>
			<td>${dto.sex }</td>
			<td>${dto.rent }</td>
			<td>${dto.rentstart }</td>
			<td>${dto.rentend }</td>
			<td><a href="/locker/lupdate?lnum=${dto.lnum }">수정</a></td>
			<td><a href="/locker/ldelete?lnum=${dto.lnum }">삭제</a></td>
		</tr>	
	</c:forEach>
</table>
</body>
</html>