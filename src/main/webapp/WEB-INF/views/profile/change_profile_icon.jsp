<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 프로필 아이콘 변경 모달 -->
	<div class="modal chgicon-modal-container" id="modal" tabindex="-1"
		role="dialog">
		<div class="modal-content chgicon-modal-content">
			<div class="modal-header chgicon-modal-header">
				<h4 class="modal-title chgicon-modal-title">변경할 아이콘을 선택하세요</h4>
			</div>
			<div class="modal-body">
				<form class="profile-icon-from" action="#" method="get">
					<div class="profile-icon-list">
						<div class="modal-profile-icon-body">
							<input type="radio" class="profile-icon-radio" name="profile-icon-check" value="1" id="1">
							<label for="1"><img class="modal-profile-icon" src="/resources/imgs/profile_icon/1.png" alt="profile"></label>
						</div>
						<div class="modal-profile-icon-body">
							<input type="radio" class="profile-icon-radio" name="profile-icon-check" value="2" id="2">
							<label for="2"><img class="modal-profile-icon" src="/resources/imgs/profile_icon/2.png" alt="profile"></label>
						</div>
						<div class="modal-profile-icon-body">
							<input type="radio" class="profile-icon-radio" name="profile-icon-check" value="3" id="3">
							<label for="3"><img class="modal-profile-icon" src="/resources/imgs/profile_icon/3.png" alt="profile"></label>
						</div>
						<div class="modal-profile-icon-body">
							<input type="radio" class="profile-icon-radio" name="profile-icon-check" value="4" id="4">
							<label for="4"><img class="modal-profile-icon" src="/resources/imgs/profile_icon/4.png" alt="profile"></label>
						</div>
						<div class="modal-profile-icon-body">
							<input type="radio" class="profile-icon-radio" name="profile-icon-check" value="5" id="5">
							<label for="5"><img class="modal-profile-icon" src="/resources/imgs/profile_icon/5.png" alt="profile"></label>
						</div>
						<div class="modal-profile-icon-body">
							<input type="radio" class="profile-icon-radio" name="profile-icon-check" value="6" id="6">
							<label for="6"><img class="modal-profile-icon" src="/resources/imgs/profile_icon/6.png" alt="profile"></label>
						</div>
						<div class="modal-profile-icon-body">
							<input type="radio" class="profile-icon-radio" name="profile-icon-check" value="7" id="7">
							<label for="7"><img class="modal-profile-icon" src="/resources/imgs/profile_icon/7.png" alt="profile"></label>
						</div>
						<div class="modal-profile-icon-body">
							<input type="radio" class="profile-icon-radio" name="profile-icon-check" value="8" id="8">
							<label for="8"><img class="modal-profile-icon" src="/resources/imgs/profile_icon/8.png" alt="profile"></label>
						</div>
						<div class="modal-profile-icon-body">
							<input type="radio" class="profile-icon-radio" name="profile-icon-check" value="9" id="9">
							<label for="9"><img class="modal-profile-icon" src="/resources/imgs/profile_icon/9.png" alt="profile"></label>
						</div>
					</div>
				</form>
				
			</div>
			<div class="modal-footer chgicon-modal-footer">
				<div class="chgicon-modal-button">
					<button type="button" class="chgicon-modal-submit"
						onclick="#">
						<span>확인</span>
					</button>
					<button type="button" class="modal-close chgicon-modal-close"
						onclick="chg_profile_icon_cancle()">
						<span>취소</span>
					</button>
					</div>
			</div>
		</div>
		<div class="modal_layer"></div>
	</div>
</body>
</html>