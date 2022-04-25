<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구인 게시판</title>
<link href="../resources/css/post_list.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript" src="../resources/js/post_list.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/basic/header.jsp" %>
<div class="total_div" style="background-color: white;">

	<!-- 검색 전체 div -->
	<div class=map_game_gategory>
		
		<!-- 토탈 검색 기능 -->
		<form action="board_list.do" method="get" onsubmit="is_checked()">
			<!-- 맵 분류 -->
			<div class="map">
				<div class="main_hr">
					<span class="map_category">맵 분류</span>
				</div>
				<div class="new">
				    <div class="form-group">
				      <input type="checkbox" id="hupgok" checked="checked" name="search_check_map" value="소환사의 협곡">
				      <label for="hupgok">소환사의 협곡</label>
				      &ensp;
				      <input type="checkbox" id="kalbaram" checked="checked" name="search_check_map" value="칼바람 나락">
				      <label for="kalbaram">칼바람 나락</label>
				    </div>
				</div>

			</div>
			<!-- 맵 분류 end -->
			
			
			
			
			<!-- 게임 분류 -->
			<div class="game">
				<div class="main_hr">
					<span class="game_category">게임 분류</span>
				</div>
				<div class="form-group">
				      <input type="checkbox" id="mode_normal" checked="checked" name="search_check_mode" value="일반">
				      <label for="mode_normal">일반</label>
				      &ensp;
				      <input type="checkbox" id="mode_solorank" checked="checked" name="search_check_mode" value="솔로랭크">
				      <label for="mode_solorank">솔로 랭크</label>
				      &ensp;
				      <input type="checkbox" id="mode_freerank" checked="checked" name="search_check_mode" value="자유랭크">
				      <label for="mode_freerank">자유 랭크</label>
				</div>
			</div>
			<!-- 게임 분류 end -->
			
			
			<!-- 검색 기능 -->
			<div class="search">
				<select name="searchCondition" class="radius" id="search_value">
					<option value="board_title">제 목</option>
					<option value="user_no">작성자</option>
				</select>
				<input type="text" class="radius" id="text_ra" name="searchKeyword"/>
				<input type="submit" value="조 회" id="submitbutton"/>
			</div>
			<!--  검색 기능 end -->
		</form>
		<!-- 토탈 검색 기능 end -->
	</div>
	<!-- 	검색 전체 div end -->
	
	
	<!-- 테이블 조회 기능 -->
	<div class="table_list" style="text-align: center;">
		<table class="table_all">
			<tr>
				<th width="100px">No</th>
				<th width="470px">제목</th>
				<th width="370px">작성자</th>
				<th width="160px">등록일</th>
				<th width="60px">모집 인원</th>
			</tr>
			
		<!-- 관리자 게시판 조회 -->
		<c:forEach items="${admin_list}" var="admin_vo">
			<tr>
				<td class="admin_td admin_td_left"><c:out value="공지"/></td>
				<td class="admin_td"><c:out value="${admin_vo.board_title}"/></td>
				<td class="admin_td"><c:out value="관리자"/></td>
				<td class="admin_td"><c:out value="${admin_vo.board_date}"/></td>
				<td class="admin_td"><c:out value="-"/></td>
				
			</tr>
		</c:forEach>
		<!-- 관리자 게시판 조회 end -->		
			
			
		<!-- 사용자 게시판 조회 -->
		<c:forEach items="${list}" var="vo">
			<tr>
				<td><c:out value="${vo.post_no}"/></td>
				<td><c:out value="${vo.board_title}"/></td>
				<td><c:out value="${vo.user_no}"/></td>
				<td><c:out value="${vo.board_date}"/></td>
				<td><c:out value="0/4"/></td>
				
			</tr>
		</c:forEach>
		<!-- 사용자 게시판 조회 end -->
		
		</table>
		
		
		<!-- 글 작성 -->
		<div style="text-align: right; padding: 20px;">	
			<a href="/board_detail/insertBoard.do" style="text-decoration: none;">글 작성</a>
		</div>
		
		
		<!-- 페이징 -->
		<div class="paging_total">
			<!-- 스프링 부트 -->
			<div class="container">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<!-- searchKeyword == null -->
							<c:if test="${paging.searchKeyword == null || paging.searchKeyword == empty string}">
								<!-- 이전 페이지 조건문 -->
								<c:if test="${paging.startPage != 1 }">
									<li class="page-item"><a class="page-link" href="board_list.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">이전</a></li>				
								</c:if>
								<!-- 이전 페이지 조건문 end -->
								
								
								<!-- 값이 없을때의 반복문 -->
								
									<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == paging.nowPage }">
												<li class="page-item">
													<a class="page-link" style="font-weight: bold; color: rgb(65,105,225);">${p }</a>
												</li>
											</c:when>
											<c:when test="${p != paging.nowPage }">
												<li class="page-item">
													<a class="page-link" href="board_list.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}" class="paging_num">${p }</a>
												</li>
											</c:when>
										</c:choose>															
									</c:forEach>
								
								<!-- 값이 있을때의 반복문 end -->
										
								<!-- 다음 페이지 조건문 -->
								<c:if test="${paging.endPage != paging.lastPage}">
									<li class="page-item">
										<a class="page-link" href="board_list.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">다음</a>
									</li>
								</c:if>	
								<!-- 다음 페이지 조건문 end -->
							</c:if>
							
							
							
							
							
							
							
							<!-- searchKeyword not null -->
							<c:if test="${paging.searchKeyword != null}">
								<!-- 이전 페이지 조건문 -->
								<c:if test="${paging.startPage != 1 }">
									<li class="page-item"><a class="page-link" href="board_list.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchCondition=${paging.searchCondition }&searchKeyword=${paging.searchKeyword }">이전</a></li>				
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
													<a class="page-link" href="board_list.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchCondition=${paging.searchCondition }&searchKeyword=${paging.searchKeyword }" class="paging_num">${p }</a>
												</li>
											</c:when>
										</c:choose>															
									</c:forEach>
								
								<!-- 값이 있을때의 반복문 end -->
										
								<!-- 다음 페이지 조건문 -->
								<c:if test="${paging.endPage != paging.lastPage}">
									<li class="page-item">
										<a class="page-link" href="board_list.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchCondition=${paging.searchCondition }&searchKeyword=${paging.searchKeyword }">다음</a>
									</li>
								</c:if>	
								<!-- 다음 페이지 조건문 end -->
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<!-- 스프링 부트 end -->
		</div>
		<!-- 페이징 end -->
	</div>		
</div>	
	
<%@ include file="/WEB-INF/views/basic/footer.jsp" %>
</body>
</html>