<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ㅈㄱㅊㅇ - 공지 조회</title>
    <link href="../resources/css/post_detail.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="/resources/imgs/favicon.ico" type="image/x-icon">
    
</head>
<body>
	<%@ include file="/WEB-INF/views/basic/header.jsp" %>
	<hr>
	<div class="post-wrap">
		<div class="post-content">
			<div class="post-header">
				<h1 class="post-header-top"><c:out value="${board.board_title }" /></h1>
			</div>
			<div class="post-header-bottom">
				<div style="display: inline-block;"><img src="/resources/imgs/level_icon/222.gif" style="margin-bottom: 4px;"></div>
				<div style="display: inline-block; font-weight: bold;">&nbsp;관리자</div>&emsp;
				<div style="display: inline-block;"><b style="color: #f46119;">작성날짜</b>&nbsp;&nbsp;:&nbsp;&nbsp;<span class="post-info-detail" style="color: black;"><c:out value="${board.board_date }" /></span></div>
			</div>
			
			<hr>
			<div style="word-break:break-all;"><span id="post-content">${board.board_text }</span></div>
			
			<%--관리자에게만 글 수정/삭제 버튼이 보임 --%>
			<c:if test="${sessionScope.ban == 3 }">
				<div id="writer-post-button">
					<a class="detail-big-btn modify-post" href="../board_detail/updateAdminBoard.do?post_no=<c:out value="${board.post_no }"/>" style=" padding-left: 20px; padding-right: 20px;">수정</a>
					<button class="detail-big-btn" id="delete-admin-post" value="<c:out value="${board.post_no }"/>">삭제</button>
				</div>
			</c:if>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/basic/footer.jsp" %>

</body>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
    <script src="../resources/js/post_view.js?ver=3" type="text/javascript"></script>
</html>