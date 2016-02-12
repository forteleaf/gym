<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<script type="text/javascript">
	var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
	$(document).ready(function() {
		$("#ipwd").focusout(function() {
			var pwd = $("#ipwd").val();
			if (pwd.length <= 0) {
				$("#pwdmsg").html("비밀번호를 입력하시오.");
			} else {
				$("#pwdmsg").html("");
			}
		})
		$("#pwdch").focusout(function() {
			var pwd = $("#ipwd").val();
			var pwdch = $("#pwdch").val();
			if (pwd != pwdch) {
				$("#pwdchmsg").html("비밀번호가 일치하지 않습니다");
			} else {
				$("#pwdchmsg").html("비밀번호가 일치합니다");
			}
		});
		$("form").submit(function(event) {
			if ($("#uname").val().length <= 0) {
				alert("이름를 입력하시오.");
				event.preventDefault();
			} else if ($("#ipwd").val().length <= 0) {
				alert("비밀번호를 입력하시오.");
				event.preventDefault();
			} else if ($("#ipwd").val() != $("#pwdch").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				event.preventDefault();
			} else if ($("#phone").val().length <= 0) {
				alert("전화번호를 입력하시오.");
				event.preventDefault();
			} else if ($("#email").val().length <= 0) {
				alert("이메일을 입력하시오.");
				event.preventDefault();
			} else {
				$("form").submit();
			}
		});

		$(function() {
			$("#file1").change(function() {
				if (typeof (FileReader) != "undefined") {
					var dvPreview = $("#dvPreview");
					dvPreview.html("");
					$($(this)[0].files).each(function() {
						var file = $(this);
						if (regex.test(file[0].name.toLowerCase())) {
							var reader = new FileReader();
							reader.onload = function(e) {
								var img = $("<img />");
								img.attr("style", "height:100px;width: 100px");
								img.attr("src", e.target.result);
								$('#dvPreview1').collapse('show');
								dvPreview.append(img);
							}
							reader.readAsDataURL(file[0]);
						} else {
							alert(file[0].name + "은 이미지파일이 아닙니다.");
							$("#file1").val("");
							$('#dvPreview1').collapse('hide');
							dvPreview.html("");
							return false;
						}
					});
				} else {
					alert("이 브라우져는 HTML5를 지원하지 않습니다.");
				}
			});
		});
	});
</script>
<div class="container">
	<div class="page-header"><h1>정보수정페이지</h1></div>
	<div class="col-xs-4">
		<form action="/user/update" method="post" enctype="multipart/form-data" role="form">
			<div class="form-group">
				<label for="uname">이름 : </label>
				 <input type="text" id="uname" name="uname" value="${dto.uname }"class="form-control"
					placeholder="Enter Name">
				<input type="hidden" name="id" value="${dto.id }">
				<input type="hidden" name="savefile" value="${dto.savefile }">
			</div>
				<div class="form-group">
				<label for="pwd">비밀번호 : </label><input type="password" id="ipwd" name="pwd" class="form-control"
					placeholder="Enter Password"><br> <span id="pwdmsg"></span>
			</div>
			<div class="form-group">
				<label for="pwdch">비밀번호확인 : </label><input type="password" id="pwdch" class="form-control"
					placeholder="Enter Passwrod"><br> <span id="pwdchmsg"></span>
			</div>
			<div class="form-group">
				<label for="email">전화번호 : </label><input type="text" id="phone" name="phone" value="${dto.phone }" class="form-control"
					placeholder="Enter PhoneNumber">
			</div>
			<div class="form-group">
				<label for="email">이메일 : </label><input type="email" id="email" name="email" value="${dto.email }" class="form-control"
					placeholder="Enter Email">
			</div>
			<div class="form-group">
				<label for="addr">주소 : </label><input type="text" id="addr" name="addr" value="${dto.addr }"class="form-control"
					placeholder="Enter Address">
			</div>
			<div class="form-group">
				<label for="addr">저장파일명 : </label><input type="text" value="${dto.savefile }"class="form-control"
					placeholder="Enter Address">
			</div>
			<div class="form-group">
				<label for="birth">생년월일 : </label> <input type="date" id="birth" name="birth" value="${dto.birth }" class="form-control">
			</div>
			
			<div class="form-group">
				<label >성별 : </label>
				    <label class="radio-inline">
 					   <input type="radio" name="sex" class="optradio" value="1"> 남자
  					 </label>
				     <label class="radio-inline">
				       <input type="radio" name="sex" class="optradio" value="2"> 여자
				     </label>
<!-- 				남자<input type="radio" class="optradio" value="1" name="sex">
				여자<input type="radio" class="optradio" value="2" name="sex"> -->
			</div>
			<div class="form-group">
				사진 <input type="file" name="file1" id="file1" multiple="multiple"	class="form-control">
			</div>
			<div id="dvPreview" class="img-thumbnail">
				<img src="/resources/userphoto/${dto.savefile }">
			</div>
	
			<input type="submit" value="가입" class="btn btn-info">

		</form>
	</div>
</div>
