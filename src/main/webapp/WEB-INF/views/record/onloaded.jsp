<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=request.getParameter("summoner_id") %> - 소환사 전적</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<link rel="shortcut icon" href="/resources/imgs/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/onloaded.css" type="text/css">
</head>
<body>
<%-- 전적갱신 누르면 넘기기 위한 유저넘 : ${record.user_no } --%>
	<%@ include file="/WEB-INF/views/basic/header.jsp"%>
	<main class="page-main">
		<c:set var="game_id" value="${score }"/>
		<div class="page-body">
		<c:if test="${record.summoner_id == null }">
			<div class="summoner-info-none"><span>"<%=request.getParameter("summoner_id") %>"</span> 는 존재하지 않는 소환사명 입니다.</div>
		</c:if>
		<c:if test="${record.summoner_id != null}">
			<!-- 소환사 정보 -->
			<div class="summoner-info-body">
				<div><img class="summoner-profile-icon" src="/resources/imgs/profile_icon/${record.profile_icon }.png"></div>
				<div class="summoner-summoner-id" value="${record.summoner_id }">${record.summoner_id }</div>
				<form class="summoner-button" method="post" action="record_update.do">
					<input type="hidden" name="summoner_id" value="${record.summoner_id }">
					<input type="hidden" name="gameid" value="${game_id[0].gameid }">					
					<input type="hidden" name="user_no" value="${record.user_no }">					
					<input type="submit" class="summoner-button-text" value="전적 갱신">
				</form>
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
							<c:if test="${record.solo_tier != 'unranked'}">
								<div class="summoner-stats-lp-text">${record.solo_lp } LP / ${record.solo_win }승 ${record.solo_lose }패</div>
							</c:if>
						</div>
					</div>
					<div class="summoner-stats-tier-free">
						<div class="summoner-stats-tier-img">
							<img class="tier-img" src="/resources/imgs/tier/${record.free_tier }.png" alt="profile">
						</div>
						<div class="summoner-stats-tier-detail">
							<div class="summoner-stats-rank-text">자유 랭크</div>
							<div class="summoner-stats-tier-text">${record.free_tier } ${record.free_tier_grade }</div>
							<c:if test="${record.solo_tier != 'unranked'}">
								<div class="summoner-stats-lp-text">${record.free_lp } LP / ${record.free_win }승 ${record.free_lose }패</div>	
							</c:if>
						</div>
					</div>
				</div>
				<div class="summoner-stats-doughnut">

				</div>
				<div class="summoner-stats-champion">
					
				</div>
				<div class="summoner-stats-position">
					
				</div>
			</div >
			
			<!-- 소환사 전적 -->
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
								<span class="info-game-time">${score.game_duration}</span>
								<c:set var="timestamp" value="${score.game_timestamp}" />
								<% long hour = Math.round( ( (System.currentTimeMillis() / 1000) - Integer.parseInt(String.valueOf(pageContext.getAttribute("timestamp"))) )/3600);
									long day = 0;
									if (hour >= 24) { day = hour/24; }
									LocalDate now = LocalDate.now();
								%>
								
								<c:if test="<%=day == 0%>">
									<span class="info-game-past"><%=hour %> 시간 전</span>
								</c:if>
								<c:if test="<%=day != 0%>">
									<c:if test="<%=day <=6 %>">
										<span class="info-game-past"><%=day %> 일 전</span>
									</c:if>
									<c:if test="<%=day > 6 %>">
										<span class="info-game-past"><%=now.minusDays(7).getMonthValue() %>월 <%=now.minusDays(7).getDayOfMonth() %>일</span>
									</c:if>
								</c:if>
								
								
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
										<c:set var="kda" value="${Math.round((score.kills+score.assists)/score.deaths * 10)/10}"/>
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
									킬관여 <span class="stat-stats-kill">${Math.round((score.kills+score.assists) / score.team_total_kills * 100)} </span>%<br>
									
									<c:if test="${score.game_mode != '칼바람 나락' }">
										시야점수 <span>${score.vision_point}</span><br>
									</c:if>
								</div>
							</div>
							<div class="summoner-record-item">
								<div class="item-item-boxs">
									<div class="item-item-box">
										
											<div class="item">
												<c:if test="${score.item0 == 0}">
													<div style="backgroun:white"></div>
												</c:if>
												<c:if test="${score.item0 != 0}">
													<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/${score.item0}.png">
												</c:if>
											</div>
											<div class="item">
												<c:if test="${score.item1 == 0}">
													<div style="backgroun:white"></div>
												</c:if>
												<c:if test="${score.item1 != 0}">
													<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/${score.item1}.png">
												</c:if>
											</div>
											<div class="item">
												<c:if test="${score.item2 == 0}">
													<div style="backgroun:white"></div>
												</c:if>
												<c:if test="${score.item2 != 0}">
													<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/${score.item2}.png">
												</c:if>
											</div>
											<div class="item">
												<c:if test="${score.item3 == 0}">
													<div style="backgroun:white"></div>
												</c:if>
												<c:if test="${score.item3 != 0}">
													<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/${score.item3}.png">
												</c:if>
											</div>
											<div class="item">
												<c:if test="${score.item4 == 0}">
													<div style="backgroun:white"></div>
												</c:if>
												<c:if test="${score.item4 != 0}">
													<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/${score.item4}.png">
												</c:if>
											</div>
											<div class="item">
												<c:if test="${score.item5 == 0}">
													<div style="backgroun:white"></div>
												</c:if>
												<c:if test="${score.item5 != 0}">
													<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/${score.item5 }.png">
												</c:if>
											</div>
										
									</div>
									<div class="item-item-box2">
										<div class="item">
											<c:if test="${score.item6 == 0}">
												<div style="backgroun:white"></div>
											</c:if>
											<c:if test="${score.item6 != 0}">
												<img alt="item" src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/item/${score.item6}.png">
											</c:if>
										</div>
										<c:if test="${score.game_mode != '칼바람 나락' }">
											<div class="item">
												<img alt="item" src="/resources/imgs/ward.png">
												<div class="ward-cnt">${score.ward_cnt }</div>
											</div>
										</c:if>
										
									</div>
								</div>
							</div>
							<div class="summoner-record-summoners">
								<div class="summoners-box">
									
									<div class="summoners-summoner">
										<div class="summoner-img">
											<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.blue_champion1 }.png">
										</div>
										<c:if test="${score.blue_summonerid1 == record.summoner_id}">
											<div class="summoner-name" style="font-weight: 600">
										</c:if>
										<c:if test="${score.blue_summonerid1 != record.summoner_id}">
											<div class="summoner-name">
										</c:if>
											<a>${score.blue_summonerid1 }</a>
										</div>
									</div>
									<div class="summoners-summoner">
										<div class="summoner-img">
											<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.blue_champion2 }.png">
										</div>
										<c:if test="${score.blue_summonerid2 == record.summoner_id}">
											<div class="summoner-name" style="font-weight: 600">
										</c:if>
										<c:if test="${score.blue_summonerid2 != record.summoner_id}">
											<div class="summoner-name">
										</c:if>
											<a>${score.blue_summonerid2 }</a>
										</div>
									</div>
									<div class="summoners-summoner">
										<div class="summoner-img">
											<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.blue_champion3 }.png">
										</div>
										<c:if test="${score.blue_summonerid3 == record.summoner_id}">
											<div class="summoner-name" style="font-weight: 600">
										</c:if>
										<c:if test="${score.blue_summonerid3 != record.summoner_id}">
											<div class="summoner-name">
										</c:if>
											<a>${score.blue_summonerid3 }</a>
										</div>
									</div>
									<div class="summoners-summoner">
										<div class="summoner-img">
											<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.blue_champion4 }.png">
										</div>
										<c:if test="${score.blue_summonerid4 == record.summoner_id}">
											<div class="summoner-name" style="font-weight: 600">
										</c:if>
										<c:if test="${score.blue_summonerid4 != record.summoner_id}">
											<div class="summoner-name">
										</c:if>
											<a>${score.blue_summonerid4 }</a>
										</div>
									</div>
									<div class="summoners-summoner">
										<div class="summoner-img">
											<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.blue_champion5 }.png">
										</div>
										<c:if test="${score.blue_summonerid5 == record.summoner_id}">
											<div class="summoner-name" style="font-weight: 600">
										</c:if>
										<c:if test="${score.blue_summonerid5 != record.summoner_id}">
											<div class="summoner-name">
										</c:if>
											<a>${score.blue_summonerid5 }</a>
										</div>
									</div>
										
									
								</div>
								<div class="summoners-box">
									<div class="summoners-summoner">
										<div class="summoner-img">
											<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.red_champion1 }.png">
										</div>
										<c:if test="${score.red_summonerid1 == record.summoner_id}">
											<div class="summoner-name" style="font-weight: 600">
										</c:if>
										<c:if test="${score.red_summonerid1 != record.summoner_id}">
											<div class="summoner-name">
										</c:if>
											<a>${score.red_summonerid1 }</a>
										</div>
									</div>
									<div class="summoners-summoner">
										<div class="summoner-img">
											<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.red_champion2 }.png">
										</div>
										<c:if test="${score.red_summonerid2 == record.summoner_id}">
											<div class="summoner-name" style="font-weight: 600">
										</c:if>
										<c:if test="${score.red_summonerid2 != record.summoner_id}">
											<div class="summoner-name">
										</c:if>
											<a>${score.red_summonerid2 }</a>
										</div>
									</div>
									<div class="summoners-summoner">
										<div class="summoner-img">
											<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.red_champion3 }.png">
										</div>
										<c:if test="${score.red_summonerid3 == record.summoner_id}">
											<div class="summoner-name" style="font-weight: 600">
										</c:if>
										<c:if test="${score.red_summonerid3 != record.summoner_id}">
											<div class="summoner-name">
										</c:if>
											<a>${score.red_summonerid3 }</a>
										</div>
									</div>
									<div class="summoners-summoner">
										<div class="summoner-img">
											<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.red_champion4 }.png">
										</div>
										<c:if test="${score.red_summonerid4 == record.summoner_id}">
											<div class="summoner-name" style="font-weight: 600">
										</c:if>
										<c:if test="${score.red_summonerid4 != record.summoner_id}">
											<div class="summoner-name">
										</c:if>
											<a>${score.red_summonerid4 }</a>
										</div>
									</div>
									<div class="summoners-summoner">
										<div class="summoner-img">
											<img src="https://ddragon.leagueoflegends.com/cdn/12.8.1/img/champion/${score.red_champion5 }.png">
										</div>
										<c:if test="${score.red_summonerid5 == record.summoner_id}">
											<div class="summoner-name" style="font-weight: 600">
										</c:if>
										<c:if test="${score.red_summonerid5 != record.summoner_id}">
											<div class="summoner-name">
										</c:if>
											<a>${score.red_summonerid5 }</a>
										</div>
									</div>
								</div>
							
							</div>
						</div>
						
						<c:if test="${score.win == 'True'}">
							<div class="summoner-record-result2 result-win"></div>
						</c:if>
						<c:if test="${score.win == 'False'}">
							<div class="summoner-record-result2 result-lose"></div>
						</c:if>
					</div>
	
				</c:forEach>
				<a class="summoner-record-more">더보기</a>

			</div>









		</c:if>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/basic/footer.jsp"%>

	<script type="text/javascript" src="/resources/js/onloaded.js"></script>
</body>
</html>