$(document).ready(function() {
	
	$.ajax({
		url: "/basic/point.do",
		type: "get",
		dataType: 'text',
		success: function(data) {
			$('.profile_point_value')[0].innerHTML = '사용가능 포인트 <br/>'+data+' points';
		},
		error: function(err) {
			alert("에러" + err)
		}

	})



});
