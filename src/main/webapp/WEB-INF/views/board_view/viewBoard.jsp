<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- c 가져오기 -->
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구인 게시글 상세 페이지</title>
    <link href="../resources/css/post_detail.css" rel="stylesheet" type="text/css">
    <script src="../resources/js/post_detail.js?ver=3" type="text/javascript"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/basic/header.jsp" %>
	
	<hr><br>

	<div class="post-wrap">
		<div class="post-content">
			<div class="post-header">
				<!-- 포스트 넘버 임의로 줌 -->
				<input type="hidden" name="post_no" value="72">
				<h1 class="post-header-top">${board_view.board_title }</h1>
				<div class="post-header-bottom">
					
					<div class="user-info">
						<div class="user-info">티어 이미지<%-- ${board_view.board_title } --%></div>
						<div class="user-info">티어 레벨 ${board_view.writer.solo_rank_tier }</div>
						<div class="user-info">닉네임${board_view.writer.summoner_id }</div>
						<div class="user-info">평점${board_view.writer.honor_rate }</div>
						<button class="detail-small-btn">팔로우</button>
					</div>
					
					<div class="post-info">
						<div class="post-info">맵 분류 : ${board_view.game_map }</div>
						<div class="post-info">게임 분류 : ${board_view.game_mode }</div>
						<div class="post-info">모집인원 : ${board_view.recruitment }</div>
						<div class="post-info">작성날짜 : ${board_view.board_date }</div>
						<button class="detail-small-btn">신고</button>
					</div>
					
				</div>
			</div>
			<div><p id="content-on-display">${board_view.board_text }</p></div>
			<div class="button4writer">
				<button class="detail-big-btn">수정</button>
				<button class="detail-big-btn" onclick="confirmDelete()">삭제</button>
			</div>
		</div>
		
		<div class="reply_wrap">
			<div class="reply-header"><img src="">댓글 (댓글 수)</div>
			<div class="reply-content">
				<div>
					<div class="user-info">
						<div class="user-info">티어 이미지</div>
						<div class="user-info">티어 레벨</div>
						<div class="user-info">닉네임</div>
						<div class="user-info">평점</div>
						<button class="detail-small-btn">팔로우</button>
					</div>
				</div>
				<div>
					<%--c:for each 써야 함 --%>
					<p>내용 : ${board_view.reply.re_text }</p>
					<p>날짜 : ${board_view.reply.re_date  }</p>
					<button class="detail-small-btn">삭제</button>
					<img src="">
				</div>
			</div>
			<div class="new-reply">
				<form method="post" action="insertReply.do">
					<%-- <input type="hidden" name="post_no" value=${board_detail.post_no }> --%>
					<input type="text" name="re_text_insert" placeholder="내용을 작성하세요.">
					<button type="submit" class="detail-big-btn">작성</button>				
				</form>
			</div>
		</div>
		
	</div>
	
	<br><hr>
	
	<%@ include file="/WEB-INF/views/basic/footer.jsp" %>

</body>
</html>