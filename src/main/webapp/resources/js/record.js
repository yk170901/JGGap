$(function() {
	
	// 전적 더보기 버튼 클릭시
	var begin_num = 6;
	var user_no =$('.summoner-summoner-id').attr('value')
	$('.summoner-record-more').on("click", function() {

		$.ajax({
			url: "/record/record_more.do",
			type: "post",
			data: { begin_num: begin_num,
					user_no: user_no },
			dataType: "json",
			success: function(data) {
				if (data == "") {
					Swal.fire({
						icon: 'error',
						confirmButtonColor: '#F46119',
						text: "불러올 전적이 없습니다",
					})
				}
					
					record_more(data);
					
			},
			error: function(err) {
				alert("에러" + err)
			}


		})


	})
	
	// 전적 더보기 버튼 클릭시
	function record_more(data) {

		var content = "";
		for (var record in data) {
			if(data[record].win == 'True') {
content += '					<div class="summoner-record record-win">';
content += '						<div class="summoner-record-result result-win"></div>';
			}
			else{
content += '					<div class="summoner-record record-lose">';
content += '						<div class="summoner-record-result result-lose"></div>';				
			}
content += '					<div class="summoner-record-content">'
content += '						<div class="summoner-record-info">'
			if(data[record].win == 'True') {
content += '								<span class="info-game-result game-win">승리</span>'
			}
			else{
content += '								<span class="info-game-result game-lose">패배</span>'	
			}
content += '							<span class="info-game-mode">'+ data[record].game_mode +'</span>'
content += '							<span class="info-game-time">'+ data[record].game_duration +'</span>'
content += '							<c:set var="timestamp" value="${score.game_timestamp}" />'

			var timestamp = data[record].game_timestamp;
			var hour = Math.round( ( ( (new Date().getTime()) / 1000) - timestamp ) / 240 );
			var day = 0;
			if (hour >= 24) {
				day = Math.round(hour/24);
			}

			
			if (day == 0) {
content += '								<span class="info-game-past">'+ hour +' 시간 전</span>'				
			}
			else {
				if (day <= 6) {
content += '									<span class="info-game-past">'+ day +' 일 전</span>'					
				}
				else {
					var now = new Date()
					now.setDate(now.getDate()-day);
content += '									<span class="info-game-past">'+(now.getMonth()+1)+'월 ' +now.getDate()+'일</span>'					
				}
			}
content += '						</div>'
content += '						<div class="summoner-record-stat">'
content += '							<div class="stat-champion">'
content += '								<div class="stat-champion-icon">'
content += '									<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].champion_name +'.png">'
content += '									<div class="champion-level">'+ data[record].champion_level +'</div>'
content += '								</div>'
content += '								<div class="stat-champion-spells">'
content += '									<div class="stat-champion-spell">'
content += '										<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/spell/'+ data[record].spell_fir +'.png">'
content += '									</div>'
content += '									<div class="stat-champion-spell">'
content += '										<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/spell/'+ data[record].spell_sec +'.png">'
content += '									</div>'
content += '								</div>'
content += '								<div class="stat-champion-runes">'
content += '									<div class="stat-champion-rune">'
content += '										<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/spell/SummonerExhaust.png">'
content += '									</div>'
content += '									<div class="stat-champion-rune">'
content += '										<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/spell/SummonerExhaust.png">'
content += '									</div>'
content += '								</div>'
content += '							</div>'
content += '							<div class="stat-kda">'
content += '								<div class="stat-k-d-a">'
content += '									<span>'+ data[record].kills +'</span> / <span class="stat-d">'+ data[record].deaths +'</span> / <span>'+ data[record].assists +'</span>'
content += '								</div>'
content += '								<div class="stat-ratio">'
			var kda = Math.round((data[record].kills + data[record].assists) / data[record].deaths * 10) / 10;
content += '									<span>'+ kda +'</span> 평점'
content += '								</div>'
			switch(data[record].multi_killed) {
				case 'penta':
content += '								<div class="stat-multikill multikill-penta">펜타킬</div>'
					break;
				case 'quadra':
content += '								<div class="stat-multikill multikill-quadra">쿼드라킬</div>'				
					break;
				case 'triple':
content += '								<div class="stat-multikill multikill-triple">트리플킬</div>'				
					break;
				case 'double':
content += '								<div class="stat-multikill multikill-double">더블킬</div>'				
					break
				default:
					break;
			}
content += '							</div>'
content += '							<div class="stat-stats">'
content += '								CS <span>'+ data[record].eaten_minions +' ('+ Math.round(data[record].eaten_minions/20 * 10) / 10 +')</span><br>'
content += '								킬관여 <span class="stat-stats-kill">'+ Math.round((data[record].kills+data[record].assists) / data[record].team_total_kills * 100 ) +' </span>%<br>'
			if(data[record].game_mode != '칼바람 나락') {
content += '									시야점수 <span>'+ data[record].vision_point +'</span><br>'				
			}
content += '							</div>'
content += '						</div>'
content += '						<div class="summoner-record-item">'
content += '							<div class="item-item-boxs">'
content += '								<div class="item-item-box">'
content += '										<div class="item">'
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/'+ data[record].item0 +'.png">'
content += '										</div>'
content += '										<div class="item">'
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/'+ data[record].item1 +'.png">'
content += '										</div>'
content += '										<div class="item">'
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/'+ data[record].item2 +'.png">'
content += '										</div>'
content += '										<div class="item">'
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/'+ data[record].item3 +'.png">'
content += '										</div>'
content += '										<div class="item">'
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/'+ data[record].item4 +'.png">'
content += '										</div>'
content += '										<div class="item">'
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/'+ data[record].item5 +'.png">'
content += '										</div>'

content += '								</div>'
content += '								<div class="item-item-box2">'
content += '									<div class="item">'
content += '										<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/'+ data[record].item6 +'.png">'
content += '									</div>'
			if(data[record].game_mode != '칼바람 나락') {
content += '										<div class="item">'
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/2055.png">'
content += '											<div class="ward-cnt">'+ data[record].ward_cnt +'</div>'
content += '										</div>'				
				}
content += '								</div>'
content += '							</div>'
content += '						</div>'
content += '						<div class="summoner-record-summoners">'
content += '							<div class="summoners-box">'
content += '								'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].blue_champion1 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>'+ data[record].blue_summonerid1 +'</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].blue_champion2 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>'+ data[record].blue_summonerid2 +'</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].blue_champion3 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>'+ data[record].blue_summonerid3 +'</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].blue_champion4 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>'+ data[record].blue_summonerid4 +'</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].blue_champion5 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>'+ data[record].blue_summonerid5 +'</a>'
content += '									</div>'
content += '								</div>'

