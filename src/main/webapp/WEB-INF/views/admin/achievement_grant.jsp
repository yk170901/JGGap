<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="shortcut icon" href="/resources/imgs/favicon.png" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/admin.css" type="text/css">
</head>
<body>
<%@ include file="/WEB-INF/views/basic/header.jsp"%>
<div id="main-page">
	<form method="POST" action="admin/achievement_grant.do">
		<div id="input_achievements">
			<div class="fixed_position">
				<input id="icon_payments" name="user_no" type="text" placeholder="유저 아이디" required/>
				<div id="payments_button_wrap">
					<button id="payments_button" type="submit"> 확인 </button>
				</div>
			</div>
		</div>
		<div id="icon_select">
			<div id="achievements_select">
				<c:forEach var="i" begin="1" end="2">
					<div class="modal-profile-icon-body">
						<input type="radio" class="profile-icon-radio" name="profile-icon-check" value="${i }" id="${i }">
						<label for="${i }"><img class="modal-profile-icon" src="/resources/imgs/profile_icon/${i }.png" alt="profile"></label>
					</div>
				</c:forEach>
			</div>
		</div>
	</form>
</div>
<%@ include file="/WEB-INF/views/basic/footer.jsp"%>
</body>
</html>
