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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="/resources/imgs/favicon.png" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/profile.css" type="text/css">
</head>
<body>

	<%@ include file="/WEB-INF/views/basic/header.jsp"%>
	<main class="page-main">
		<div class="page-body">
			<table>
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
			<c:forEach items="${list}" var="vo">
				<tr>
					<td><c:out value="${vo.user_id}"/></td>
					<td><c:out value="${vo.user_no}"/></td>
					<td><c:out value="${vo.summoner_id}"/></td>
					<td><c:out value="${vo.phone_number}"/></td>
					<td><c:out value="${vo.site_level}"/></td>
					<td><c:out value="${vo.usable_point}"/></td>
					<td><c:out value="${vo.profile_icon}"/></td>
					<td><c:out value="${vo.honor_rate}"/></td>
					<td><c:out value="${vo.join_date}"/></td>
					<td><c:out value="${vo.ban}"/></td>
				</tr>
			</c:forEach>
			</table>
		</div>




	</main>
	<%@ include file="/WEB-INF/views/basic/footer.jsp"%>
</body>
</html>
