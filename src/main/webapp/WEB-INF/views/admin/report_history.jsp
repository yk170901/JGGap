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
				<table border="1" class="list">
					<tr>
						<th width="110px">신고자</th>
						<th width="110px">대상</th>
						<th width="110px">URL</th>
						<th width="110px">제목</th>
						<th width="110px">신고 내용</th>
						<th width="110px">처리상황</th>
					</tr>
					<c:forEach items="${list}" var="list">
						<tr id="test">
							<td><c:out value="${list.user_id}"/></td>
							<td><c:out value="${list.user_no}"/></td>
							<td><c:out value="${list.summoner_id}"/></td>
							<td><c:out value="${list.phone_number}"/></td>
							<td><c:out value="${list.site_level}"/></td>
							<td><c:out value="${list.usable_point}"/></td>
							<td><c:out value="${list.profile_icon}"/></td>
						</tr>
					</c:forEach>
				</table>
				<!-- 페이징 -->
		<div class="paging_total">
			<!-- 스프링 부트 -->
			<div class="container">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							
								<!-- 이전 페이지 조건문 -->
								<c:if test="${paging.startPage != 1 }">
									<li class="page-item"><a class="page-link" href="javascript:Frameset('admin_page.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}
									')">이전</a></li>		
								</c:if>
								<!-- 이전 페이지 조건문 end -->
								
								
								<!-- 값이 있을때의 반복문 -->
								
									<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == paging.nowPage }">
												<li class="page-item">
													<a class="page-link" style="font-weight: bold; color: rgb(65,105,225);">${p }</a>
												</li>
											</c:when>
											<c:when test="${p != paging.nowPage }">
												<li class="page-item">
													<a class="page-link paging_num" href="javascript:Frameset('admin_page.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}
													')"
													>${p }</a>
												</li>
											</c:when>
										</c:choose>															
									</c:forEach>
								
								<!-- 값이 있을때의 반복문 end -->
										
								<!-- 다음 페이지 조건문 -->
								<c:if test="${paging.endPage != paging.lastPage}">
									<li class="page-item">
										<a class="page-link" href="javascript:Frameset('admin_page.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}
										')">다음</a>
									</li>
								</c:if>
								<!-- 다음 페이지 조건문 end -->
						</ul>
					</div>
				</div>
			</div>
			<!-- 스프링 부트 end -->
		</div>
		<!-- 페이징 end -->
			</div>
		</div>

	</main>
	<%@ include file="/WEB-INF/views/basic/footer.jsp"%>
</body>
</html>
