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

</style>
</head>

<body class="page-login">

	<div class="page-wrapper">

		<video muted autoplay loop>
			<source id="mp4" src="resources/imgs/LOL1.mp4" type="video/mp4">
		</video>

		<main class="page-first-screen">
			<div class="uk-grid uk-grid-small uk-child-width-1-2@s uk-flex-middle uk-width-1-1"
				data-uk-grid>
				<div>
					<div class="form-login">
						<div class="form-login__box">
							<div class="uk-heading-line uk-text-center">
								<span>ㅈㄱㅊㅇ</span>
							</div>
							<form action="#!">
								<div class="uk-margin">
									<input class="uk-input" type="text" placeholder="Username">
								</div>
								<div class="uk-margin">
									<input class="uk-input" type="password" placeholder="Password">
								</div>
								<div class="uk-margin">
									<a class="uk-button uk-button-danger uk-width-1-1" href="#">로그인</a>
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
									<input class="uk-input" name="user_id" type="text" placeholder="Id" required>
								</div>
								<div class="uk-margin">
									<input class="uk-input" name="user_pwd" type="password" placeholder="Password" required>
								</div>
								<div class="uk-margin">
									<input class="uk-input" name="user_pwd_chk" type="password" placeholder="Password" required>
								</div>
								<div class="uk-margin">
									<input class="uk-input" name="summoner_id" type="text" placeholder="Riot-name" required>
								</div>
								<div class="uk-margin">
									<input class="uk-input" name="phone_number" type="text" placeholder="연락처" required>
								</div>
								<div>
									<ul>
										<li> <input type="checkbox" name="chkAll" id="chk" class="chkAll"/> 이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</li>
										<li> <input type="checkbox" name="chk"/> 이용약관 동의(필수)</li>
										<li> <input type="checkbox" name="chk"/> 개인정보 수집 및 이용에 대한 안내(필수)</li>
									</ul>
								</div>
								
								<div class="uk-margin">
									<button type="submit"
									class="uk-button uk-button-danger uk-width-1-1"
									id="submit" disabled="disabled">가입하기</button>
								</div>
							</form>
						</div>
						
					</div>
<!-- 				</div> -->
			</div>
		</main>
	</div>

	<script src="resources/js/libs.js"></script>
	<script src="resources/js/main.js"></script>
	<script src="resources/js/index.js?ver=1"></script>
</body>

</html>
