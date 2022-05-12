<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ㅈㄱㅊㅇ - 전적검색과 구인을 한 번에!</title>
    <link href="../resources/css/post_detail.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="/resources/imgs/favicon.ico" type="image/x-icon">
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
				<div class="textarea-wrap"><textarea id="content" name="board_text" maxlength="1300"></textarea></div>
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
    <script src="../resources/js/post_detail.js?ver=3" type="text/javascript"></script>
</html>