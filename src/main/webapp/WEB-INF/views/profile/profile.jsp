<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
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
						<img class="profile-icon" src="/resources/imgs/profile_icon/7.png" alt="profile">
						<span class="profile-icon-text" onclick="chg_profile_icon()">변경</span>
					</div>
					<div class="profile-user">
						<div class="profile-user-title">${profile_info.summoner_id }</div>
						<div class="profile-user-text">명예지수 : ${profile_info.honor_rate } / 5.0</div>
					</div>
				</div>
				<div class="profile-button-body">
					<a class="profile-button" href="#!" onclick="chg_password()"><span
						class="profile-button-text">비밀번호 변경</span></a> <a
						class="profile-button" href="#!"><span
						class="profile-button-text">전적 보기</span></a>
				</div>
			</div>
			<!-- 뱃지 목록 -->
			<div class="badges-box">
				<div class="badges-head">
					<h2 class="badges-title">활동 뱃지</h2>
				</div>
				<div class="badges-body">
					<ul class="badges-list">
						<c:forEach items="${profile_badge }" var="badge">
							<li>
								<img class="badges"src="/resources/imgs/profile_icon/${badge.badge_name }.png" alt="badge">
								<span>${badge.badge_name }</span>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- 게시글 목록 -->
			<div class="board-box">
				<div class="boardlist-head">
					<h2 class="boardlist-title">게시글</h2>
				</div>
				<div class="board-list-body">
					<table border="1" class="board-list">
						<tr>
							<th width="100px">No</th>
							<th width="860px">제목</th>
							<th width="150px">등록일</th>
						</tr>
						<c:forEach items="${profile_board }" var="board">
							<tr>
								<td>${board.post_no }</td>
								<td>${board.board_title }</td>
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
	<%@ include file="/WEB-INF/views/basic/footer.jsp"%>
	<script type="text/javascript" src="/resources/js/profile.js"></script>


</body>
</html>