$(document).ready(function() {
	$.ajax({
		url: "/basic/point.do",
		type: "post",
		dataType: 'json',
		success: function(data) {
			$('.profile-point-value')[0].innerHTML = '사용가능 포인트 <br/>'+data.usable_point+' points';
			$('#profile-summoner-id')[0].innerHTML = data.summoner_id;
			$('#profile-img').attr("src", "/resources/imgs/level_icon/"+data.site_level+".gif");
		}
//		error: function(err) {
//			alert("point에러" + err)
//		}
	})
	$.ajax({
      url: "/basic/level_point.do",
      type: "post",
//      error: function(err) {
//         alert("point에러" + err)
//      }
   })
	$.ajax({
		url: "/basic/friend.do",
		type: "post",
		dataType: 'json',
		success: function(data) {
			$(data).each(function(index){
				content = "";
				content += "<li class='friend-li'><div style='margin-top: 8px; margin-left: 20px; font-size: 13px;'>"+this.friend;				
//				if(this.login_or_not == 1){
//					content += "<div class='friend-login'></div>";					
//				} else{
//					content += "<div class='friend-not-login'></div>";
//				}
				content += "</div></li>"
				$(".friend").append(content);
			})
		}
//		error: function(err) {
//			alert("friend에러" + err)
//		}
	})
	$.ajax({
		url: "/basic/banned.do",
		type: "post",
		dataType: 'json',
		success: function(data) {
			$(data).each(function(index){
				content = "";
				content += "<li class='banned-li'><div style='margin-top: 8px; margin-left: 20px; font-size: 13px;'>"+this.friend;
				content += "</div></li>"
				$(".banned").append(content);
			})
		}
//		error: function(err) {
//			alert("banned에러" + err)
//		}
	})
	
	// 헤더 전적검색 부분
	$("input[name=search]").keydown(function (key) {
		if(key.keyCode == 13) {
			location.href = "/record/record.do?summoner_id=" +$("input[name=search]").val();
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

function Frameset2(page) {
		framecode = "<frameset rows='1*'>"
		+ "<frame name=main src='" + page + "'>"
		+ "</frameset>";

		document.write(framecode);
		document.title = "ㅈㄱㅊㅇ - 전적검색과 구인을 한 번에!";
		document.title.after('<link rel="shortcut icon" href="/resources/imgs/favicon.ico" type="image/x-icon">');
		document.close();	
	}

