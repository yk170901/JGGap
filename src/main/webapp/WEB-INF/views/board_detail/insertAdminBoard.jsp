<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구인 게시글 작성 페이지</title>
    <link href="../resources/css/post_detail.css" rel="stylesheet" type="text/css">
    <script src="../resources/js/post_detail.js?ver=3" type="text/javascript"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/basic/header.jsp" %>
	<hr>
	<div class="post-wrap">
		<form method="post" action="adminPostInsert.do" onsubmit="return checkValidation();">
			<div class="post-header">
				<h1 class="post-header-top">공지 작성</h1>
				<div class="post-header-bottom">
					<input type="text" id="title" placeholder="제목을 입력해주세요" name="board_title" maxlength=30>
				</div>
			</div>
			<div class="post-content">
				<div class="textarea-wrap"><textarea id="content" name="board_text"></textarea></div>
			</div>
			<div class="button-wrap">
				<button class="post-submit detail-big-btn" type="submit">작성</button>
				<button class="post-discard detail-big-btn" type="button" onclick="cancelPostInsert()">취소</button>
			</div>
		</form>
	</div>
	
	<hr>
	
	<%@ include file="/WEB-INF/views/basic/footer.jsp" %>
</body>
    <script src="../resources/js/post_detail.js?ver=3" type="text/javascript"></script>
</html>