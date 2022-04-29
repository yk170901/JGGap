// 댓글 쓸 때, 이미 db에 해당 user_no 있으면 막기.
// 채택 버튼을 누를 경우, 글쓴이가 아니면 아무런 이벤트도 나타나지 않게 하기

// 모달

var reportBtn = document.querySelector('.report-btn');
var modalBg = document.querySelector('.modal-bg');
var modalClose = document.querySelector('.modal-close');

$('.report-btn').on("click", function() {
	modalBg.classList.add('bg-active');
})

$('.modal-close').on("click", function() {
	modalBg.classList.remove('bg-active');
})

/*modalClose.addEventListener('click',function(){
	modalBg.classList.remove('bg-active');
})*/



// 수정 페이지 로드 될 때 자동 실행 함수
function get_chosen_options(){
	
	/* 유저가 일전에 입력했던 값 */
	var game_map_chosen = document.getElementById("game-map-chosen").value
	var game_mode_chosen = document.getElementById("game-mode-chosen").value
	var cru_max_chosen = document.getElementById("cru-max-chosen").value
	
	var map = document.getElementById('category-map').options.len;
	var game = document.getElementById('category-game');
	var cru_max = document.getElementById('category-cru-max');
	
	map.value = game_map_chosen;
	game.value = game_mode_chosen;
	cru_max.value = cru_max;
	
	
}


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
	else if(game_value=="none"){
		alert("게임 모드를 선택해주세요");
		return false;
	}
	else if(cru_max_value=="none"){
		alert("모집 인원을 선택해주세요");
		return false;W
	}
}

/* 삭제 버튼 */
function confirmPostDelete(){
	return confirm("정말로 게시글을 삭제하시겠습니까?");
}

/* 수정 취소 */
function cancelPostUpdate(){
	if(confirm("수정한 내용을 저장하지 않고 끝내시겠습니까?")){
		window.location.href = 'http://localhost:8080/board_view/viewBoard.do?post_no='+document.getElementById('post_no').value;
	}
}

/* 작성 취소 */
function cancelPostInsert(){
	if(confirm("작성한 내용을 저장하지 않고 끝내시겠습니까?")){
		window.location.href = 'http://localhost:8080/board_list/board_list.do';
	}
}

// 채택 버튼 눌렀을 때
$(function() { 
	$('.choose-user').on("click", function() {
		
		var writer_no = document.getElementById('writer_no').value;
		var reply_user_no = $(this).children().attr('value'); // 댓글 단 유저 user_no
			
			// 채택을 위해 누른 거라면
			if(!alreadyChosen(writer_no, reply_user_no)){	
				alert('올레디쵸슨 결과 확인 진입 - 이번이 채택임')
				alert('채택되는 유저 넘버 ='+ reply_user_no) // 0
				$.ajax({
					url:'/board_view/chooseUser.do',
					type : "POST",
					data : {
						writer_no :  writer_no,
						chosen_user_no : reply_user_no
					},
				})
				alert("올레디쵸슨 채택 끝남")
				$(this).children().attr('src', '../resources/imgs/post_detail/checked.png');
			// 채택 해제를 위해 누른 거라면
			}else{
				alert('올레디쵸슨 결과 확인 진입 - 이미 채택됐었음')
				$(this).children().attr('src', '../resources/imgs/post_detail/unchecked.png');
			}
		
	})
});

// 채택이 이미 돼 있던 댓글의 채택 버튼을 누른 것인가 확인
function alreadyChosen(writer_no, reply_user_no){
	alert("올레디쵸슨 진입");
	
	$.ajax({
		url:'/board_view/checkReplyIfChosen.do'
		, type : "post"
		, data : {
			"writer_no" : writer_no,
			"chosen_user_no" : reply_user_no
		}
		, dataType: "text"
		, sucess : function(resp){
			alert('올레디쵸슨 결과 : '+resp);
			if(resp == false){
				alert(resp);
			}else{
				alert(resp);
			}
			return resp;
		}
		, error : function(data, request, err){
			alert(data+" code = "+ request.status+"\n error = " +err);						
		}
		
	})
	
}
	