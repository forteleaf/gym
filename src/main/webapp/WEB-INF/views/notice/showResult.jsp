<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result=='success' }">
	<h2>요청하신작업이 성공적으로 이루어졌습니다</h2>
</c:if>
<c:if test="${result=='fail' }">
	<h2>요청하신작업이 실패하였습니다</h2>
</c:if>
<br>
<a href="/notice/nlist">목록</a>
