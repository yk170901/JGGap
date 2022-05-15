$(document).ready(function() {

	// 포인트 지급 시스템
	var now_time = Math.ceil(new Date().getTime() / 1000);
	var yesterday_time = 0;
	var point = 0;
	//	alert(now_time)

	if ((now_time % 86400) == 54000) {
		yesterday_time = Math.ceil(now_time - 86400)
		// 채택테이블에서 가장 마지막에 등록한 유저 가져오기
		$.ajax({
			url: "/basic/choice_time.do",
			type: "post",
			dataType: 'json',
			success: function(choice) {
				//			console.log(choice)
				for (var i = 0; i < choice.length; i++) {

					var summoner_id = choice[i].summoner_id;

					record_time(choice[i]);
					if (point != 0) {
						taking_choice(choice[i].user_no, point)
					}
					point = 0;

				}

			},
			error: function(err) {
				alert("choice_time_에러" + err)
			}
		})

		// 24시간내에 한 게임 가져오기
		function record_time(choice) {
			//		console.log(choice)
			$.ajax({
				url: "/basic/record_time.do",
				type: "post",
				data: {
					summoner_id: choice.summoner_id,
					game_timestamp: now_time,
					yesterday_time: yesterday_time
				},
				dataType: 'json',
				async: false,
				success: function(record) {
					//				console.log(record)

					for (var j = 0; j < record.length; j++) {
						//					console.log(choice,record[j])
						choice_record_check(choice, record[j])
					}

				},
				error: function(err) {
					alert("record_time_에러" + err)
				}
			})


		}

		// 채택에 있는 유저와 같이 게임을 했는지 가져오기
		function choice_record_check(choice, record) {
			//		console.log(choice.opp_summoner_id)
			//		var team;
			switch (record.summoner_id) {
				case record.blue_summonerid1:
				case record.blue_summonerid2:
				case record.blue_summonerid3:
				case record.blue_summonerid4:
				case record.blue_summonerid5:
					team = 1;
					break;
				case record.red_summonerid1:
				case record.red_summonerid2:
				case record.red_summonerid3:
				case record.red_summonerid4:
				case record.red_summonerid5:
					team = 2;
					break;
				default:
					team = 3;
			}
			var YN
			switch (team) {
				case 1:
					//				console.log('블루')
					switch (choice.opp_summoner_id) {
						case record.blue_summonerid1:
						case record.blue_summonerid2:
						case record.blue_summonerid3:
						case record.blue_summonerid4:
						case record.blue_summonerid5:
							YN = "Y"
							break
						default:
							YN = "N"
							break
					}
					break;
				case 2:
					//			console.log('레드')
					switch (choice.opp_summoner_id) {
						case record.red_summonerid1:
						case record.red_summonerid2:
						case record.red_summonerid3:
						case record.red_summonerid4:
						case record.red_summonerid5:
							YN = "Y"
							break
						default:
							YN = "N"
							break
					}
					break;
				case 3:
					//				console.log('없음')
					YN = "N"
					break;
			}
			//		console.log(team+YN)

			if (YN == "Y") {
				//			console.log(choice.summoner_id)
				win_mode_check(record, choice)
				//			console.log("최종" + point)
			}

		}

		// 모드별 승패 여부 체크
		function win_mode_check(record, choice) {
			//		console.log(record)
			//		console.log(choice.user_no)
			//		console.log("넘어옴")
			if ((record.game_mode == "솔로 랭크" || record.game_mode == "자유 랭크") && record.win == "True") {
				point += 10;
			}
			else if ((record.game_mode == "솔로 랭크" || record.game_mode == "자유 랭크") && record.win == "False") {
				point += 5;
			}
			else if (record.game_mode == "일반" && record.win == "True") {
				point += 7;
			}
			else if (record.game_mode == "일반" && record.win == "False") {
				point += 3;
			}
			else if (record.game_mode == "칼바람 나락" && record.win == "True") {
				point += 3;
			}
			else if (record.game_mode == "칼바람 나락" && record.win == "False") {
				point += 1;
			}
			else {
				point += 0;
			}

		}

		// 채택목록 가져와서 점수 부여
		function taking_choice(user_no, point) {
			//		console.log(user_no,point,"taking_choice")

			$.ajax({
				url: "/basic/taking_choice.do",
				type: "post",
				data: { user_no: user_no },
				dataType: 'json',
				async: false,
				success: function(data) {
					//				console.log(data)
					var user_no_list = [];

					for (var k = 0; k < data.length; k++) {
						user_no_list[k] = data[k].choice_user_no
					}
					user_no_list[data.length] = user_no


					for (var k = 0; k < user_no_list.length; k++) {
						//					console.log(user_no_list[k])

						$.ajax({
							url: "/basic/giving_point.do",
							type: "get",
							data: {
								user_no: user_no_list[k],
								point: point
							},
							async: false,
							success: function() {



							},
							error: function(err) {
								alert("taking_choice_에러" + err)
							}
						})
					}



				},
				error: function(err) {
					alert("taking_choice_에러" + err)
				}
			})
		}
	}





	$.ajax({
		url: "/basic/point.do",
		type: "post",
		dataType: 'json',
		success: function(data) {
			$('.profile-point-value')[0].innerHTML = '사용가능 포인트 <br/>' + data.usable_point + ' points';
			$('#profile-summoner-id')[0].innerHTML = data.summoner_id;
			$('#profile-img').attr("src", "/resources/imgs/level_icon/" + data.site_level + ".gif");
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
			$(data).each(function(index) {
				content = "";
				content += "<li class='friend-li'><div style='margin-top: 8px; margin-left: 20px; font-size: 13px;'>" + this.friend;
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
			$(data).each(function(index) {
				content = "";
				content += "<li class='banned-li'><div style='margin-top: 8px; margin-left: 20px; font-size: 13px;'>" + this.friend;
				content += "</div></li>"
				$(".banned").append(content);
			})
		}
		//		error: function(err) {
		//			alert("banned에러" + err)
		//		}
	})

	// 헤더 전적검색 부분
	$("input[name=search]").keydown(function(key) {
		if (key.keyCode == 13) {
			location.href = "/record/record.do?summoner_id=" + $("input[name=search]").val();
		}
	})
});

$(function() {
	$('#CSC').on("click", function() {
		Swal.fire({
			title: "구현되지 않은 기능입니다.",
			icon: 'warning',
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

