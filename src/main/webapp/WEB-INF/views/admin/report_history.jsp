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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="shortcut icon" href="/resources/imgs/favicon.ico" type="image/x-icon">
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
						<th width="110px">접수</th>
						<th width="110px">처리상황</th>
					</tr>
					<c:forEach items="${list}" var="list">
						<tr class="member">
							<td><c:out value="${list.report_no}"/></td>
							<td><c:out value="${list.reporter}"/></td>
							<td class="help"><input type="hidden" class="help2" value="${list.report_target}"><c:out value="${list.report_target}"/></td>
							<td><a href="http://localhost:8080/board_view/viewBoard.do?post_no=${list.report_url}"><c:out value="${list.report_title}"/></a></td>
							<td class="help2"><c:out value="${list.report_content}"/></td>
							<td>
							<c:if test="${list.report_cnt == 0 }"><button class="receipt" value="${list.report_url}">신고 처리</button></c:if>
							<c:if test="${list.report_cnt == 1 }"><button id="report_ok" disabled="disabled">신고 처리</button></c:if>
							</td>			
							<td class="nodes"><input type="hidden" name="cnt" id="cnt" value="${list.report_cnt}"/>
							<c:if test="${list.report_cnt == 0 }">대기 중</c:if>
							<c:if test="${list.report_cnt == 1 }">처리 완료</c:if>							
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<!-- 페이징 -->
		<div class="paging_total">
			<!-- 스프링 부트 -->
			<div class="container">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							
								<!-- 이전 페이지 조건문 -->
								<c:if test="${paging.startPage != 1 }">
									<li class="page-item"><a class="page-link" href="report_history.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">이전</a></li>		
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
													<a class="page-link paging_num" href="report_history.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}"
													>${p }</a>
												</li>
											</c:when>
										</c:choose>															
									</c:forEach>
								
								<!-- 값이 있을때의 반복문 end -->
										
								<!-- 다음 페이지 조건문 -->
								<c:if test="${paging.endPage != paging.lastPage}">
									<li class="page-item">
										<a class="page-link" href="report_history.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">다음</a>
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
	<%--신고 모달 --%>
		<div class="modal-bg">
			<div class="modal">
				<h3 class="modal-title">신고 처리</h3>
				<textarea name="report_result" id="report-result" style="color: black;" placeholder="내용을 적어주세요"></textarea>
				<input type="hidden" name="report_url" id="report_url" value="">
				<input type="hidden" name="report_target" id="report_target" value="">
				<button id="submitReport">확인</button>
				<span class="modal-close">&times;</span>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/basic/footer.jsp"%>
</body>
<script src="/resources/js/admin.js?ver=1"></script>
</html>
