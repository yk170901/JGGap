<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	<form method="get" action="grant.do">
		<div id="input_achievements">
			<div class="fixed_position">
				<input id="icon_payments" name="user_id" type="text" placeholder="유저 아이디" required/>
				<div id="payments_button_wrap">
					<button id="payments_button" type="submit"> 확인 </button>
				</div>
			</div>
			<div id="icon_select">
				<div id="achievements_select">
					<c:forEach var="i" begin="1" end="9">
						<div class="modal-profile-icon-body">
							<input type="radio" class="profile-icon-radio" name="badge_file" value="${i}" id="${i}">
							<label for="${i}"><img class="modal-profile-icon" src="/resources/imgs/profile_icon/${i}.png"></label>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</form>
</div>
<%@ include file="/WEB-INF/views/basic/footer.jsp"%>
</body>
</html>
