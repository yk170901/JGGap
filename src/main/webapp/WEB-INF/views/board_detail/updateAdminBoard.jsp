<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지글 수정 페이지</title>
    <link href="../resources/css/post_detail.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="/WEB-INF/views/basic/header.jsp" %>
	
	<hr><br>

	<div class="post-wrap">
		<form method="post" action="adminPostUpdate.do?" onsubmit="return checkValidation();">
			<div class="post-header">
				<h1 class="post-header-top">공지 수정</h1>
				<div class="post-header-bottom">
					<input type="hidden" name="post_no" id="post_no" value="${update.post_no}">
					<input type="text" id="title" name="board_title" maxlength=30 value="${update.board_title }">
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
    <script src="../resources/js/post_detail.js?ver=3" type="text/javascript"></script>
</html>