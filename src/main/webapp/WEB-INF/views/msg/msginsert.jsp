<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
<form role="form" action="/msg/send" method="post">
  <div class="form-group">
    <label for="id">받는 사람</label>
    <input type="text" class="form-control" id="recv_id" name="recv_id">
    <!-- 보내는사람 히든으로!!! -->
    <input type="hidden" value="${id }" id="id" name="id">
  </div>
  <div class="form-group">
    <label for="content">보내는 내용</label>
    <input type=text class="form-control" id="content" name="content">
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
</form>
</div>