<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	var idch = false;
	var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
	$(document).ready(function() {
		$("#idcheck").click(function() {
			var id = $("#iid").val();
			if (id.length <= 0) {
				alert("ID를 입력하시오.");
				return;
			}
			$.getJSON('idcheck/' + id, function(data) {
				if (data.result == 'clear') {
					$("#idmsg").html(data.id + "는 사용가능한 ID입니다.");
					idch = true;
				} else {
					$("#idmsg").html(data.id + "는 이미 존재하는 ID입니다.");
				}
			});
		});
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
			if (idch == false) {
				alert("아이디 중복체크를 해주십시오.");
				event.preventDefault();
			} else if ($("#uname").val().length <= 0) {
				alert("이름를 입력하시오.");
				event.preventDefault();
			} else if ($("#iid").val().length <= 0) {
				alert("아이디를 입력하시오.");
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
	<div class="page-header"><h1>회원가입페이지</h1></div>
	<div class="col-xs-4">
		<form action="/user/signup" method="post" enctype="multipart/form-data" role="form">
			<div class="form-group">
				<label for="uname">이름 : </label>
				 <input type="text" id="uname" name="uname" class="form-control"
					placeholder="Enter Name">
			</div>
			<div class="form-group">
				<label for="id">아이디 : </label>
				<input type="text" id="iid" name="id" class="form-control" placeholder="Enter ID">
				<input type="button" value="중복체크" id="idcheck" class="btn btn-primary btn-xs">
				<span id="idmsg"></span>
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
				<label for="email">전화번호 : </label><input type="text" id="phone" name="phone" class="form-control"
					placeholder="Enter PhoneNumber">
			</div>
			<div class="form-group">
				<label for="email">이메일 : </label><input type="email" id="email" name="email" class="form-control"
					placeholder="Enter Email">
			</div>
			<div class="form-group">
				<label for="addr">주소 : </label><input type="text" id="addr" name="addr" class="form-control"
					placeholder="Enter Address">
			</div>
			<div class="form-group">
				<label for="birth">생년월일 : </label> <input type="date" id="birth" name="birth" class="form-control">
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
			<div class="collapse" id="dvPreview1">
				<div id="dvPreview" class="img-thumbnail"></div>
			</div>
			<input type="submit" value="가입" class="btn btn-info">

		</form>
	</div>
</div>
