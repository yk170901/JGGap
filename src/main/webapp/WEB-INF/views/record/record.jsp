<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[]~(￣▽￣)~*</title>
<link rel="stylesheet" href="/resources/css/record.css" type="text/css">
</head>
<body>
<%-- 전적갱신 누르면 넘기기 위한 유저넘 : ${record.user_no } --%>
	<%@ include file="/WEB-INF/views/basic/header.jsp"%>
	<main class="page-main">
		<div class="page-body">
			<!-- 소환사 정보 -->
			<div class="summoner-info-body">
				<div><img class="summoner-profile-icon" src="/resources/imgs/profile_icon/${record.profile_icon }.png"></div>
				<div class="summoner-summoner-id">${record.summoner_id }</div>
				<a class="summoner-button" href="#!" ><span class="summoner-button-text">전적 갱신</span></a>
			</div>
			<hr>
			<div class="summoner-stats-body">
				<div class="summoner-stats-tier">
					<div class="summoner-stats-tier-solo">
						<div class="summoner-stats-tier-img">
							<img class="tier-img" src="/resources/imgs/tier/${record.solo_tier }.png" alt="profile">
						</div>
						<div class="summoner-stats-tier-detail">
							<div class="summoner-stats-rank-text">솔로 랭크</div>
							<div class="summoner-stats-tier-text">${record.solo_tier } ${record.solo_tier_grade }</div>
							<div class="summoner-stats-lp-text">${record.solo_lp } LP / ${record.solo_win }승 ${record.solo_lose }패</div>
						</div>
					</div>
					<div class="summoner-stats-tier-free">
						<div class="summoner-stats-tier-img">
							<img class="tier-img" src="/resources/imgs/tier/${record.free_tier }.png" alt="profile">
						</div>
						<div class="summoner-stats-tier-detail">
							<div class="summoner-stats-rank-text">자유 랭크</div>
							<div class="summoner-stats-tier-text">${record.free_tier } ${record.free_tier_grade }</div>
							<div class="summoner-stats-lp-text">${record.free_lp } LP / ${record.free_win }승 ${record.free_lose }패</div>
						</div>
					</div>
				</div>
				<div class="summoner-stats-donut">
					~시각화 보류~<br>
					도넛차트
				</div>
				<div class="summoner-stats-champion">
					~시각화 보류~<br>
					챔피언
				</div>
				<div class="summoner-stats-position">
					~시각화 보류~<br>
					선호 포지션
				</div>
			</div >
			
			
			<div class="summoner-record-body">
				<c:forEach items="${score}" var="score" varStatus="score_length">
					<c:if test="${score.win == 'True'}">
						<div class="summoner-record record-win">
							<div class="summoner-record-result result-win"></div>
					</c:if>
					<c:if test="${score.win == 'False'}">
						<div class="summoner-record record-lose">
							<div class="summoner-record-result result-lose"></div>
					</c:if>
						<div class="summoner-record-content">
							<div class="summoner-record-info">
								<c:if test="${score.win == 'True'}">
									<span class="info-game-result game-win">승리</span>
								</c:if>
								<c:if test="${score.win == 'False'}">
									<span class="info-game-result game-lose">패배</span>
								</c:if>
								<span class="info-game-mode">${score.game_mode}</span>
								<span class="info-game-time">${score.game_duration }</span>
								<span class="info-game-past">6일 전</span>
							</div>
							<div class="summoner-record-stat">
								<div class="stat-champion">
									<div class="stat-champion-icon">
										<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.champion_name}.png">
										<div class="champion-level">${score.champion_level}</div>
									</div>
									<div class="stat-champion-spells">
										<div class="stat-champion-spell">
											<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/spell/${score.spell_fir}.png">
										</div>
										<div class="stat-champion-spell">
											<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/spell/${score.spell_sec}.png">
										</div>
									</div>
									<div class="stat-champion-runes">
										<div class="stat-champion-rune">
											<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/spell/SummonerExhaust.png">
										</div>
										<div class="stat-champion-rune">
											<img class="summoner-record-image" src="http://ddragon.leagueoflegends.com/cdn/12.8.1/img/spell/SummonerExhaust.png">
										</div>
									</div>
								</div>
								<div class="stat-kda">
									<div class="stat-k-d-a">
										<span>${score.kills}</span> / <span class="stat-d">${score.deaths}</span> / <span>${score.assists}</span>
									</div>
									<div class="stat-ratio">
										<c:set var="kda" value="${(score.kills+score.assists)/score.deaths}"/>
										<span>${kda }</span> 평점
									</div>
									<c:choose>
										<c:when test="${score.multi_killed == 'penta'}"><div class="stat-multikill multikill-penta">펜타킬</div></c:when>
										<c:when test="${score.multi_killed == 'quadra'}"><div class="stat-multikill multikill-quadra">쿼드라킬</div></c:when>
										<c:when test="${score.multi_killed == 'triple'}"><div class="stat-multikill multikill-triple">트리플킬</div></c:when>
										<c:when test="${score.multi_killed == 'double'}"><div class="stat-multikill multikill-double">더블킬</div></c:when>
									</c:choose>									
								</div>
								<div class="stat-stats">
									CS <span>${score.eaten_minions} (${score.eaten_minions/20})</span><br>
									킬관여 <span class="stat-stats-kill">51%</span><br>
									시야점수 <span>${score.vision_point}</span><br>
								</div>
							</div>
							<div class="summoner-record-item">
								<div class="item-item-boxs">
									<div class="item-item-box">
										<c:forEach begin="0" end="5" varStatus="num">
											<div class="item">
												<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.6.1/img/item/${score.item${num.index }}.png">
											</div>
										</c:forEach>
									</div>
									<div class="item-item-box2">
										<div class="item">
											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.6.1/img/item/3363.png">
										</div>
										<div class="item">
											<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.6.1/img/item/2055.png">
											<div class="ward-cnt">3</div>
										</div>
									</div>
								</div>
							</div>
							<div class="summoner-record-summoners">
								<div class="summoners-box">
									<c:forEach begin="1" end="5">
										<div class="summoners-summoner">
											<div class="summoner-img">
												<img alt="LeeSin" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/LeeSin.png">
											</div>
											<div class="summoner-name">
												<a>네네스노윙순살</a>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="summoners-box">
									<c:forEach begin="1" end="5">
										<div class="summoners-summoner">
											<div class="summoner-img">
												<img alt="summoner" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/Teemo.png">
											</div>
											<div class="summoner-name">
												<a>병원항구성당묘지</a>
											</div>
										</div>
									</c:forEach>
								</div>
							
							</div>
						</div>
						<div class="summoner-record-result2 result-lose"></div>
					</div>
	
				</c:forEach>
				<a class="summoner-record-more">더보기</a>

			</div>









		</div>
	</main>

	<script type="text/javascript" src="/resources/js/record.js"></script>
</body>
</html>