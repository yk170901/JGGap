/* -------------------------------------로드 시작--------------------------------------- */

// 로드 시 실행
window.onload = function() {
	checkChosenUsers();
	canChooseMore();
}

// 댓글쓴이들 중 채택된 유저들의 체크박스 이미지 바꾸기
function checkChosenUsers(){
	var chosen_user_no = document.getElementsByClassName('chosen-users').length;
	var reply_user_no = document.getElementsByClassName('reply-content-repeat').length;
	
	for(var i = 1; (i-1) < reply_user_no; i++){
		for(var ii = 1; (ii-1)< chosen_user_no; ii++){
			if(document.querySelector(".reply-content-repeat:nth-child("+i+") > input").value == document.querySelector("div.chosen-user-list > input:nth-child("+ii+")").value){
				document.getElementsByClassName('check-img')[i-1].setAttribute('src','../resources/imgs/post_detail/checked.png');
			}
		}
	}
}

// 채택을 더 할 수 있는가 확인
function canChooseMore() {
	//ajax로 올라가는 chosen-users를 선택하는 게, 새로 고침해야 오르는 cru-pre보다 낫다
	var chosen_user_no = document.getElementsByClassName('chosen-users').length;
	
	if((chosen_user_no + 1) >= document.getElementById('cru-max').value){
		document.querySelector('.choose-user').setAttribute('disabled','');
		return false;
	}
	return true;
}

/* -------------------------------------로드 끝--------------------------------------- */



/* -------------------------------------모달 시작--------------------------------------- */

var reportBtn = document.querySelector('.report-btn');
var modalBg = document.querySelector('.modal-bg');
var modalClose = document.querySelector('.modal-close');

// 신고
$('.report-btn').on("click", function() {
	modalBg.classList.add('bg-active');
	document.querySelector('#report-target').setAttribute('value',$(this).val());
})

// 신고 모달 닫기
$('.modal-close').on("click", function() {
	modalBg.classList.remove('bg-active');	
})

// 신고 접수
$('#submitReport').on("click", function() {
	// reporter의 user_no은 컨트롤러에서 세션으로 얻어오기
	var report_title = document.querySelector('#report-title').value;
	var report_content = document.querySelector('#report-content').value;
	var report_target = document.querySelector('#report-target').value;
	var post_no = document.querySelector('#post-no').value;
		
	$.ajax({
		url:'/board_view/submitReport.do',
		type : "POST",
		data : {
			report_title : report_title,
			report_content : report_content,
			report_target : report_target,
			post_no : post_no
		}
	})
	
	alert('신고 접수가 완료되었습니다.');
	modalBg.classList.remove('bg-active');
	
	// 신고 후 모달의 내용 초기화
	document.querySelector('#report-title').value = "";
	document.querySelector('#report-content').value = "";
});

/* -------------------------------------모달 끝--------------------------------------- */


// 게시글 삭제
function confirmPostDelete(){
	return confirm("정말로 게시글을 삭제하시겠습니까?");
}

/* -------------------------------------친구 시작--------------------------------------- */

// 친구 추가
$('.befriend').on('click', function(){
	alert($(this).val());
	
	$.ajax({
		url:'/board_view/befriend.do',
		type : "POST",
		data : {
			asked_user_id : $(this).val()
		}
	})
	alert('친구 신청이 완료되었습니다.');
	document.location.reload();
})


// 친구 관계 수정
$('.chg-friend-status').on('click', function(){
	$.ajax({
		url:'/board_view/chgFriendStatus.do',
		type : "POST",
		data : {
			action : $(this).attr('action'),
			user_no : document.getElementById('session-user-no').value,
			friend : $(this).val()
		}
	})
	
	alertOnStatus($(this).attr('action'));
	document.location.reload();
})


// 친구 관계 수정 시 알림 모음
function alertOnStatus(action){
	if(action == 'deleteFriend'){
		alert('친구 삭제가 완료되었습니다.');
	}else if(action == 'cancelFriendRequest'){
		alert('친구 신청이 취소되었습니다.');
	}else if(action == 'cancelBan'){
		alert('차단이 취소되었습니다.');
	}else if(action == 'acceptFriendRequest'){
		alert('친구 신청이 수락되었습니다.');
	}
}