content += '							</div>'
content += '							<div class="summoners-box">'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].red_champion1 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>'+ data[record].red_summonerid1 +'</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].red_champion2 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>'+ data[record].red_summonerid2 +'</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].red_champion3 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>'+ data[record].red_summonerid3 +'</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].red_champion4 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>'+ data[record].red_summonerid4 +'</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].red_champion5 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>'+ data[record].red_summonerid5 +'</a>'
content += '									</div>'
content += '								</div>'
content += '							</div>'

content += '						</div>'
content += '					</div>'
			if(data[record].win == 'True') {
content += '						<div class="summoner-record-result2 result-win"></div>';
			}
			else{
content += '						<div class="summoner-record-result2 result-lose"></div>';				
			}
content += '				</div>'
		}
		$('.summoner-record-body').children('a').prev().after(content);
		begin_num += 5;
		
	}
	
	$(document).ready(function() {
		// 시각화
		$.ajax({
			url: "/record/record_chart.do",
			type: "post",
			data: { user_no: user_no },
			dataType: "json",
			success: function(data) {
				
				var games = 0;
				var win = 0;
				var kills = 0;
				var deaths = 0;
				var assists = 0;
				var team_total_kills = 0;
				
				
				for (var record in data) {

					games++;
					if (data[record].win == 'True') {
						win++;
					}
					kills += data[record].kills;
					deaths += data[record].deaths;
					assists += data[record].assists;
					team_total_kills += data[record].team_total_kills;

				}
				kills_late = Math.round((kills+assists) / team_total_kills * 100 );
				kills /= data.length;
				deaths /= data.length;
				assists /= data.length;
				
				
					$('.doughnut-title')[0].innerHTML = games + '전 ' + win + '승 ' + (games-win) + '패';
					$('.doughnut-k-d-a')[0].innerHTML = '<span>'+kills+'</span> / <span class="stat-d">'+deaths+'</span> / <span>'+assists+'</span>'
					$('.doughnut-ratio')[0].innerHTML = '<span>' + (Math.round((kills + assists) / deaths * 10) / 10) + ' : 1</span> <span class="stat-stats-kill">('+kills_late+'%)</span>'
					doughnut_chart(games, win)
					
			},
			error: function(err) {
				alert("에러" + err)
			}


		})

	});
	
	function doughnut_chart(games, win) {
		
		// 도넛 차트
		new Chart(document.getElementById("doughnut-chart"), {
			type: 'doughnut',
			data: {
				datasets: [{
						backgroundColor: ["rgb(237,103,103)", "rgb(83,147,202)"],
						data: [win,(games-win)]
					}],
					labels: ['승','패']
			},
			options: {
				responsive: false,
				legend: {
					display: false
				},
				display: true
			}
		})
	}
	




})