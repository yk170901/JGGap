<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 내역</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript" src="../resources/js/post_list.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="/resources/imgs/favicon.png" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/admin.css" type="text/css">

</head>
<body style="background-color: white">

	<%@ include file="/WEB-INF/views/basic/header.jsp"%>
	<main class="page-main">
		<div class="page-body">
			<div id="user_list_table">
				<table class="list">
					<tr>
						<th width="110px">신고 번호</th>
						<th width="110px">신고자</th>
						<th width="110px">대상</th>
						<th width="110px">제목</th>
						<th width="110px">신고 내용</th>
						<th width="110px">처리</th>
						<th width="110px">처리상황</th>
					</tr>
					<c:forEach items="${list}" var="list">
						<tr class="member">
							<td><c:out value="${list.report_no}"/></td>
							<td><c:out value="${list.reporter}"/></td>
							<td><c:out value="${list.report_target}"/></td>
							<td><a href="http://localhost:8080/board_view/viewBoard.do?post_no=${list.report_url}"><c:out value="${list.report_title}"/></a></td>
							<td><c:out value="${list.report_content}"/></td>			
							<td><c:out value="${list.report_result}"/></td>
						</tr>
					</c:forEach>
				</table>
				<button id="progress">진행</button>
			</div>
		</div>
		
		<%--신고 모달 --%>
	<div class="modal-bg">
		<div class="modal">
			<h3 class="modal-title">신고 작성</h3>
			<input type="text" name="report_title" id="report-title" placeholder="제목을 적어주세요">
			<textarea name="report_content" id="report-content" style="color: black;" placeholder="내용을 적어주세요"></textarea>
			<input type="hidden" name="report_target" id="report-target" value="">
			<button id="submitReport">신고하기</button>
			<span class="modal-close">&times;</span>
		</div>
	</div>

	</main>
	<%@ include file="/WEB-INF/views/basic/footer.jsp"%>
</body>
<script src="/resources/js/admin.js?ver=1"></script>
</html>
