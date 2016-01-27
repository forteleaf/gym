<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
  body {
      position: relative;
  }
  .affix {
  	  background: rgba(100, 100, 0, 0.8) none repeat scroll 0% 0%;
  	  border-radius:10px;
      top: 10%;
  }
  div{
    border-radius: 4px;
  }
  .bg-info {
    background: rgba(0, 0, 0, 0.5) none repeat scroll 0% 0%;
    text-align: left;
  }
  div.col-sm-9 div {
  	  /* height: 250px; */
      font-size: 15px;
  }
  
  #section1 {color: #fff; background-color: #1E88E5;}
  #section1 .bg-info {padding:10px}
  #section2 {color: #fff; background-color: #00bcd4;}
  #section2 div { padding: 10px}
  #section3 {color: #fff;}
  #section3 .row {padding:10px;}
  #section4 {color: #fff; background-color: #ff9800; opacity: 0.8;}
  #section5 {color: #fff; background-color: #009688;}
/*
  #section1 {color: #fff; background-color: #1E88E5; opacity: 0.8; padding:10px}
  #section2 {color: #fff; background-color: #673ab7;}
  #section3 {color: #fff; background-color: #ff9800;}
  #section41 {color: #fff; background-color: #00bcd4;}
  #section42 {color: #fff; background-color: #009688;} */
  
  @media screen and (max-width: 810px) {
    #section1, #section2, #section3, #section41, #section42  {
        margin-left: 150px;
    }
  }
  /* 화면 슬라이드 */
  .slideanim {visibility:hidden;}
  .slide {
      animation-name: slide;
      -webkit-animation-name: slide;	
      animation-duration: 1s;	
      -webkit-animation-duration: 1s;
      visibility: visible;			
  }
  @keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }	
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
    .btn-lg {
        width: 100%;
        margin-bottom: 35px;
    }
  }
  @media screen and (max-width: 480px) {
    .logo {
        font-size: 150px;
    }
  }
  </style>
</head>
<script>
$(function(event){
  // 부드러운 스크롤링을 위해서!!
  $('a[href^="#"]').on('click', function(event) {

    // 클릭은 모두 무시 해 버렷!
    event.preventDefault();

    // 해쉬 이벤트를 사용하기 위해
    var hash = this.hash;

    $('html, body').animate({
      scrollTop: $(hash).offset().top
    }, 900, function(){
   
      // hash가 해당 위치에 오게 되면 페이지를 읽어오지!
      window.location.hash = hash;
    });
  });
  
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
});
</script>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="15">

<div class="container-fluid" style="background-color:#2196F3;color:#fff;height:150px;" id="abcd">
  <h3>WELCOME</h3>
  <p>약 40년 역사와 수많은 휘트니스 사업 성공사례를 자랑하는 월드짐은 현재 전세계 백만명이 넘는 회원을 보유하고 있는 세계적인 휘트니스 프랜차이즈입니다. Bodybuilding계의 전설이자 영화 ‘타잔’의 주인공 Joe Gold가 1976년 World Gym 오픈 이래 Arnold Schwarzenegger, Rou Ferrigno Dave Draper 등 수많은 할리우드 스타를 배출하였습니다. </p>
</div>
<br>

  <div class="row">
    <nav class="col-sm-3 bg-info" id="myScrollspy">
      <ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="205">
        <li><a href="#section1">프로그램</a></li>
        <li><a href="#section2">시스템</a></li>
        <li><a href="#section3">대표님</a></li>
        <li><a href="#section4">소개영상</a></li>
      </ul>
    </nav>
    <div class="col-sm-9">
      <div id="section1">
        <div class="bg-info">
		<img src="/resources/img/welcome_01.png">
		</div>
      
<!--  		<div class="embed-responsive embed-responsive-16by9">
		  <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/YfTCORhobOo" frameborder="0" allowfullscreen></iframe>
		</div> -->

      </div>
      <div id="section2">
        <h3></h3>
        <div class="bg-info">
          <h2>Semi Private Training</h2>
          <img src="/resources/img/welcome/welcome_01.jpg" class="img-rounded">
          <span>1:1 개인에게 맞춤 프로그램이 더 필요한 분이나 가족, 친구, 그리고, 동료와 함께 운동하고 싶은 분들에게 권합니다.</span>
        </div>        
      </div>
      <div id="section3">
      	<h1></h1>
      	<div class="row bg-info">
          <div class="col-sm-5">
            <img src="/resources/img/trainer/trainer1_full.jpg" width="300" class="img-thumbnail">
          </div>
          <div class="col-sm-7">
              <h2 class="text-muted">"흔들린다면 그건 지방입니다."</h2>
              <p>저희 <strong>BrokenPipe</strong> GYM에서는 남녀노소 운동할 수 있는 환경을 제공합니다.
자유로운 운동환경에서의 최고의 트레이너와 함께 지방을 불태워 보세요! <br />
궁금한 부분에 대해서는 언제든지 친절하게 상담해 드립니다. <br />
망설이지 마세요!!MMA GYM은 항상 여러분을 기다립니다.!</p>
          </div>
        </div>
      	</div>
      <div id="section4">
        <div class="bg-info">
        <h1>음악은 마음을 편안하게 합니다</h1>
        <p>제가 생긴거와 행동하는거와는 정말 천지차이로 음악은 조용한 음악을 좋아합니다.<br /> 제가 클래식 좋아한다고 하면 사람들이 기절할라구 하네요.<br /> 헐...진짜 좋아하는데 이건 뉴에이지입니다.<br /> 앙드레 가뇽껀데 원곡에 앞뒤로 클래식한 느낌의 오케스트라가 살짝 덧붙여진 겁니다.<br /> 듣다보면 조는 사람이 많더군요. 전 생각이 풍부해지던데 옛생각도 나고...뭐 ㅋㅋㅋ 특히 오늘같이 흐린날 듣기 딱 좋네여 흰눈 펑펑 쏟아지는 겨울이 빨랑 왔음 좋겠어여 암튼 들어보삼~~</p>
        <div class="contrainer" style="padding:20px"]>
        <div class="embed-responsive embed-responsive-16by9">
			<iframe class="embed-responsive-item"  src="https://www.youtube.com/embed/X-bhwC3qz_Q?t=59s"></iframe>
		</div>
		</div>
		<p>우리는 아름답다</p>
        </div>         
      </div>
	<div class="text-center">
	  <a href="#abcd" title="To Top"><span class="glyphicon glyphicon-chevron-up"></span></a>
	</div>
  </div>
</div>