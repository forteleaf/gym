<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

.hint {
	width: 1280px;
	right: 0px;
	color: rgb(153, 153, 153);
	font-size: 12px;
	padding-bottom: 20px;
}

.hr-style {
	border: 0;
	height: 2px;
	width: 80%;
	color: #E8E8E8;
	background-color: #E8E8E8;
}
.bg-info {
    background: rgba(0, 0, 0, 0.5) none repeat scroll 0% 0%;
    text-align: left;
}
</style>

	<div class="bg-info">
<div class="col-dm-4">
	
	  <ul class="nav nav-tabs" role="tablist">
		<c:choose>
			<c:when test="${map.grade==0 }">
				<li class="active"><a href="/user/alluserlist/">전체목록</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/user/alluserlist/">전체목록</a></li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${map.grade==1 }">
				<li class="active"><a href="/user/adminlist/">관리자목록</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/user/adminlist/">관리자목록</a></li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${map.grade==2 }">
				<li class="active"><a href="/user/trainerlist/">트레이너목록</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/user/trainerlist/">트레이너목록</a></li>
			</c:otherwise>
		</c:choose>	
		<c:choose>
			<c:when test="${map.grade==3 }">
				<li class="active"><a href="/user/userlist/">회원목록</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/user/userlist/">회원목록</a></li>
			</c:otherwise>	
		</c:choose>
	</ul>
</div>
<section class="panel">
<table class="table table-hover">
	<tr>
		<th>회원번호</th>
		<th>ID</th>
		<th>이름</th>
		<th>EMAIL</th>
		<th>전화번호</th>
		<th>성별</th>
		<th>생년월일</th>
		<th>등록일</th>
		<th>등급</th>
	</tr>
	<c:forEach var="dto" items="${userlist }">
	<tr>
		<td>${dto.unum }</td>
		<!-- 
		<td><a href="/user/userinfo?id=${dto.id }&num=${dto.unum }">${dto.id }</a></td>
		 -->
		<td><a href="/user/userinfo?num=${dto.unum }&id=${dto.id }">${dto.id }</a></td>
		<td>${dto.uname }</td>
		<td>${dto.email }</td>
		<td>${dto.phone }</td>
		<c:choose>
			<c:when test="${dto.sex==1 }">
				<td>남자</td>
			</c:when>
			<c:otherwise>
				<td>여자</td>
			</c:otherwise>
		</c:choose>
		<td>${dto.birth }</td>
		<td>${dto.regdate }</td>
		<c:choose>
			<c:when test="${dto.grade==1 }">
				<td>관리자</td>
			</c:when>
			<c:when test="${dto.grade==2 }">
				<td>트레이너</td>			
			</c:when>
			<c:otherwise>
				<td>회원</td>
			</c:otherwise>
		</c:choose>
	</tr>
	</c:forEach>
</table>
</section>
</div>

<div class="container-fluid text-center">
<div class="row">
<div class="col-dm-4">
	<div id="page">
		<ul class="pagination">
			<c:choose>
				<c:when test="${map.grade==0 }">
					<c:choose>
						<c:when test="${pu.startPage>=11 }">
							<li><a href="/user/alluserlist?pageNum=${pu.startPage-1 }">이전페이지</a></li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a href="#">이전페이지</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${pu.startPage }" end="${pu.endPage }">
						<c:choose>
							<c:when test="${i == pu.pageNum }">
								<li class="active"><a href="/user/alluserlist?pageNum=${i }">${i }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/user/alluserlist?pageNum=${i }">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				<c:choose>
					<c:when test="${pu.endPage<pu.pageCount }">
						<li><a href="/user/alluserlist?pageNum=${pu.startPage+1 }">다음페이지</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#">다음페이지</a></li>
					</c:otherwise>
				</c:choose>	
			</c:when>
			
			<c:when test="${map.grade==1 }">
				<c:choose>
					<c:when test="${pu.startPage>=11 }">
						<li><a href="/user/adminlist?pageNum=${pu.startPage-1 }">이전페이지</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#">이전페이지</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${pu.startPage }" end="${pu.endPage }">
				<c:choose>
					<c:when test="${i == pu.pageNum }">
						<li class="active"><a href="/user/adminlist?pageNum=${i }">${i }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/user/adminlist?pageNum=${i }">${i }</a></li>
					</c:otherwise>						
				</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pu.endPage<pu.pageCount }">
						<li><a href="/user/adminlist?pageNum=${pu.startPage+1 }">다음페이지</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#">다음페이지</a></li>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:when test="${map.grade==2 }">
				<c:choose>
					<c:when test="${pu.startPage>=11 }">
						<li><a href="/user/trainerlist?pageNum=${pu.startPage-1 }">이전페이지</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#">이전페이지</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${pu.startPage }" end="${pu.endPage }">
				<c:choose>
					<c:when test="${i == pu.pageNum }">
						<li class="active"><a href="/user/trainerlist?pageNum=${i }">${i }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/user/trainerlist?pageNum=${i }">${i }</a></li>
					</c:otherwise>
				</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pu.endPage<pu.pageCount }">
						<li><a href="/user/trainerlist?pageNum=${pu.startPage+1 }">다음페이지</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#">다음페이지</a></li>
					</c:otherwise>
				</c:choose>	
			</c:when>
			<c:when test="${map.grade==3 }">
			<c:choose>
					<c:when test="${pu.startPage>=11 }">
						<li><a href="/user/userlist?pageNum=${pu.startPage-1 }">이전페이지</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#">이전페이지</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${pu.startPage }" end="${pu.endPage }">
				<c:choose>
					<c:when test="${i == pu.pageNum }">
						<li class="active"><a href="/user/userlist?pageNum=${i }">${i }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/user/userlist?pageNum=${i }">${i }</a></li>
					</c:otherwise>
				</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pu.endPage<pu.pageCount }">
						<li><a href="/user/userlist?pageNum=${pu.startPage+1 }">다음페이지</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#">다음페이지</a></li>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${pu.startPage>=11 }">
						<li><a href="/user/finduser?pageNum=${pu.startPage-1 }">이전페이지</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#">이전페이지</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${pu.startPage }" end="${pu.endPage }">
				<c:choose>
					<c:when test="${i == pu.pageNum }">
						<li class="active"><a href="/user/finduser?pageNum=${i }">${i }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/user/finduser?pageNum=${i }">${i }</a></li>
					</c:otherwise>
				</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pu.endPage<pu.pageCount }">
						<li><a href="/user/finduser?pageNum=${pu.startPage+1 }">다음페이지</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#">다음페이지</a></li>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
			</ul>
		</div>
	</div>
</div>
</div>
<!-- submit테스트
<script type="text/javascript">
	$(document).ready(function(){
		$("#sub1").submit(function(){
			alert("sub1");
		});
		$("#sub2").submit(function(){
			alert("sub2");
		});
	});
</script>
<form action="" id="sub1">
	<input type="submit"value="sub1">
</form>
 -->
 <!-- 
  -->
 
 
<div class="col-md-4 col-md-offset-4">
	<form method="post" action="/user/finduser" id="sub2">
		<select name="field">
			<option value="id">ID</option>
			<option value="unum">회원번호</option>
			<option value="uname">회원이름</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="검색">
	</form>
</div>

