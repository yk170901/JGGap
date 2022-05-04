<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구인 게시글 수정 페이지</title>
    <link href="../resources/css/post_detail.css" rel="stylesheet" type="text/css">
    <script src="../resources/js/post_detail.js?ver=3" type="text/javascript"></script>
</head>
<body onload="get_chosen_options()"> <!-- 여기에 옵션이 칼바람 나락이면 모드 안 보이게 하는 거로 바꾸기 -->
<%@ include file="/WEB-INF/views/basic/header.jsp" %>
	
	<hr><br>

	<div class="post-wrap">
		<form method="post" action="postUpdate.do?" onsubmit="return checkValidation();">
			<div class="post-header">
				<h1 class="post-header-top">글 수정</h1>
				<div class="post-header-bottom">
					<input type="hidden" name="post_no" id="post_no" value="${update.post_no}">
					<input type="text" id="title" name="board_title" maxlength=30 value="${update.board_title }">
					
					<c:if test="${board.writer.user_no  != 10028}">
						<div class="category-wrap">
							<div class="category-content">
								<div class="category-title">맵 분류</div>
								<select class="category-map" id="category-map" name="game_map">
									<!-- 아래의 값 input hidden으로 가져와서 js로 해당 값 가진 option for문을 통해 selected 속성 부여만 하기 -->
									<option value="${update.game_map }">${update.game_map }</option>
									<option value="소환사의 협곡">소환사의 협곡</option>
									<option value="칼바람 나락">칼바람 나락</option>
								</select>
							</div>
							
							<div class="category-content game-mode">
								<div class="category-title">게임 분류</div>
								<select class="category-game" id="category-game" name="game_mode">
									<option value="${update.game_mode }">${update.game_mode }</option>
									<option value="일반">일반</option>
									<option value="솔로 랭크">솔로 랭크</option>
									<option value="자유 랭크">자유 랭크</option>
								</select>
							</div>
							
							<div class="category-content">
								<div class="category-title">모집인원</div>
								<select class="category-cru-max" id="category-cru-max" name="cru_max" style="width:80px;">
									<option value="${update.cru_max }">${update.cru_max }</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</div>
						</div>
					</c:if>
				</div>
			</div>
			<div class="post-content">
				<div class="textarea-wrap"><textarea id="content" name="board_text">${update.board_text }</textarea></div>
			</div>
			<div class="button-wrap">
				<button class="post-modify detail-big-btn" type="submit">수정</button>
				<button class="post-discard detail-big-btn" type="button" onclick="cancelPostUpdate()">취소</button>
			</div>
		</form>
	</div>
	
	<hr>
	
	<%@ include file="/WEB-INF/views/basic/footer.jsp" %>
</body>
</html>