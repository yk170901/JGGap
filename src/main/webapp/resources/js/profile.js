
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


/* 비밀번호 변경 창 */

$(function () {
	let Check_Pwd = False;
	let Check_NewPwd = False;
	let NexPwd;
	
	$("input[name=password]").blur(function () {
		const password = $(this).val();
		$.ajax({
			url: "/profile/Check_Pwd.do",
			type: "post",
			data : {password: password},
			dataType: "text",
			success: function (data) {
				
			}
		})
	})
	
	
})




