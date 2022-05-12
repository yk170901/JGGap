$(function() {


	
	
	// 전적 더보기 버튼 클릭시
	var begin_num = 11;
	var summoner_id =$('.summoner-summoner-id').attr('value')
	$('.summoner-record-more').on("click", function() {

		$.ajax({
			url: "/record/record_more.do",
			type: "post",
			data: { begin_num: begin_num,
					summoner_id: summoner_id },
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
			if(data[record].item0 == 0) {
content += '											<img style="backgroun:white">'				
			}
			else {
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/'+ data[record].item0 +'.png">'
			}
content += '										</div>'
content += '										<div class="item">'
			if(data[record].item1 == 0) {
content += '											<img style="backgroun:white">'				
			}
			else {
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/'+ data[record].item1 +'.png">'
			}
content += '										</div>'
content += '										<div class="item">'
			if(data[record].item2 == 0) {
content += '											<img style="backgroun:white">'				
			}
			else {
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/'+ data[record].item2 +'.png">'
			}
content += '										</div>'
content += '										<div class="item">'
			if(data[record].item3 == 0) {
content += '											<img style="backgroun:white">'				
			}
			else {
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/'+ data[record].item3 +'.png">'
			}
content += '										</div>'
content += '										<div class="item">'
			if(data[record].item4 == 0) {
content += '											<img style="backgroun:white">'				
			}
			else {
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/'+ data[record].item4 +'.png">'
			}
content += '										</div>'
content += '										<div class="item">'
			if(data[record].item5 == 0) {
content += '											<img style="backgroun:white">'				
			}
			else {
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/'+ data[record].item5 +'.png">'
			}
content += '										</div>'

content += '								</div>'
content += '								<div class="item-item-box2">'
content += '									<div class="item">'
			if(data[record].item6 == 0) {
content += '										<img style="backgroun:white">'				
			}
			else {
content += '										<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/'+ data[record].item6 +'.png">'
			}
content += '									</div>'
			if(data[record].game_mode != '칼바람 나락') {
content += '										<div class="item">'
content += '											<img alt="item" src="/resources/imgs/ward.png">'
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
			if(data[record].blue_summonerid1 == summoner_id) {
content += '									<a style="color:black">'				
			}
			else {
content += '									<a>'				
			}
content += 										data[record].blue_summonerid1 +'</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].blue_champion2 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
			if(data[record].blue_summonerid2 == summoner_id) {
content += '									<a style="color:black">'				
			}
			else {
content += '									<a>'				
			}
content += 										data[record].blue_summonerid2 +'</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].blue_champion3 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
			if(data[record].blue_summonerid3 == summoner_id) {
content += '									<a style="color:black">'				
			}
			else {
content += '									<a>'				
			}
content += 										data[record].blue_summonerid3 +'</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].blue_champion4 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
			if(data[record].blue_summonerid4 == summoner_id) {
content += '									<a style="color:black">'				
			}
			else {
content += '									<a>'				
			}
content += 										data[record].blue_summonerid4 +'</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].blue_champion5 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
			if(data[record].blue_summonerid5 == summoner_id) {
content += '									<a style="color:black">'				
			}
			else {
content += '									<a>'				
			}
content += 										data[record].blue_summonerid5 +'</a>'
content += '									</div>'
content += '								</div>'

content += '							</div>'
content += '							<div class="summoners-box">'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].red_champion1 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
			if(data[record].red_summonerid1 == summoner_id) {
content += '									<a style="color:black">'				
			}
			else {
content += '									<a>'				
			}
content += 										data[record].red_summonerid1 +'</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].red_champion2 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
			if(data[record].red_summonerid2 == summoner_id) {
content += '									<a style="color:black">'				
			}
			else {
content += '									<a>'				
			}
content += 										data[record].red_summonerid2 +'</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].red_champion3 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
			if(data[record].red_summonerid3 == summoner_id) {
content += '									<a style="color:black">'				
			}
			else {
content += '									<a>'				
			}
content += 										data[record].red_summonerid3 +'</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].red_champion4 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
			if(data[record].red_summonerid4 == summoner_id) {
content += '									<a style="color:black">'				
			}
			else {
content += '									<a>'				
			}
content += 										data[record].red_summonerid4 +'</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+ data[record].red_champion5 +'.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
			if(data[record].red_summonerid5 == summoner_id) {
content += '									<a style="color:black">'				
			}
			else {
content += '									<a>'				
			}
content += 										data[record].red_summonerid5 +'</a>'
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
		begin_num += 10;
		
	}
	
	$(document).ready(function() {
		// 시각화
		$.ajax({
			url: "/record/record_chart.do",
			type: "post",
			data: { summoner_id: summoner_id },
			dataType: "json",
			success: function(data) {
				
				console.log(data.chart[0].team_total_kills)
				
				if(data.chart[0].team_total_kills == 0) {
					var content = '<div class="summoner-no-data"> 데이터가 없습니다.</div>'
					
					$('.summoner-stats-doughnut').append(content);
					$('.summoner-stats-champion').append(content);
					$('.summoner-stats-position').append(content);
					return;
				}
				if(data.lane_rate)
				
				var content =""
				
				kills_late = Math.round((data.chart[0].kills+data.chart[0].assists) / data.chart[0].team_total_kills * 100 );
					
				content += ' <div class="doughnut-title">'+(data.chart[0].win_cnt +data.chart[0].lose_cnt)+'전 ' + data.chart[0].win_cnt + '승 ' + (data.chart[0].lose_cnt) + '패</div>'
				content += ' 	<div class="doughnut-body">'
				content += ' 		<canvas id="doughnut-chart" width="100" height="100">+ </canvas>'
				content += ' 	</div>'
				content += ' 	<div class="doughnut-kda">'
				content += ' 		<div class="doughnut-k-d-a"><span>'+Math.round(data.chart[0].kills/(data.chart[0].win_cnt +data.chart[0].lose_cnt) * 10) / 10+'</span> / <span class="stat-d">'+Math.round(data.chart[0].deaths/(data.chart[0].win_cnt +data.chart[0].lose_cnt) * 10) / 10+'</span> / <span>'+Math.round(data.chart[0].assists/(data.chart[0].win_cnt +data.chart[0].lose_cnt) * 10) / 10+'</span></div>'
				content += ' 		<div class="doughnut-ratio"><span>' + (Math.round((data.chart[0].kills + data.chart[0].assists) / data.chart[0].deaths * 10) / 10) + ' : 1</span> <span class="stat-stats-kill">('+kills_late+'%)</span></div>'
				content += ' 	</div>'
					
				$('.summoner-stats-doughnut').append(content);
				
				doughnut_chart((data.chart[0].win_cnt +data.chart[0].lose_cnt), data.chart[0].win_cnt)
					
				record_champion_rate(data.champion_rate);
				record_lane_rate(data.lane_rate);
					
					
					
			},
			error: function(err) {
				alert("에러" + err)
			}


		})

	});
	
	// 도넛차트
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
	
	// 챔피언별 승률
	function record_champion_rate(data) {
		
		var content = '<div class="stats-champions">';
		for(var i = 0; i< data.length;i++) {
			if(i == 3) {
				content+='</div>'
				$('.summoner-stats-champion').append(content);
				return;
			}
			
			content+='	<div class="stats-champion-body">';
			content+='		<div class="stats-champion-imgs"><img class="stats-champion-img" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/'+data[i].champion_name+'.png"></div>';
			content+='		<div class="stats-champion-info">';
			content+='			<div class="stats-champion-name">'+data[i].champion_name_KR+'</div>';
			content+='			<div class="stats-champion-win-rate"><span>' + Math.round(data[i].win_cnt / data[i].champion_cnt * 100)+'%</span><span> ('+data[i].win_cnt+'승 '+(data[i].champion_cnt - data[i].win_cnt)+'패)</span></div>';
			content+='			<div class="stats-champion-kda">'+Math.round((data[i].kills +data[i].assists) / data[i].deaths * 10) / 10 +' 평점</div>';
			content+='		</div>';
			content+='	</div>';

			
			
			
		}
		
	}
	
	// 라인별 승률
	function record_lane_rate(data) {
		
		if (data=='') {
			$('.summoner-stats-position').append('<div class="summoner-no-data"> 데이터가 없습니다.</div>');
			return;
		}
		
		var total = 0;
		var content = '<div class="stats-positions">';
		var lane = "";
		for(var lane in data) {
			console.log(data[lane].lane)
			total += data[lane].lane_cnt;
		}
		

		for(var i = 0; i< data.length;i++) {
			if(i == 2) {
				content+='</div>'
				$('.summoner-stats-position').append(content);
				return;
			}
			switch (data[i].lane) {
				case 'TOP':
					lane = "탑";
					break;
				case 'JUNGLE':
					lane = "정글"
					break;
				case 'MIDDLE':
					lane = "미드"
					break;
				case 'BOTTOM':
					lane = "원딜"
					break;
				case 'SUPPORT':
					lane = "서포터"
					break;					
			}
			
			content+='	<div class="stats-position-body">'
			content+='		<div class="stats-position-imgs"><img class="stats-position-img" src="/resources/imgs/position/'+data[i].lane+'.png"></div>'
			content+='		<div class="stats-position-info">'
			content+='			<div class="stats-position-name">'+lane+'</div>'
			content+='			<div class="stats-position-pick-rate"><span>'+Math.round(data[i].lane_cnt / total * 100)+'%</span></div>'
			content+='			<div class="stats-position-win-rates">승률 '+Math.round(data[i].win_cnt / data[i].lane_cnt * 100)+'%</div>'
			content+='		</div>'
			content+='	</div>'
		
		}
		content+='</div>'
		$('.summoner-stats-position').append(content);


	}


})