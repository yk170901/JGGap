// 댓글 쓸 때, 이미 db에 해당 user_no 있으면 막기.
// 채택 버튼을 누를 경우, 글쓴이가 아니면 아무런 이벤트도 나타나지 않게 하기

function checkValidation(){
	var title = document.getElementById('title').value;
	var context = document.getElementById('content').value;
	var map = document.getElementById('category-map');
	var game = document.getElementById('category-game');
	var recruitment = document.getElementById('category-recruitment');

	var map_value = map.options[map.selectedIndex].value
	var game_value = game.options[game.selectedIndex].value
	var recruitment_value = recruitment.options[recruitment.selectedIndex].value
	
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
	else if(game_value=="none"){
		alert("게임 모드를 선택해주세요");
		return false;
	}
	else if(recruitment_value=="none"){
		alert("모집 인원을 선택해주세요");
		return false;
	}
}

function checkUser(){
	
	if(true){
		document.getElementById("check-img").src = "../resources/imgs/post_detail/checked.png";
		return true;
	}	
	/*return false;*/
}



function confirmDiscard(){
	var confirm = confirm("작성한 내용을 저장하지 않고 끝내시겠습니까?");
	
	if(confirm){
		
	}
}

function confirmDelete(){
	var confirm = confirm("게시글을 삭제하시겠습니까?");
	
	if(confirm){
		
	}
}


