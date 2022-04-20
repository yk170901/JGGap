<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 아이콘 변경</title>
</head>
<body>

<!-- 프로필 아이콘 변경 모달 -->
	<div class="modal chgicon-modal-container" id="modal" tabindex="-1"
		role="dialog">
		<div class="modal-content chgicon-modal-content">
			<div class="modal-header chgicon-modal-header">
				<h4 class="modal-title chgicon-modal-title">변경할 아이콘을 선택하세요</h4>
			</div>
			<div class="modal-body chgicon-modal-body">
				<form class="profile-icon-form" action="#" method="get">
					<div class="profile-icon-list">
						<c:forEach var="i" begin="1" end="9">
							<div class="modal-profile-icon-body">
								<input type="radio" class="profile-icon-radio" name="profile-icon-check" value="${i }" id="${i }">
								<label for="${i }"><img class="modal-profile-icon" src="/resources/imgs/profile_icon/${i }.png" alt="profile"></label>
							</div>
						</c:forEach>
					</div>
					<div class="chgicon-modal-button">
						<div class="chgicon-modal-button-body">
							<button type="button" class="chgicon-modal-submit">
								<span>확인</span>
							</button>
							<button type="button" class="modal-close chgicon-modal-close"
								onclick="chg_profile_icon_cancle()">
								<span>취소</span>
							</button>
						</div>
					</div>
				</form>	
			</div>
			
		</div>
		<div class="modal_layer"></div>
	</div>
</body>
</html>