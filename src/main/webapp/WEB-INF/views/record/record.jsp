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
				<c:set var="cnt" value="4" />
				<c:forEach items="${score}" var="score" varStatus="score_length">
					<div>
						${score.record_no }<br>
						<img style="width:70px; height:70px;"src="http://ddragon.leagueoflegends.com/cdn/12.6.1/img/champion/Viego.png"><br>
					</div>
					<c:if test="${score_length.index == cnt }">
						<c:if test="${score_length.index > 4 }"> 비밀닫기<br> </c:if>
						더보기</br>
						비밀열기
					</c:if>
					<c:if test="${score_length.index== cnt+1 }">
						<c:set var="cnt" value="${cnt+5}" />
					</c:if>
					<c:if test="${score_length.last }">
						비밀닫기
					</c:if>
	
				</c:forEach>
				
				
				
				
				
			</div>









		</div>
	</main>


</body>
</html>