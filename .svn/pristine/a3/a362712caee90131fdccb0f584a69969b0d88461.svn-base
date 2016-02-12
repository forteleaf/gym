<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<c:set var="toDate"> 
<fmt:formatDate value="${now }" pattern="yyyy-MM-dd"/> 
</c:set> 


<style>
.item, img{
    height: 100% !important;
    width:  100%;
    max-height: 515px;
    /* 비율을 유지 */
    object-fit: cover;
}
.tales {
  width: 100%;
  max-height: 240px !important;
}
/* Smaller than standard 960 (devices and browsers) */
@media only screen and (max-width: 959px) {}

/* Tablet Portrait size to standard 960 (devices and browsers) */
@media only screen and (min-width: 768px) and (max-width: 959px) {}

/* All Mobile Sizes (devices and browser) */
@media only screen and (max-width: 767px) {}

/* Mobile Landscape Size to Tablet Portrait (devices and browsers) */
@media only screen and (min-width: 480px) and (max-width: 767px) {}

/* Mobile Portrait Size to Mobile Landscape Size (devices and browsers) */
@media only screen and (max-width: 479px) {}
</style>

<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="3000">

  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img class="img-rounded" src="/resources/photo_main/main_001.jpg" alt="..." > <!-- 페이지 사이즈 width="1200" height="315"  -->
      <div class="carousel-caption">
          <h3>Hello</h3>
      </div>
    </div>
    <div class="item">
      <img class="img-rounded" src="/resources/photo_main/main_002.jpg" alt="...">
      <div class="carousel-caption">
          <h3>Every</h3>
      </div>
    </div>
    <div class="item">
      <img class="img-rounded" src="/resources/photo_main/main_003.jpg" alt="...">
      <div class="carousel-caption">
          <h3>one</h3>
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div>
<div style="height:25px"></div>
<!-- 최신글을 표시하기 위한  곳 -->
<div class="row">
	<div class="col-md-4">
		<div class="panel panel-default">
			<div class="panel-heading">공지사항 게시판</div>
			<c:forEach var="notice" items="${noticelist }" begin="0" varStatus="status">
				<a href="/notice/detail?ntnum=${notice.ntnum}" class="list-group-item">
					<span class="info-board info-board-green"><span class="label label-info label-xs">Notice</span> <c:if test="${toDate eq notice.regdate}"><span class="label label-warning label-xs">New</span></c:if> ${fn:substring(notice.title,0,15)}</span>
				</a>
			</c:forEach>
		</div>
	</div>
	<div class="col-md-4">
		<div class="panel panel-default">
			<div class="panel-heading">QnA 게시판</div>
			<c:forEach var="qna" items="${qnalist }" begin="0" varStatus="status">
				<a href="/qna/detail?qnanum=${qna.qnanum}" class="list-group-item">
					<span class="list-group-item-heading"><c:if test="${toDate eq qna.regdate}"><span class="label label-warning label-xs">New</span></c:if> ${qna.title}</span>
				</a>
			</c:forEach>
		</div>
	</div>
	<div class="col-md-4">
	  <!-- 강사를 추천하려고 하는데, 참 좋은데 잘 안되네 -->
		<div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
		<ol class="carousel-indicators">
		  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		  <li data-target="#myCarousel" data-slide-to="1"></li>
		  <li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
		<div class="item active">
		  <div class="thumbnail" style="height:300">
		    <img src="/resources/img/trainer/trainer1.jpg" height="100%"class="tales">
		    <div class="carousel-caption">
			  <h3>김동균</h3>
			  <p>대한체육대학교 스포츠건강관리전공 ​현(서울시 북대문구청 보디빌딩)</p>
			</div>
		  </div>
		</div>
		<div class="item">
		  <div class="thumbnail">
		    <img src="/resources/img/trainer/trainer2.jpg" height="100%"class="tales">
		    <div class="carousel-caption">
			  <h3>강동구</h3>
			  <p>다이어트, 근육증가, 건강관리 전문 미르스튜디오대표 서강대학교강의/건국대학교강의</p>
			</div>
		  </div>
		</div>
		<div class="item">
		  <div class="thumbnail">
		    <img src="/resources/img/trainer/trainer3.jpg" height="100%" class="tales">
		    <div class="carousel-caption">
			  <h3>비파니</h3>
			  <p>다이어트, 근육증가, 건강관리 전문 미르스튜디오대표 서강대학교강의/건국대학교강의</p>
			</div>		    
		  </div>
		  </div>
		</div>
		
		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		  <span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		  <span class="sr-only">Next</span>
		</a>
	</div>
</div>
</div>
<!-- 공백 -->