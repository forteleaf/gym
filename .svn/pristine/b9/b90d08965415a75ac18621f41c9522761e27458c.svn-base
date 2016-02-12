<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>로그인페이지!</h1>
<div class="container">
	<div class="col-xs-3">
		<form method="post" action="/user/login">
			<div id="form-group">
				아이디 <input type="text" name="id" class="form-control">
			</div>
			<div id="form-group">
				비밀번호 <input type="password" name="pwd" class="form-control">
			</div>
			<div class="collapse" id="errmsg">${errMsg }</div>
			<input type="submit" value="로그인" class="btn btn-success" data-toggle="collapse" data-target="#errmsg">
		</form>
	</div>
</div>