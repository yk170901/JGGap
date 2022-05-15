<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ㅈㄱㅊㅇ - 전적검색과 구인을 한 번에!</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<link rel="shortcut icon" href="/resources/imgs/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/profile.css" type="text/css">

</head>
<body>
	<%@ include file="/WEB-INF/views/basic/header.jsp"%>
	<main class="page-main">
		<div class="page-body">
			<!-- 프로필 정보 -->
			<div class="profile-body">
				<div class="profile-info">
					<div class="profile-info-icon">
						<img class="profile-icon" src="/resources/imgs/profile_icon/${profile_info.profile_icon }.png" alt="profile">
						<span class="profile-icon-text" onclick="chg_profile_icon()">변경</span>
					</div>
					<div class="profile-user">
						<div class="profile-user-title"> <img class="profile-user-level" src="/resources/imgs/level_icon/${profile_info.site_level }.gif" alt="level"> ${profile_info.summoner_id }</div>
						<div class="profile-user-text">명예지수 : ${profile_info.honor_rate } / 5.0</div>
					</div>
				</div>
				<div class="profile-button-body">
					<a class="profile-button" href="#!" onclick="chg_password()">
						<span class="profile-button-text">비밀번호 변경</span></a>
					<a class="profile-button" href="/record/record.do?summoner_id=${sessionScope.summoner_id}">
						<span class="profile-button-text">전적 보기</span></a>
				</div>
			</div>
			<!-- 친구 신청 목록 -->
			<c:set var="friends" value="${profile_friend }" />
			<c:if test="${friends != '[]' }">
			<div class="friends-box">
				<div class="friends-head">
					<h2 class="friends-title">친구 신청 목록</h2>
				</div>
				<div class="friends-body">
						<c:set var="i" value="0" />
						<c:set var="j" value="2" />
						<table class="friends-list">
							<c:choose>
								<c:when test="${friends != null}">
									<c:forEach items="${friends}" var="friends" varStatus="friends_index">
									<c:if test="${i%j == 0}">
										<tr>
									</c:if>
									<td class="td-line td-profile-icon"><img class="friends-profile-icon"src="/resources/imgs/profile_icon/${friends.profile_icon }.png" alt="profile_icon"></td>
									<td class="td-line td-honorrate">${friends.honor_rate } / 5.0</td>
									<td class="td-line td-summonerid"><img class="friends-level" src="/resources/imgs/level_icon/${friends.site_level }.gif" alt="level"> <a class="choice-record" href="/record/record.do?user_no=${friends.user_no}">${friends.summoner_id}</a></td>
									<td class="td-line td-checked friends_check"><img src="../resources/imgs/post_detail/checked.png" value="${friends.user_no }"></td>
									<td class="td-empty"></td>
									<c:if test="${i%j == j-1}">
										</tr>
									</c:if>
									<c:if test="${friends_index.last }">
										<c:if test="${i%j != j-1}">
										<td class="td-profile-icon"></td>
										<td class="td-honorrate"></td>
										<td class="td-summonerid"></td>
										<td class="td-checked"></td>
										<td class="td-empty"></td>
										</c:if>
									</c:if>
									<c:set var="i" value="${i+1}" />
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td>존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>


				</div>
			</div>
			</c:if>
			
			
			<!-- 뱃지 목록 -->
			<div class="badges-box">
				<div class="badges-head">
					<h3 class="badges-title">활동 뱃지</h3>
				</div>
				<div class="badges-body">
					<ul class="badges-list">
						<c:forEach items="${profile_badge }" var="badge">
							<li>
								<img class="badges"src="/resources/imgs/badge/${badge.badge_file }.png" alt="badge">
								<div class="badges-info">
					    			<h3>${badge.badge_name }</h3>
					    			<div>"${badge.badge_require }"</div>
				    			</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- 채택 목록 -->
			<div class="choices-box">
				<div class="choices-head">
					<h3 class="choices-title">채택 목록</h3>
				</div>
				<div class="choices-body">
						<c:set var="i" value="0" />
						<c:set var="j" value="2" />
						<table class="choices-list">
							<c:choose>
								<c:when test="${profile_choice != null}">
									<c:forEach items="${profile_choice}" var="choice" varStatus="choice_index">
									<c:if test="${i%j == 0}">
										<tr>
									</c:if>
									<td class="td-line td-tier"><img class="choice-tiers"src="/resources/imgs/tier/${choice.solo_tier }.png" alt="tier">${choice.solo_tier } ${choice.solo_tier_grade }</td>
									<td class="td-line td-honorrate">${choice.honor_rate } / 5.0</td>
									<td class="td-line td-summonerid"><img class="choice-level" src="/resources/imgs/level_icon/${choice.site_level }.gif" alt="level"> <a class="choice-record" href="/record/record.do?user_no=${choice.choice_user_no}">${choice.summoner_id }</a></td>
									<td class="td-line td-checked choices_check"><img src="../resources/imgs/post_detail/checked.png" value="${choice.choice_user_no }"></td>
									<td class="td-empty"></td>
									<c:if test="${i%j == j-1}">
										</tr>
									</c:if>
									<c:if test="${choice_index.last }">
										<c:if test="${i%j != j-1}">
										<td class="td-tier"></td>
										<td class="td-honorrate"></td>
										<td class="td-summonerid"></td>
										<td class="td-checked choices_check"></td>
										<td class="td-empty"></td>
										</c:if>
									</c:if>
									<c:set var="i" value="${i+1}" />
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td>존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>


				</div>
			</div>
			
			<!-- 게시글 목록 -->
			<div class="board-box">
				<div class="boardlist-head">
					<h3 class="boardlist-title">게시글<small> [최신순 10개]</small></h3>
				</div>
				<div class="boardlist-body">
					<table border="1" class="board-list">
						<tr>
							<th width="15%">No</th>
							<th width="70%">제목</th>
							<th width="15%">등록일</th>
						</tr>
						<c:forEach items="${profile_board }" var="board">
							<tr>
								<td>${board.post_no }</td>
								<td><a href="/board_view/viewBoard.do?post_no=${board.post_no }">${board.board_title }</a></td>
								<td>${board.board_date }</td>
							</tr>
						</c:forEach>

					</table>
				</div>
			</div>
		</div>




	</main>
	<%@ include file="/WEB-INF/views/profile/change_password.jsp"%>
	<%@ include file="/WEB-INF/views/profile/change_profile_icon.jsp"%>
	<%@ include file="/WEB-INF/views/profile/honor_rate.jsp"%>
	<%@ include file="/WEB-INF/views/basic/footer.jsp"%>
	<script type="text/javascript" src="/resources/js/profile.js"></script>
</body>
</html>