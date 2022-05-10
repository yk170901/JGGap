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
			alert("point에러" + err)
		}
	})
	$.ajax({
      url: "/basic/level_point.do",
      type: "post",
      error: function(err) {
         alert("point에러" + err)
      }
   })
	$.ajax({
		url: "/basic/friend.do",
		type: "post",
		dataType: 'json',
		success: function(data) {
			$(data).each(function(index){
				content = "";
				content += "<li class='friend-li'><div>"+this.friend;				
				if(this.login_or_not == 1){
					content += "<div class='friend-login'></div>";					
				} else{
					content += "<div class='friend-not-login'></div>";
				}
				content += "</div></li>"
				$(".friend").append(content);
			})
		},
		error: function(err) {
			alert("friend에러" + err)
		}
	})
	$.ajax({
		url: "/basic/banned.do",
		type: "post",
		dataType: 'json',
		success: function(data) {
			$(data).each(function(index){
				content = "";
				content += "<li class='banned-li'><div>"+this.friend;
				content += "</div></li>"
				$(".banned").append(content);
			})
		},
		error: function(err) {
			alert("banned에러" + err)
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

//$(window).bind("beforeunload", function (e){
//	$.ajax({
//		url: "/basic/logoutESC.do",
//		type: "post"
//	})
//});

