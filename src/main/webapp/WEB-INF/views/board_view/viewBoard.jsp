<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<h1 class="post-header-top">${board_detail.title } 글 제목이 들어올 장소입니다</h1>
				<div class="post-header-bottom">
					
					<div class="user-info">
						<div class="user-info">티어 이미지</div>
						<div class="user-info">티어 레벨</div>
						<div class="user-info">닉네임</div>
						<div class="user-info">평점</div>
						<button class="detail-small-btn">팔로우</button>
					</div>
					
					<div class="post-info">
						<div class="post-info">맵 분류 : </div>
						<div class="post-info">게임 분류 : </div>
						<div class="post-info">작성날짜 : </div>
						<button class="detail-small-btn">신고</button>
					</div>
					
				</div>
			</div>
			<div><p id="content-on-display">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
				Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
				Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
				Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p></div>
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
					<p>(reply db에서 가져온 거)</p>
					<button class="detail-small-btn">삭제</button>
					<img src="">
				</div>
			</div>
			<div class="new-reply">
				<input type="text" placeholder="내용을 작성하세요.">
				<button class="detail-big-btn">작성</button>
			</div>
		</div>
		
	</div>
	
	<br><hr>
	
	<%@ include file="/WEB-INF/views/basic/footer.jsp" %>

</body>
</html>