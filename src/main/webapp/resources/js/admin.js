
function grant(){
	
	user_id = document.querySelector('input[name="user_id"]').value;
	badge_file = document.querySelector('input[name="badge_file"]:checked').value;
	
	$.ajax({
		url:'/admin/grant.do',
		type : "POST",
		data : {
			user_id : user_id,
			badge_file : badge_file
		},
		datatype: "text",
		success: function(data){
		if(data == 0){
			Swal.fire({
			icon: 'success',
			title: '처리 완료',
			text: '정상처리 되었습니다.'
			})
			}else {
				Swal.fire({
				icon: 'error',
				title: '오류',
				text: '존재하지 않는 아이디 또는 회원이 보유한 업적 입니다.'
				})
			}
		}
		
	})
}
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
		}).then(function(){
	document.location.href=document.location.href;
	})
	})
	
	modalBg.classList.remove('bg-active');
	
	// 신고 후 모달의 내용 초기화
	document.querySelector('#report_result').value = ""
});

/* -------------------------------------모달 끝--------------------------------------- */

//
//$(document).ready(function(){
//	
//	var nodes = document.getElementsByClassName("nodes");
//	var node = document.getElementsByClassName("nodes");
//	console.log(nodes)
//	if (nodes == "0") {
//		node.innerHTML = "대기중"
//	}else{
//		node.innerHTML = "처리 완료"
//	}
//})
//