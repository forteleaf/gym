<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>강사정보등록</h1>

<form method="post" action="/instructor/iinsert">
	직원아이디 <input type="text" name="id"><br>
	재직여부 <input type="text" name="work"><br>
	급여 <input type="text" name="sal"><br>
	소개/약력 <textarea rows="10" cols="50" name="info"></textarea>
	<input type="submit" value="등록"><br>
</form>
</body>
</html>