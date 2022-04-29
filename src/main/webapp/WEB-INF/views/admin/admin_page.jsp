<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="/resources/imgs/favicon.png" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/profile.css" type="text/css">
</head>
<body>

	<%@ include file="/WEB-INF/views/basic/header.jsp"%>
	<main class="page-main">
		<div class="page-body">
			<table class="table_all">
			<tr>
				<th width="100px">아이디</th>
				<th width="100px">닉네임</th>
				<th width="100px">연락처</th>
				<th width="100px">Point</th>
				<th width="100px">사이트 레벨</th>
				<th width="100px">명예 레벨</th>
				<th width="100px">상품 구매내역</th>
				<th width="100px">밴</th>
			</tr>
			<!-- 관리자 게시판 조회 -->
		<c:forEach items="${admin_list}" var="admin_vo">
			<tr>
				<td class="admin_td admin_td_left"><c:out value="공지"/></td>
				<td class="admin_td"></td>
				<td class="admin_td"><c:out value="${admin_vo.board_title}"/></td>
				<td class="admin_td" style="text-align: left;">
				<img src="/resources/imgs/level_icon/222.gif" class="tier_img">
				<c:out value="관리자"/>
				</td>
				<td class="admin_td"></td>
				<td class="admin_td">
					<c:out value="${admin_vo.board_date}"/>
				</td>
				
				
				<td class="admin_td"></td>
				
			</tr>
		</c:forEach>
		<!-- 관리자 게시판 조회 end -->		
			</table>
		</div>




	</main>
	<%@ include file="/WEB-INF/views/basic/footer.jsp"%>
</body>
</html>
