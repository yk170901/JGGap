<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구인 게시글 상세 페이지</title>
    <link href="../resources/css/post_detail.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="/resources/imgs/favicon.png" type="image/x-icon">
    
</head>
<body>
	<%@ include file="/WEB-INF/views/basic/header.jsp" %>

	<div class="post-wrap">
		<div class="post-content">
			<div class="post-header">
				<h1 class="post-header-top"><c:out value="${board.board_title }" /></h1>
			</div>
			<hr>
			
			<div style="word-break:break-all;"><span id="post-content">${board.board_text }</span></div>
			
			<%--관리자에게만 글 수정/삭제 버튼이 보임 --%>
			<c:if test="${sessionScope.ban == 3 }">
				<div id="writer-post-button">
					<a class="detail-big-btn modify-post" href="../board_detail/updateAdminBoard.do?post_no=<c:out value="${board.post_no }"/>" style=" padding-left: 20px; padding-right: 20px;">수정</a>
					<form method="post" action="../board_detail/adminPostDelete.do?post_no=<c:out value="${board.post_no }"/>" style="display: inline-block;" onsubmit="return confirmPostDelete()">
						<button class="detail-big-btn" type="submit">삭제</button>
					</form>
				</div>
			</c:if>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/basic/footer.jsp" %>

</body>
    <script src="../resources/js/post_view.js?ver=3" type="text/javascript"></script>
</html>