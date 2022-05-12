<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ㅈㄱㅊㅇ - 구인글 수정</title>
    <link href="../resources/css/post_detail.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="/resources/imgs/favicon.ico" type="image/x-icon">
</head>
<body>
<%@ include file="/WEB-INF/views/basic/header.jsp" %>
	
	<hr><br>

	<div class="post-wrap">
		<form method="post" action="postUpdate.do?" onsubmit="return checkValidation();">
			<div class="post-header">
				<h1 class="post-header-top">글 수정</h1>
				<div class="post-header-bottom">
					<input type="hidden" name="post_no" id="post_no" value="${update.post_no}">
					<input type="text" id="title" name="board_title" maxlength=30 value="${update.board_title }">
					
					<div class="category-wrap">
						<div class="category-content">
							<div class="category-title">맵 분류 : </div> ${update.game_map }
						</div>
						
						<div class="category-content game-mode">
							<div class="category-title">게임 분류 : </div> ${update.game_mode }
						</div>
						
						<div class="category-content">
							<div class="category-title">플레이 인원 : </div> ${update.cru_max }
						</div>
					</div>
					
				</div>
			</div>
			<div class="post-content">
				<div class="textarea-wrap"><textarea id="content" name="board_text" maxlength="1300">${update.board_text }</textarea></div>
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
    <script src="../resources/js/post_detail.js?ver=3" type="text/javascript"></script>
</html>