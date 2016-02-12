<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"content="text/html" charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>강사번호</th><th>강사아이디</th><th>입사일</th><th>재직여부</th>
		<th>급여</th><th>수정</th><th>삭제</th>
	</tr>
	<c:forEach var="dto" items="${ilist }">
		<tr>
			<td>${dto.inum}</td>
			<td><a href="/instructor/detail?id=${dto.id}">${dto.id}</a></td>
			<td>${dto.ijoin}</td>
			<td>${dto.work}</td>
			<td>${dto.sal}</td>
			<td><a href="/instructor/iupdate?inum=${dto.inum}">수정</a></td>
			<td><a href="/instructor/idelete?inum=${dto.inum}">삭제</a></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>