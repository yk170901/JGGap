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

/* 채택 헤제를 완료 했을때 */
function honor_rate() {
	$(".honor-modal-container").fadeIn();
}

/* 명예 점수 창 닫기를 눌렀을때 */
function honor_rate_cancle() {
	$(".honor-modal-container").fadeOut();
}


// 비밀번호 변경 엔터키
$(document).ready(function(){
	
	$("input[name=current-password]").keydown(function (key) {
		if(key.keyCode == 13) {
			$("input[name=form-submit]").click();
		}
	})
	
	$("input[name=new-password]").keydown(function (key) {
		if(key.keyCode == 13) {
			$("input[name=form-submit]").click();
		}
	})
	
	$("input[name=new-password2]").keydown(function (key) {
		if(key.keyCode == 13) {
			$("input[name=form-submit]").click();
		}
	})
})


/* 비밀번호 변경 */
function chg_pwd(form){
		
	if (form.elements["current-password"].value=="") {
		Swal.fire({
			icon: 'error',
			confirmButtonColor: '#F46119',
			text: "현재 비밀번호를 입력해 주세요.",
		})
		form.elements["current-password"].focus();
		return;
	}
	
	if (form.elements["new-password"].value=="") {
		Swal.fire({
			icon: 'error',
			confirmButtonColor: '#F46119',
			text: "새 비밀번호를 입력해 주세요.",
		})
		form.elements["new-password"].focus();
		return;
	}
	
	if (form.elements["new-password2"].value=="") {
		Swal.fire({
			icon: 'error',
			confirmButtonColor: '#F46119',
			text: "새 비밀번호 확인을 입력해 주세요.",
		})
		form.elements["new-password2"].focus();
		return;
	}
	
	if (form.elements["new-password"].value.length > 15 || form.elements["new-password"].value.length < 6) {
		Swal.fire({
			icon: 'error',
			confirmButtonColor: '#F46119',
			text: "비밀번호는 6~15 글자로 입력해주세요.",
		})
		form.elements["new-password"].value="";
		form.elements["new-password2"].value="";
		form.elements["new-password"].focus();
		return;
	}
	
	if (form.elements["new-password"].value.search(/\s/) != -1) {
		Swal.fire({
			icon: 'error',
			confirmButtonColor: '#F46119',
			text: "비밀번호는 공백 없이 입력해주세요.",
		})
		form.elements["new-password"].value="";
		form.elements["new-password2"].value="";
		form.elements["new-password"].focus();
		return;
	}
	
	
	if (form.elements["new-password"].value.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi) > 0) {
		Swal.fire({
			icon: 'error',
			confirmButtonColor: '#F46119',
			text: "비밀번호에는 특수문자가 들어갈수 없습니다.",
		})
		form.elements["new-password"].value="";
		form.elements["new-password2"].value="";
		form.elements["new-password"].focus();
		return;
	}
	
	
	if (form.elements["new-password"].value != form.elements["new-password2"].value) {
		Swal.fire({
			icon: 'error',
			confirmButtonColor: '#F46119',
			text: "새 비밀번호와 확인이 일치하지 않습니다.",
		})
		form.elements["new-password"].value="";
		form.elements["new-password2"].value="";
		form.elements["new-password"].focus();
		return;
	}
	
	if (form.elements["password"].value != sha256(form.elements["current-password"].value)){
		Swal.fire({
			icon: 'error',
			confirmButtonColor: '#F46119',
			text: "현재 비밀번호가 틀렸습니다.",
		})
		form.elements["current-password"].focus();
		return;
	}
	
	if (form.elements["password"].value == sha256(form.elements["current-password"].value)){
		$.ajax({
			
			url: "/profile/Chg_Pwd.do",
			type: "post",
			data: { user_no : form.elements["user_no"].value, user_pwd: sha256(form.elements["new-password"].value) },
			dataType: "text",
			success: function(data) {
				Swal.mixin().fire({
					toast: true,
					position: 'center-center',
					showConfirmButton: false,
					timer: 1500,
					timerProgressBar: true,
					icon: 'success',
					title: '비밀번호 변경이 완료 되었습니다.'
				}).then(function(){
					location.href = "/profile/profile.do";
				})
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
			location.href = "/profile/profile.do";
		},
		error: function(err) {
			alert("에러" + err)
		}

	})
}

