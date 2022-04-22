/* 비밀번호 변경 버튼을 눌렀을때 */
function chg_password() {
	$(".chgpwd-modal-container").fadeIn();
}
/* 비밀번호 변경 창 닫기를 눌렀을때 */
function chg_password_cancle() {
	$(".chgpwd-modal-container").fadeOut();
}

/* 프로필 아이콘 변경 버튼을 눌렀을때 */
function chg_profile_icon() {
	$(".chgicon-modal-container").fadeIn();
}
/* 프로필 아이콘 변경 창 닫기를 눌렀을때 */
function chg_profile_icon_cancle() {
	$(".chgicon-modal-container").fadeOut();
}


/* 비밀번호 변경 */

function chg_pwd(form){
	console.log(form)
	if (form.elements["current-password"].value=="") {
		alert("현재 비밀번호를 입력해 주세요.");
		form.elements["current-password"].focus();
		return;
	}
	
	if (form.elements["new-password"].value=="") {
		alert("새 비밀번호를 입력해 주세요.")
		form.elements["new-password"].focus();
		return;
	}
	
	if (form.elements["new-password2"].value=="") {
		alert("새 비밀번호 확인을 입력해 주세요.");
		form.elements["new-password2"].focus();
		return;
	}
	
	if (form.elements["new-password"].value != form.elements["new-password2"].value) {
		alert("새 비밀번호와 확인이 일치하지 않습니다.");
		form.elements["new-password"].value="";
		form.elements["new-password2"].value="";
		return;
	}
	
	if (form.elements["password"].value != form.elements["current-password"].value){
		alert("현재 비밀번호가 틀렸습니다.")
		return;
	}
	
	if (form.elements["password"].value == form.elements["current-password"].value){
		$.ajax({
			
			url: "/profile/Chg_Pwd.do",
			type: "post",
			data: { user_no : form.elements["user_no"].value, user_pwd: form.elements["new-password"].value },
			dataType: "text",
			success: function(data) {
				alert("비밀번호가 변경되었습니다");
				location.href = "/profile/profile.do";
			},
			error: function(err) {
				alert("에러" + err)
			}

		})
		
	}
}

/* 프로필 아이콘 변경 */
function chg_icon() {
	$.ajax({
		url: "/profile/Chg_icon.do",
		type: "post",
		data: { profile_icon : document.querySelector('input[name="profile-icon-check"]:checked').value,
				user_no : document.querySelector('input[name="user_no"]').value},
		dataType: "text",
		success: function(data) {
//			document.querySelector('form').submit();
			location.href = "/profile/profile.do";
		},
		error: function(err) {
			alert("에러" + err)
		}

	})
}