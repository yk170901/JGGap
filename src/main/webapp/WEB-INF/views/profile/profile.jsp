<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" href="/resources/css/profile.css" type="text/css">
</head>
<body>
	<%@ include file="/WEB-INF/views/basic/header.jsp" %>
	<main class="page-main">

		<div class="page-body">
			<div class="profile-body">
				<div class="profile-info">
					<div class="profile-info-icon">
						<img class="profile-icon" src="/resources/imgs/profile_icon/7.png" alt="profile">
					</div>
					<div class="profile-user">
						<div class="profile-user-title">네네스노윙순살</div>
						<div class="profile-user-text">명예지수 0.5 / 5.0</div>
					</div>
				</div>
				<div class="profile-button-body">
					<a class="profile-button" href="#!"><span class="profile-button-text">비밀번호 변경</span></a>
					<a class="profile-button" href="#!"><span class="profile-button-text">전적 보기</span></a>
				</div>
			</div>
			<div class="badges-box">
				<div class="badges-head">
					<h2 class="badges-title">활동 뱃지</h2>
				</div>
				<div class="badges-body">
					<ul class="badges-list">
                    	<li><img class="badges" src="/resources/imgs/profile_icon/9.png" alt="badge"><span>badge name</span></li>
                    	<li><img class="badges" src="/resources/imgs/profile_icon/9.png" alt="badge"><span>badge name</span></li>
                    	<li><img class="badges" src="/resources/imgs/profile_icon/9.png" alt="badge"><span>badge name</span></li>
                    </ul>
				</div>
			</div>
			<div class="board-box">
				<div class="boardlist-head">
					<h2 class="boardlist-title">활동 뱃지</h2>
				</div>
			
			</div>
		</div>



	</main>
	<%@ include file="/WEB-INF/views/basic/footer.jsp" %>
</body>
</html>