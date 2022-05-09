/* 프로필 아이콘 변경 */
function grant() {
	$.ajax({
		url: "/grant.do",
		type: "post",
		data: { badge_file : document.querySelector('input[name="badge_file"]:checked').value,
				user_id : document.querySelector('input[name="user_id"]').value},
		dataType: "text",
		success: function(data) {
			location.href = "/admin/achievement_grant.do";
		},
		error: function(err) {
			alert("에러" + err)
		}

	})
}
