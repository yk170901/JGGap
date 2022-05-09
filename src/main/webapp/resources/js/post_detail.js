// 칼바람 나락 선택 시 게임 옵션 사라지게 하기
$('#category-map').on('change',function(){

	var map = document.getElementById('category-map');
	
	if(map.options[map.selectedIndex].value=='칼바람 나락'){
		document.querySelector('div.game-mode').setAttribute('hidden','');	
	}else{
		document.querySelector('div.game-mode').removeAttribute('hidden');	
	}
})


// 글 작성/수정 시 내용에 빈 값이 있나 체크
function checkValidation(){
	var title = document.getElementById('title').value;
	var context = document.getElementById('content').value;
	var map = document.getElementById('category-map');
	var game = document.getElementById('category-game');
	var cru_max = document.getElementById('category-cru-max');

	var map_value = map.options[map.selectedIndex].value
	var game_value = game.options[game.selectedIndex].value
	var cru_max_value = cru_max.options[cru_max.selectedIndex].value
	
	if(title==""){
		alert("제목을 입력해주세요");
		return false;
	}
	else if(context==""){
		alert("내용을 입력해주세요");
		return false;
	}
	else if(map_value=="none"){
		alert("맵을 선택해주세요");
		return false;
	}
	else if(!(map_value=="칼바람 나락") && (game_value=="none")){
		alert("게임 모드를 선택해주세요");
		return false;
	}
	else if(cru_max_value=="none"){
		alert("모집 인원을 선택해주세요");
		return false;
	}
}


// 수정 취소
function cancelPostUpdate(){
	if(confirm("수정한 내용을 저장하지 않고 끝내시겠습니까?")){
		window.location.href = 'http://localhost:8080/board_view/viewBoard.do?post_no='+document.getElementById('post_no').value;
	}
}


// 작성 취소
function cancelPostInsert(){
	if(confirm("작성한 내용을 저장하지 않고 끝내시겠습니까?")){
		window.location.href = 'http://localhost:8080/board_list/board_list.do';
	}
}