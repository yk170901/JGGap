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
			console.log(data[record].champion_name)
			
			// 생각해보니 jsp 조건생기면 값이 바뀜 나중에
//				< div class="summoner-record record-lose" >
//						<div class="summoner-record-result result-lose"></div>
//						<div class="summoner-record-content">
//							<div class="summoner-record-info">
//								<span class="info-game-result game-lose">패배</span>
//								<span class="info-game-mode">칼바람 나락</span>
//								<span class="info-game-time">17:12</span>
//								<span class="info-game-past">6일 전</span>
//							</div>
//							<div class="summoner-record-stat">
//								<div class="stat-champion">
//									<div class="stat-champion-icon">
//										<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.6.1/img/champion/${score.champion_name}.png">
//										<div class="champion-level">15</div>
//									</div>
//									<div class="stat-champion-spells">
//										<div class="stat-champion-spell">
//											<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/spell/SummonerSnowball.png">
//										</div>
//										<div class="stat-champion-spell">
//											<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/spell/SummonerFlash.png">
//										</div>
//									</div>
//									<div class="stat-champion-runes">
//										<div class="stat-champion-rune">
//											<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/spell/SummonerExhaust.png">
//										</div>
//										<div class="stat-champion-rune">
//											<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/spell/SummonerExhaust.png">
//										</div>
//									</div>
//								</div>
//								<div class="stat-kda">
//									<div class="stat-k-d-a">
//										<span>11</span> / <span class="stat-d">4</span> / <span>9</span>
//									</div>
//									<div class="stat-ratio">
//										<span>5.00</span> 평점
//									</div>
//									<div class="stat-multikill multikill-penta">더블킬</div>
//								</div>
//								<div class="stat-stats">
//									CS <span>21 (1.6)</span><br>
//									킬관여 <span class="stat-stats-kill">51%</span><br>
//									시야점수 <span>0</span><br>
//								</div>
//							</div>
//							<div class="summoner-record-item">
//								<div class="item-item-boxs">
//									<div class="item-item-box">
//										<c:forEach begin="1" end="6">
//											<div class="item">
//												<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.6.1/img/item/3211.png">
//											</div>
//										</c:forEach>
//									</div>
//									<div class="item-item-box2">
//										<div class="item">
//											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.6.1/img/item/3363.png">
//										</div>
//										<div class="item">
//											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.6.1/img/item/2055.png">
//											<div class="ward-cnt">3</div>
//										</div>
//									</div>
//								</div>
//							</div>
//							<div class="summoner-record-summoners">
//								<div class="summoners-box">
//									<c:forEach begin="1" end="5">
//										<div class="summoners-summoner">
//											<div class="summoner-img">
//												<img alt="LeeSin" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/LeeSin.png">
//											</div>
//											<div class="summoner-name">
//												<a>네네스노윙순살</a>
//											</div>
//										</div>
//									</c:forEach>
//								</div>
//								<div class="summoners-box">
//									<c:forEach begin="1" end="5">
//										<div class="summoners-summoner">
//											<div class="summoner-img">
//												<img alt="summoner" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/Teemo.png">
//											</div>
//											<div class="summoner-name">
//												<a>병원항구성당묘지</a>
//											</div>
//										</div>
//									</c:forEach>
//								</div>
//							
//							</div>
//						</div>
//						<div class="summoner-record-result2 result-lose"></div>
//					</div>
			

		}
		
		
	}
	


	

})