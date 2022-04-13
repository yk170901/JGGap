<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구인 게시글 상세 페이지</title>
    <link href="../resources/css/yk_post_detail.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<h1>헤더가 올 자리입니다.</h1>
	</header>
	
	<hr><br>

	<div class="post-wrap">
		<div class="post-header">
			<h1 class="post-header-top">글 작성</h1>
			<div class="post-header-bottom">
				<input type="text" placeholder="제목을 입력해주세요">
				<div class="category-wrap">
					<div class="category-title">맵 분류</div>
					<select name="category-map" id="category-map">
						<option value="none">선택해주세요.</option>
						<option value="summoner-rift">소환사의 협곡</option>
						<option value="windswept-depths">칼바람 나락</option>
					</select>
				</div>
				<div class="category-wrap">
					<div class="category-title">게임 분류</div>
					<select name="category-game" id="category-game">
						<option value="none">선택해주세요.</option>
						<option value="normal">일반</option>
						<option value="follow-rank">팔로 랭크</option>
						<option value="free-rank">자유 랭크</option>
					</select>
				</div>
			</div>
		</div>
		<div class="post-content">
			<div class="textarea-wrap"><textarea></textarea></div>
			
		</div>
		<div class="button-wrap">
			<button class="post_submit">작성</button>
			<button class="post-discard">취소</button> <!-- 누르면 게시글을 삭제하겠냐는 alert 띄우기 -->
		</div>
	</div>
	
	<br><hr>
	
	<footer>
		<h1>푸터가 올 자리입니다.</h1>
	</footer>
</body>
</html>