/* -------------------------------------친구 끝--------------------------------------- */


/* -------------------------------------채택 시작--------------------------------------- */

// 채택 버튼 눌렀을 때
$(function() { 
	$('.choose-user').on("click", function() {
		if(!canChooseMore()){
			alert('이미 모집된 인원이 플레이 인원을 충족하였습니다.')
			return;
		}
		var post_no = document.getElementById('post-no').value;
		var writer_no = document.getElementById('writer-no').value;
		var reply_user_no = $(this).children().attr('value'); // 댓글 단 유저 user_no
		
			// 채택을 위해 누른 거라면
			if(!alreadyChosen(reply_user_no)){
				alert('올레디쵸슨 결과 확인 진입 - 이번이 채택임')
				$.ajax({
					url:'/board_view/chooseUser.do',
					type : "POST",
					data : {
						writer_no :  writer_no,
						chosen_user_no : reply_user_no,
						post_no : post_no
					}
				})
				$('.chosen-user-list').append('<input class="chosen-users" value="'+reply_user_no+'">');
			// 채택 해제를 위해 누른 거라면
			}else{
				alert('올레디쵸슨 결과 확인 진입 - 이미 채택됐었음');
				$.ajax({
					url:'/board_view/cancelUser.do',
					type : "POST",
					data : {
						writer_no :  writer_no,
						chosen_user_no : reply_user_no,
						post_no : post_no
					},
				})
				deleteChosenUser(reply_user_no);
				$(this).children().attr('src', '../resources/imgs/post_detail/unchecked.png');
			}
			checkChosenUsers();
	})
});


// 채택이 이미 돼 있던 댓글의 채택 버튼을 누른 것인가 확인
function alreadyChosen(reply_user_no){
	var chosen_user_no = document.getElementsByClassName('chosen-users').length;
	
	for(var i = 0; i< chosen_user_no; i++){
		if(reply_user_no === document.getElementsByClassName('chosen-users')[i].value){
			return true;
		}
	}
	
	return false;
}


// 채택 해제
function deleteChosenUser(reply_user_no){
	var chosen_user_no = document.getElementsByClassName('chosen-users').length;
	
	for(var i = 1; (i-1) < chosen_user_no; i++){
		if(reply_user_no == document.querySelector("div.chosen-user-list > input:nth-child("+i+")").value){
			document.querySelector("div.chosen-user-list > input:nth-child("+i+")").remove();
		}
	}
}


/* -------------------------------------채택 끝--------------------------------------- */

/* -------------------------------------댓글 시작--------------------------------------- */

// 댓글 작성 가능 여부 확인 (공백, 중복 등)
function checkReplyValidation(text){
	if(text == ""){
		alert('댓글 내용을 작성해주세요.');
		return false;
	}
	
	var reply_user_no = document.getElementsByClassName('reply-content-repeat').length;
	
	for(var i = 1; (i-1) < reply_user_no; i++){
		if(document.getElementById('session-user-no').value == document.querySelector(".reply-content-repeat:nth-child("+i+") > input").value){
			alert('이미 신청 댓글을 작성하셨습니다.');
			return false;
		}
	}
}


// 댓글 작성
$('.submit-reply').on('click', function(){
	let text = document.getElementById('new-reply-text').value;
	
	checkReplyValidation(text);
	
	$.ajax({
		url:'/board_view/insertReply.do',
		type : "POST",
		data : {
			post_no : document.getElementById('post-no').value,
			re_text : text,
			user_no : document.getElementById('session-user-no').value
		}
	})
	
	// 중복 작성 방지용 클릭 버튼 disable화
	document.querySelector('.submit-reply').setAttribute('disabled','');
	document.location.reload();
})


// 댓글 삭제
$('.delete-reply').on("click", function() {
	$.ajax({
		url:'/board_view/deleteReply.do',
		type : "POST",
		data : {
			user_re_no : $(this).val()
		}
	})
	
	alert('댓글이 삭제되었습니다.');
	document.location.reload();
});

/* -------------------------------------댓글 끝--------------------------------------- */