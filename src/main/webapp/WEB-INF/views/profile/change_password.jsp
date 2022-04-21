<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>

	<!-- 비밀번호 변경 모달 -->
	<div class="modal chgpwd-modal-container" id="modal" tabindex="-1"
		role="dialog">
		<div class="modal-content chgpwd-modal-content">
			<div class="modal-header chgpwd-modal-header">
				<h4 class="modal-title chgpwd-modal-title">비밀번호 변경</h4>
				<button type="button" class="modal-close chgpwd-modal-close"
					onclick="chg_password_cancle()">
					<span>X</span>
				</button>
			</div>
			<div class="modal-body chgpwd-modal-body">
				<form class="password_form" name="password_form">
					<div class="form-group">
						<input type="hidden" name="user_no" class="form-box" value=${sessionScope.user_no }  required />
						<input type="hidden" name="password" class="form-box" value="${profile_info.user_pwd }" required />
					</div>
					<div class="form-group">
						<label>현재 비밀번호</label> <input type="password" name="current-password"
							class="form-box" required />
					</div>
					<div class="form-group">
						<label>새 비밀번호 <small>(필수)</small></label> <input type="password"
							name="new-password" class="form-box" required />
					</div>
					<div class="form-group">
						<label>새 비밀번호 확인 <small>(필수)</small></label> <input
							type="password" name="new-password2" class="form-box" required />
					</div>
					<div class="form-group" style="text-align: right">
						<input class="form-submit" type="button" value="비밀번호 변경 확인" onclick="chg_pwd(password_form)" />
					</div>
				</form>
			</div>
		</div>
			<div class="modal_layer"></div>
	</div>

</body>
</html>