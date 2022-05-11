// 이용약관 체크 박스 선택 관련 js 
function checkSelectAll()  {
  // 전체 체크박스
  const checkboxes 
    = document.querySelectorAll('input[name="chk"]');
  // 선택된 체크박스
  const checked 
    = document.querySelectorAll('input[name="chk"]:checked');
  // select all 체크박스
  const selectAll 
    = document.querySelector('input[name="chkAll"]');
  
  if(checkboxes.length === checked.length)  {
    selectAll.checked = true;
  }else {
    selectAll.checked = false;
  }

}

function selectAll(selectAll)  {
  const checkboxes 
     = document.getElementsByName('chk');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}
// 이용약관 체크 박스 선택 관련 js  end

// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
$("#user_id").blur(function() {

	let user_id = $('#user_id').val();
	$.ajax({
		url: 'user/idCheck.do',
		type: 'post',
		data: {
			user_id: user_id
		},
		datatype: "text",
		success: function(data) {
			console.log("1 = 중복o / 0 = 중복x : " + "x"+  data +"y" +user_id);
			if ( user_id == "" || user_id == null || user_id == undefined ) {
				$('#id_check').text("");
				$('#id_check').css('color', 'red');
				$("#sign_up_submit").attr("disabled", true);
			}
			
			if ( user_id.length < 6 || user_id.length > 15) {

					$('#id_check').text("아이디는 영문과 숫자 6~15자리만 가능합니다 :) :)");
					$('#id_check').css('color', 'red');
					$("#sign_up_submit").attr("disabled", true);
			}
			if (user_id.length > 0 && data == user_id) {
				// 1 : 아이디가 중복되는 문구
				$("#id_check").text("사용중인 아이디입니다 :p");
				$("#id_check").css("color", "red");
				$("#sign_up_submit").attr("disabled", true);
			}else if (user_id.length > 0 && user_id.length > 5 && user_id.length < 16 && data != user_id){
					// 0 : 아이디 길이 / 문자열 검사
					$("#id_check").text("사용가능한 아이디 입니다.");
					$("#id_check").css("color", "green");
					$("#sign_up_submit").attr("disabled", false);

					}
		},
		error: function() {
			console.log("실패");
		}
	});
});
// 아이디 유효성 검사 end

// 서머너 아이디 중복 검사
$("#summoner_id").blur(function() {

	let summoner_id = $('#summoner_id').val();
	$.ajax({
		url: 'user/summoner_Check.do',
		type: 'post',
		data: {
			summoner_id: summoner_id
		},
		datatype: "text",
		success: function(data) {

			if (data == 1) {

				$("#summoner_check").text("사용중인 아이디입니다.");
				$("#summoner_check").css("color", "red");
				$("#sign_up_submit").attr("disabled", true);
			} else {

				$("#summoner_check").text("사용가능한 아이디 입니다 :p");
				$("#summoner_check").css("color", "green");
				$("#sign_up_submit").attr("disabled", false);
			}
		},
		error: function() {
			console.log("실패");
		}
	});
});
// 서머너 아이디 중복 검사 end

/* 회원가입 비밀번호 확인 */
function confirm() {
		
	let p1 = document.getElementById('user_pwd').value;
	let p2 = document.getElementById('user_pwd_chk').value;
	let c1 = document.getElementById("chk1").checked;
	let c2 = document.getElementById("chk2").checked;
		
	if (c1 == false || c2 == false) {
		Swal.fire("이용약관, 개인정보 수집 및 이용에 동의해주세요.");
		return false;
	}

	if (p1.length < 6 || p1.length > 15) {
		Swal.fire('비밀번호는 영문, 숫자, 특수문자로만 이루어진 6~15자리만 가능합니다');
		return false;
	}
	if (p1 != p2) {
		Swal.fire("비밀번호 불일치");
		return false;
	} else {
		Swal.fire("비밀번호가 일치합니다");
		return true;
	}
}

/* 회원가입 비밀번호 확인 end */

function confirm2() {
	
	let i1 = document.getElementsByClassName('user_id')[0].value;
	let p1 = document.getElementsByClassName('user_pwd')[0].value;
	
	alert(i1 + "/" + p1);
	
	if ( i1.value == null){
		Swal.fire("아이디를 입력해주세요");
		return false;
	}
	if ( p1.value == null){
		Swal.fire("비밀번호를 입력해주세요");
		return false;
	}
	
}


// 아이디칸 한글 입력 방지
function chkCharCode(event) {
	const regExp = /[^0-9a-zA-Z]/g;
	const ele = event.target;
	if (regExp.test(ele.value)) {
		ele.value = ele.value.replace(regExp, '');
	}
};

// 아이디칸 한글 입력 방지 end

// 로그인 버튼 엔터 적용
$(document).ready(function(){
	
	$("input[name=user_id]").keydown(function (key) {
		if(key.keyCode == 13) {
			$("input[name=login]").click();
		}
	})
	
	$("input[name=user_pwd]").keydown(function (key) {
		if(key.keyCode == 13) {
			$("input[name=login]").click();
		}
	})
})
// 로그인 버튼 엔터 적용 end

// 회원가입 모달 관련 js 
function showPopup(event) {

	// modal open
	const elementsList = document.querySelectorAll('#modal')
		
	elementsList.forEach((ele) => {
		ele.classList.remove('hidden')
	})
}

function init() {
	const buttonElementList = document.querySelectorAll('#modal_on')

	buttonElementList.forEach(button => {
		button.addEventListener('click', showPopup)
	})
	
	const modalCloseHandler = (event) => {
		if (event.keyCode === 27) {
			const elementsList = document.querySelectorAll('#modal')
			elementsList.forEach((ele) => {
				ele.classList.add('hidden')
			})
		}
	}

	const modal = document.getElementById('modal')
	const close = document.getElementById('jsCloseBtn')
	
	//Hide modal
	close.addEventListener('click', () => {
		modal.classList.add('hidden')
	})

	// 모달 종료
	window.addEventListener('keyup', modalCloseHandler)

}

// 회원가입 모달 관련 js end
