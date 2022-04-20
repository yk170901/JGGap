<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ㅈㄱㅊㅇ - 전적과 구인을 한번에</title>
<meta content="Templines" name="author">
<meta content="TeamHost" name="description">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="HandheldFriendly" content="true">
<meta name="format-detection" content="telephone=no">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<link rel="shortcut icon" href="resources/img/favicon.png"
	type="image/x-icon">
<link rel="stylesheet" href="resources/css/libs.min.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/login.css">
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<style type="text/css">
.repair {
	padding: 25px 45px;
}

#sign_up {
	height: 60px;
}

ul>li {
	list-style: none
}

a {
	text-decoration: none;
}

.important {
	height: 600px;
	/*  	margin-right: 7px; */
	margin-left: 100px;
	padding: 30px 30px 30px 30px;
	-webkit-box-shadow: 0px 30px 70px rgba(0, 0, 0, 0.03);
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	border-radius: 25px;
	background: #FFFFFF;
	box-shadow: 0px 30px 70px rgba(0, 0, 0, 0.03);
	/*     opacity: 0.85; */
}

#user_id {
	
	
}
</style>
</head>

<body class="page-login">

	<div class="page-wrapper">

		<video muted autoplay loop>
			<source id="mp4" src="resources/imgs/LOL1.mp4" type="video/mp4">
		</video>

		<main class="page-first-screen">
			<div
				class="uk-grid uk-grid-small uk-child-width-1-2@s uk-flex-middle uk-width-1-1"
				data-uk-grid>
				<div>
					<div class="form-login">
						<div class="form-login__box">
							<div class="uk-heading-line uk-text-center">
								<span>ㅈㄱㅊㅇ</span>
							</div>
							<!-- 로그인 폼 -->
							<form method="get" action="user/login_ok.do">
								<div class="uk-margin">
									<input class="uk-input" name="user_id" type="text"
										placeholder="아이디">
								</div>
								<div class="uk-margin">
									<input class="uk-input" name="user_pwd" type="password"
										placeholder="비밀번호">
								</div>
								<div class="uk-margin">
									<button type="submit"
										class="uk-button uk-button-danger uk-width-1-1" id="submit">로그인</button>
								</div>
								<div class="uk-margin uk-text-center">
									<a href="#">또 잊어먹음?</a>
								</div>
								<hr>
							</form>
							<div class="uk-text-center">
								<span>계정이 없으신가요?</span>
								<button class="uk-margin-small-left" id="modal_on"
									onclick="init()">회원가입</button>
							</div>
						</div>
					</div>
				</div>

				<!-- 				<div class="form-login repair hidden" id="modal" -->
				<!-- 					style="margin-left: 100px; height: 670px;"> -->

				<!-- 회원가입 modal 적용 -->
				<div class="modal hidden important" id="modal">

					<!-- 'X' 닫기창 -->
					<div style="display: flex; justify-content: flex-end;">
						<button class="modal-close" id="jsCloseBtn">X</button>
					</div>

					<!--  회원가입 제목 -->
					<div class="uk-heading-line uk-text-center">
						<span>회원가입</span>
					</div>

					<!-- 회원가입 폼 -->
					<div>
						<form method="get" action="user/join.do">
							<div class="uk-margin">
								<input class="uk-input" id="user_id" name="user_id" type="text"
									placeholder="Id" required>
								<div id="id_check"></div>
							</div>
							<div class="uk-margin">
								<input class="uk-input" id="user_pwd" name="user_pwd" type="password"
									placeholder="Password" required>
							</div>
							<div class="uk-margin">
								<input class="uk-input" id="user_pwd_chk" name="user_pwd_chk" type="password"
									placeholder="Password" required>
							</div>
							<div class="uk-margin">
								<input class="uk-input" name="summoner_id" type="text"
									placeholder="Riot-name" required>
							</div>
							<div class="uk-margin">
								<input class="uk-input" name="phone_number" type="text"
									placeholder="연락처" required>
							</div>
							<div>
								<ul>
									<li><input type="checkbox" name="chkAll" id="chk"
										class="chkAll" /> 이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</li>
									<li><input type="checkbox" name="chk" class="chk" /> 이용약관
										동의(필수)</li>
									<li><input type="checkbox" name="chk" class="chk" /> 개인정보
										수집 및 이용에 대한 안내(필수)</li>
								</ul>
							</div>

							<div class="uk-margin">
								<button type="submit"
									class="uk-button uk-button-danger uk-width-1-1" id="sign_up_submit"
									onclick="confirm()">가입하기</button>
							</div>
						</form>
					</div>

				</div>
				<!-- 				</div> -->
			</div>
		</main>
	</div>

</body>

	<script>
	/* 회원가입 이용약관 동시 체크 */
	$(document).ready(function() {
		$('.chkAll').click(function() {
			$('.chk').prop('checked', this.checked);
		});
	});
	
	// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#user_id").blur(function() {
		
		let user_id = $('#user_id').val();
		$.ajax({
			url : 'user/idCheck.do',
			type : 'post',
			data : {user_id : user_id},
			datatype : "text",
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#sign_up_submit").attr("disabled", true);
					} else {
						
						if(data == 0){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#sign_up_submit").attr("disabled", false);
				
						} else if(user_id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#sign_up_submit").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
							$("#sign_up_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
		
	    function confirm() {
	      let p1 = document.getElementById('user_pwd').value;
	      let p2 = document.getElementById('user_pwd_chk').value;
	      
	      if(p1.length < 6) {
	              alert('입력한 글자가 6글자 이상이어야 합니다.');
	              return false;
	          }
	          
	          if( p1 != p2 ) {
	            alert("비밀번호불일치");
	            return false;
	          } else{
	            alert("비밀번호가 일치합니다");
	            return true;
	          }
	    }
	  
</script>
	<script src="resources/js/libs.js"></script>
	<!-- <script src="resources/js/main.js"></script> -->
	<script src="resources/js/index.js?ver=1"></script>
</html>