// 채택 해제
$(function() {
	
	var choice_user_no;
	
	$('.choices_check').on("click", function() {
		
		choice_user_no = $(this).children().attr('value');
		var summoner_id = $(this).prev().children('a').text();
		
		document.getElementsByClassName("honor-modal-title")[0].innerHTML = summoner_id;
		
		Swal.fire({
			title: summoner_id + " 님의 채택을 해제하시겠습니까?",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#F46119',
			cancelButtonColor: 'lightgray',
			confirmButtonText: '해제',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {

				$.ajax({
					url: "/profile/delete_choice.do",
					type: "post",
					data: { choice_user_no: choice_user_no },
					dataType: "text",
					success: function(data) {
						Swal.mixin().fire({
							toast: true,
							position: 'center-center',
							showConfirmButton: false,
							timer: 1500,
							timerProgressBar: true,
							icon: 'success',
							title: '해제중 입니다'
						}).then(function(){
							location.href = "/profile/profile.do";
				})
						
					},
					error: function(err) {
						alert("에러" + err)
					}


				})

			}
		})
	})
	
	// 명예 점수
	$('.honor-modal-submit').on("click", function() {
	
		$.ajax({
		url: "/profile/honor_rate.do",
		type: "post",
		data: { honor_rate : document.querySelector('input[name="honor-check"]').value,
				choice_user_no : choice_user_no},
		dataType: "text",
		success: function(data) {
			Swal.mixin().fire({
				toast: true,
				position: 'center-center',
				showConfirmButton: false,
				timer: 1500,
				timerProgressBar: true,
				icon: 'success',
				title: '투표해 주셔서 감사합니다'
			}).then(function(){
					location.href = "/profile/profile.do";
				})
			
		},
		error: function(err) {
			alert("에러" + err)
		}

		})
		
	})
		
	
		
	// 친구 신청
	$('.friends_check').on("click", function() { 
		var friend_user_no = $(this).children('img').attr('value');
		var friend_summoner_name = $(this).prev().children('a').text();
		var status = "";
		var friend_arr = [];
		
		
		
		Swal.fire({
			title: friend_summoner_name + " 님의 친구 신청을 수락하시겠습니까?",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#F46119',
			cancelButtonColor: 'lightgray',
			confirmButtonText: '수락',
			cancelButtonText: '거절'
		}).then((result) => {
			if (result.isConfirmed) {
				status = '친구'
				friend_arr = [friend_user_no,friend_summoner_name,status]
				friend_status(friend_arr)
			}
			else if (result.isDismissed) {
				Swal.fire({
					title: friend_summoner_name + " 님을 차단하시겠습니까?",
					icon: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#F46119',
					cancelButtonColor: 'lightgray',
					confirmButtonText: '차단',
					cancelButtonText: '취소'
				}).then((result) => {
					if (result.isConfirmed) {
						status = '차단'
						friend_arr = [friend_user_no,friend_summoner_name,status]
						friend_status(friend_arr)
					}
					else if (result.isDismissed) {
						status = "취소"
						friend_arr = [friend_user_no,friend_summoner_name,status]
						friend_status(friend_arr)
					}

				})
			}
			// 이프문 끝
		})

		
	})
	
	// 친구 신청
	function friend_status(friend_arr) {
		$.ajax({
		url: "/profile/friend_status.do",
		type: "post",
		data: { friend_user_no:friend_arr[0],
				friend_summoner_id:friend_arr[1],
				status:friend_arr[2]
		},
		dataType: "text",
		success: function(data) {
			
			var text = ""
			
			switch (friend_arr[2]) {
				case '친구':
					text = friend_arr[1] + '님과 친구가 되었습니다.';
					break;
				case '차단':
					text = friend_arr[1] + '님을 차단하였습니다.';
					break;
				case '취소':
					text = friend_arr[1] + '님의 친구신청을 취소하였습니다.';
					break;
			}

			Swal.mixin().fire({
				toast: true,
				position: 'center-center',
				showConfirmButton: false,
				timer: 1500,
				timerProgressBar: true,
				icon: 'success',
				title: text
			}).then(function() {
				location.href = "/profile/profile.do";
			})

				

		},
		error: function(err) {
			alert("에러" + err)
		}

	})
	}
	
	
	
	
	
})

// 명예 점수
const honor_drawStar = (target) => {
  document.querySelector(`.honor-star span`).style.width = `${target.value * 20}%`;
}

