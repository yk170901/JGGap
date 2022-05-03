$(document).ready(function() {
	
	$.ajax({
		url: "/basic/point.do",
		type: "post",
		dataType: 'json',
		success: function(data) {
			$('.profile_point_value')[0].innerHTML = '사용가능 포인트 <br/>'+data.usable_point+' points';
			$('#profile_summoner_id')[0].innerHTML = data.summoner_id;
			$('#profile_img').attr("src", "/resources/imgs/level_icon/"+data.site_level+".gif");
		},
		error: function(err) {
			alert("에러" + err)
		}

	})

});

$(function() { $('#CSC').on("click", function() {
		Swal.fire({
				title : "구현되지 않은 기능입니다.",
				icon : 'warning',
				confirmButtonText: '확인'
			})
	})
})
