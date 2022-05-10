/* -------------------------------------모달 시작--------------------------------------- */

var reportBtn = document.querySelector('.report-btn');
var modalBg = document.querySelector('.modal-bg');
var modalClose = document.querySelector('.modal-close');

// 신고
$('.report-btn').on("click", function() {
	modalBg.classList.add('bg-active');
	document.querySelector('#report-target').setAttribute('value',$(this).val())
})

// 신고 모달 닫기
$('.modal-close').on("click", function() {
	modalBg.classList.remove('bg-active');	
})

// 신고 접수
$('#submitReport').on("click", function() {
	// reporter의 user_no은 컨트롤러에서 세션으로 얻어오기
	var report_title = document.querySelector('#report-title').value
	var report_content = document.querySelector('#report-content').value
	var report_target = document.querySelector('#report-target').value
	var post_no = document.querySelector('#post-no').value
		
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
	
	alert('신고 접수가 완료되었습니다.')
	modalBg.classList.remove('bg-active');
	
	// 신고 후 모달의 내용 초기화
	document.querySelector('#report-title').value = ""
	document.querySelector('#report-content').value = ""
});

/* -------------------------------------모달 끝--------------------------------------- */
