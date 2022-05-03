$(function() {
	var begin_num = 1;
	
	$('.summoner-record-more').on("click", function() {

		$.ajax({
			url: "/record/record_more.do",
			type: "post",
			data: { begin_num: begin_num },
			dataType: "json",
			success: function(data) {
				if (data == "") {
					alert("비었다")
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
			console.log(data[record])
			
			// 생각해보니 jsp 조건생기면 값이 바뀜 나중

content += '				<c:if test="${score.win == \'True\'}">';
content += '					<div class="summoner-record record-win">';
content += '						<div class="summoner-record-result result-win"></div>';
content += '				</c:if>';
content += '				<c:if test="${score.win == \'False\'}">';
content += '					<div class="summoner-record record-lose">';
content += '						<div class="summoner-record-result result-lose"></div>';
content += '				</c:if>'
content += '					<div class="summoner-record-content">'
content += '						<div class="summoner-record-info">'
content += '							<c:if test="${score.win == \'True\'}">'
content += '								<span class="info-game-result game-win">승리</span>'
content += '							</c:if>'
content += '							<c:if test="${score.win == \'False\'}">'
content += '								<span class="info-game-result game-lose">패배</span>'
content += '							</c:if>'
content += '							<span class="info-game-mode">${score.game_mode}</span>'
content += '							<span class="info-game-time">${score.game_duration }</span>'
content += '							<c:set var="timestamp" value="${score.game_timestamp}" />'
content += '							<% long hour = Math.round( ( (System.currentTimeMillis() / 1000) - Integer.parseInt(String.valueOf(pageContext.getAttribute("timestamp"))) )/3600);'
content += '								long day = 0;'
content += '								if (hour >= 24) { day = hour/24; }'
content += '								LocalDate now = LocalDate.now();'
content += '							%>'

content += '							<c:if test="<%=day == 0%>">'
content += '								<span class="info-game-past"><%=hour %> 시간 전</span>'
content += '							</c:if>'
content += '							<c:if test="<%=day != 0%>">'
content += '								<c:if test="<%=day <=6 %>">'
content += '									<span class="info-game-past"><%=day %> 일 전</span>'
content += '								</c:if>'
content += '								<c:if test="<%=day > 6 %>">'
content += '									<span class="info-game-past"><%=now.minusDays(7).getMonthValue() %>월 <%=now.minusDays(7).getDayOfMonth() %>일</span>'
content += '								</c:if>'
content += '							</c:if>'

content += '						</div>'
content += '						<div class="summoner-record-stat">'
content += '							<div class="stat-champion">'
content += '								<div class="stat-champion-icon">'
content += '									<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.champion_name}.png">'
content += '									<div class="champion-level">${score.champion_level}</div>'
content += '								</div>'
content += '								<div class="stat-champion-spells">'
content += '									<div class="stat-champion-spell">'
content += '										<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/spell/${score.spell_fir}.png">'
content += '									</div>'
content += '									<div class="stat-champion-spell">'
content += '										<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/spell/${score.spell_sec}.png">'
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
content += '									<span>${score.kills}</span> / <span class="stat-d">${score.deaths}</span> / <span>${score.assists}</span>'
content += '								</div>'
content += '								<div class="stat-ratio">'
content += '									<c:set var="kda" value="${(score.kills+score.assists)/score.deaths}"/>'
content += '									<span>${kda }</span> 평점'
content += '								</div>'
content += '								<c:choose>'
content += '									<c:when test="${score.multi_killed == \'penta\'}"><div class="stat-multikill multikill-penta">펜타킬</div></c:when>'
content += '									<c:when test="${score.multi_killed == \'quadra\'}"><div class="stat-multikill multikill-quadra">쿼드라킬</div></c:when>'
content += '									<c:when test="${score.multi_killed == \'triple\'}"><div class="stat-multikill multikill-triple">트리플킬</div></c:when>'
content += '									<c:when test="${score.multi_killed == \'double\'}"><div class="stat-multikill multikill-double">더블킬</div></c:when>'
content += '								</c:choose>									'
content += '							</div>'
content += '							<div class="stat-stats">'
content += '								CS <span>${score.eaten_minions} (${score.eaten_minions/20})</span><br>'
content += '								킬관여 <span class="stat-stats-kill">${Math.round((score.kills+score.assists) / score.team_total_kills * 100)} </span>%<br>'
content += '								'
content += '								<c:if test="${score.game_mode != \'칼바람 나락\' }">'
content += '									시야점수 <span>${score.vision_point}</span><br>'
content += '								</c:if>'
content += '							</div>'
content += '						</div>'
content += '						<div class="summoner-record-item">'
content += '							<div class="item-item-boxs">'
content += '								<div class="item-item-box">'
content += '									'
content += '										<div class="item">'
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/${score.item0}.png">'
content += '										</div>'
content += '										<div class="item">'
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/${score.item1}.png">'
content += '										</div>'
content += '										<div class="item">'
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/${score.item2}.png">'
content += '										</div>'
content += '										<div class="item">'
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/${score.item3}.png">'
content += '										</div>'
content += '										<div class="item">'
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/${score.item4}.png">'
content += '										</div>'
content += '										<div class="item">'
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/${score.item5 }.png">'
content += '										</div>'

content += '								</div>'
content += '								<div class="item-item-box2">'
content += '									<div class="item">'
content += '										<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/${score.item6}.png">'
content += '									</div>'
content += '									<c:if test="${score.game_mode != \'칼바람 나락\' }">'
content += '										<div class="item">'
content += '											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/2055.png">'
content += '											<div class="ward-cnt">${score.ward_cnt }</div>'
content += '										</div>'
content += '									</c:if>'

content += '								</div>'
content += '							</div>'
content += '						</div>'
content += '						<div class="summoner-record-summoners">'
content += '							<div class="summoners-box">'
content += '								'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.blue_champion1 }.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>${score.blue_summonerid1 }</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.blue_champion2 }.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>${score.blue_summonerid2 }</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.blue_champion3 }.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>${score.blue_summonerid3 }</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.blue_champion4 }.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>${score.blue_summonerid4 }</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.blue_champion5 }.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>${score.blue_summonerid5 }</a>'
content += '									</div>'
content += '								</div>'

content += '							</div>'
content += '							<div class="summoners-box">'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.red_champion1 }.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>${score.red_summonerid1 }</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.red_champion2 }.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>${score.red_summonerid2 }</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.red_champion3 }.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>${score.red_summonerid3 }</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.red_champion4 }.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>${score.red_summonerid4 }</a>'
content += '									</div>'
content += '								</div>'
content += '								<div class="summoners-summoner">'
content += '									<div class="summoner-img">'
content += '										<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.red_champion5 }.png">'
content += '									</div>'
content += '									<div class="summoner-name">'
content += '										<a>${score.red_summonerid5 }</a>'
content += '									</div>'
content += '								</div>'
content += '							</div>'

content += '						</div>'
content += '					</div>'

content += '					<c:if test="${score.win == \'True\'}">'
content += '						<div class="summoner-record-result2 result-win"></div>'
content += '					</c:if>'
content += '					<c:if test="${score.win == \'False\'}">'
content += '						<div class="summoner-record-result2 result-lose"></div>'
content += '					</c:if>'
content += '				</div>'
		}
		$('.summoner-record-body div:last').after(content);
		
		
	}
	


	

})