/* -------------------------------------모달 시작--------------------------------------- */

var reportBtn = document.querySelector('.receipt');
var modalBg = document.querySelector('.modal-bg');
var modalClose = document.querySelector('.modal-close');

// 신고
$('.receipt').on("click", function() {
	modalBg.classList.add('bg-active');
	document.querySelector('#report_url').setAttribute('value',$(this).val());
	document.querySelector('#report_target').setAttribute('value',$(this).parents().children(".help").children(".help2").val());
	
})

// 신고 모달 닫기
$('.modal-close').on("click", function() {
	modalBg.classList.remove('bg-active');	
})

// 신고 접수
$('#submitReport').on("click", function() {
	// reporter의 user_no은 컨트롤러에서 세션으로 얻어오기
	var report_result = document.querySelector('#report-result').value
	var report_target = document.querySelector('#report_target').value
	var report_url = document.querySelector('#report_url').value
	
	$.ajax({
		url:'/admin/accepted.do',
		type : "POST",
		data : {
			report_result : report_result,
			report_target : report_target,
			report_url : report_url
		},
		datatype: "text",
		success: Swal.fire({
		icon: 'success',
		title: '처리 완료',
		text: '정상처리 되었습니다.'
		})
	})
	
	modalBg.classList.remove('bg-active');
	
	// 신고 후 모달의 내용 초기화
	document.querySelector('#report_result').value = ""
});

/* -------------------------------------모달 끝--------------------------------------- */


$(document).read()
