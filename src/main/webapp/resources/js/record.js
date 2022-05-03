$(function() {
	var begin_num = 6;
	
	$('.summoner-record-more').on("click", function() {
		
		var user_no =$('.summoner-summoner-id').attr('value')

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
			var kda = (data[record].kills + data[record].assists) / data[record].deaths;
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
	


	

})