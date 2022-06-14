// 칼바람 나락 선택 시 게임 옵션 사라지게 하기
$('#category-map').on('change',function(){

	var map = document.getElementById('category-map');
	
	if(map.options[map.selectedIndex].value=='칼바람 나락'){
		document.querySelector('div.game-mode').setAttribute('hidden','');	
	}else{
		document.querySelector('div.game-mode').removeAttribute('hidden');	
	}
})

function checkUpdateValidation(){
	var title = document.getElementById('title').value;
	var context = document.getElementById('content').value;
	
	if(title==""){
		Swal.fire({
			title: "수정 오류!",
			text : "제목을 입력해주세요.",
			icon : "error",
			confirmButtonText : "확인"
		});
		return false;
	}
	else if(context==""){
		Swal.fire({
			title: "수정 오류!",
			text : "내용을 입력해주세요.",
			icon : "error",
			confirmButtonText : "확인"
		});
		return false;
	}
	
	return true;
}

// 글 작성/수정 시 내용에 빈 값이 있나 체크
function checkValidation(){
	var title = document.getElementById('title').value;
	var context = document.getElementById('content').value;
	var map = document.getElementById('category-map');
	var game = document.getElementById('category-game');
	var cru_max = document.getElementById('category-cru-max');

	var map_value = map.options[map.selectedIndex].value;
	var game_value = game.options[game.selectedIndex].value;
	var cru_max_value = cru_max.options[cru_max.selectedIndex].value;
	
	if(title==""){
		Swal.fire({
			title: "작성 오류!",
			text : "제목을 입력해주세요.",
			icon : "error",
			confirmButtonText : "확인"
		});
		return false;
	}
	else if(context==""){
		Swal.fire({
			title: "작성 오류!",
			text : "내용을 입력해주세요.",
			icon : "error",
			confirmButtonText : "확인"
		});
		return false;
	}
	else if(map_value=="none"){
		Swal.fire({
			title: "작성 오류!",
			text : "맵을 선택해주세요.",
			icon : "error",
			confirmButtonText : "확인"
		});
		return false;
	}
	else if(!(map_value=="칼바람 나락") && (game_value=="none")){
		Swal.fire({
			title: "작성 오류!",
			text : "게임 모드를 선택해주세요.",
			icon : "error",
			confirmButtonText : "확인"
		});
		return false;
	}
	else if(cru_max_value=="none"){
		Swal.fire({
			title: "작성 오류!",
			text : "플레이 인원을 선택해주세요.",
			icon : "error",
			confirmButtonText : "확인"
		});
		return false;
	}
	
	return true;
}


// 관리자 수정 취소
function cancelAdminPostUpdate(){
	Swal.fire({
	     title: "잠깐!",
	     text: "수정한 내용을 저장하지 않고 끝내시겠습니까?",
	     icon: "warning",
		 showCancelButton: true,
		 confirmButtonText: '확인',
		 cancelButtonText: '취소'
	}).then((goBack) => {
	     if (goBack.isConfirmed) {
	     	window.location.href = 'http://localhost:8080/board_view/viewAdminBoard.do?post_no='+document.getElementById('post_no').value;
		}
	});
}


// 수정 취소
function cancelPostUpdate(){
	Swal.fire({
	     title: "잠깐!",
	     text: "수정한 내용을 저장하지 않고 끝내시겠습니까?",
	     icon: "warning",
		 showCancelButton: true,
		 confirmButtonText: '확인',
		 cancelButtonText: '취소'
	}).then((goBack) => {
	     if (goBack.isConfirmed) {
	     	window.location.href = 'http://localhost:8080/board_view/viewBoard.do?post_no='+document.getElementById('post_no').value;
		}
	});
}

// 작성 취소
function cancelPostInsert(){
	Swal.fire({
	     title: "잠깐!",
	     text: "작성한 내용을 저장하지 않고 끝내시겠습니까?",
	     icon: "warning",
		 showCancelButton: true,
		 confirmButtonText: '확인',
	  	 cancelButtonText: '취소'
	}).then((goBack) => {
	     if (goBack.isConfirmed) {
	     	window.location.href = 'http://localhost:8080/board_list/board_list.do';
		}
	});
}