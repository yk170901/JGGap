<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<form action="board_list.do" method="get" onsubmit="return is_checked()">
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
				      <input type="checkbox" id="mode_solorank" checked="checked" name="search_check_mode" value="솔로 랭크">
				      <label for="mode_solorank">솔로 랭크</label>
				      &ensp;
				      <input type="checkbox" id="mode_freerank" checked="checked" name="search_check_mode" value="자유 랭크">
				      <label for="mode_freerank">자유 랭크</label>
				</div>
			</div>
			<!-- 게임 분류 end -->
			
			
			<!-- 검색 기능 -->
			<div class="searchsubmit">
				<select name="searchCondition" class="radius" id="search_value">
					<option value="board_title">제 목</option>
					<option value="summoner_id">작성자</option>
				</select>
				<input type="text" class="radius" id="text_ra" name="searchKeyword"/>
<!-- 				<i class="ico_search"></i> -->
				<input type="submit" id="submitbutton" class="ico_search">
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
				<th width="70px">번호</th>
				<th width="140px">분류</th>
				<th width="470px">제목</th>
				<th width="320px" colspan="2">글쓴이</th>
				<th width="100px">등록일</th>
				<th width="40px">모집 인원</th>
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
			
			
		<!-- 사용자 게시판 조회 -->
		<c:forEach items="${list}" var="vo">
			<tr>
				<td><c:out value="${vo.post_no}"/></td>
				<td style="text-align: left; padding-right: 0px;">
					<c:if test="${vo.game_map != '칼바람 나락'}">
						<c:if test="${vo.game_mode == '솔로 랭크'}">
							<c:out value="[솔로]"/>
							&nbsp;
							<c:out value="${vo.game_map}"/>
						</c:if>
						<c:if test="${vo.game_mode == '자유 랭크'}">
							<c:out value="[자유]"/>
							&nbsp;
							<c:out value="${vo.game_map}"/>
						</c:if>
						<c:if test="${vo.game_mode == '일반'}">
							<c:out value="[일반]"/>
							&nbsp;
							<c:out value="${vo.game_map}"/>
						</c:if>

					</c:if>
					<c:if test="${vo.game_map == '칼바람 나락'}">
						&ensp;&ensp;&ensp;
						<c:out value="${vo.game_map}"/>
					</c:if>
				</td>
				<td><a href="../board_view/viewBoard.do?post_no=${vo.post_no }" style="color: black; font-weight: normal;
						text-decoration: none; font-size: 13px;">
				<c:out value="${vo.board_title}"/></a></td>
				<td style="text-align: left;"><img src="/resources/imgs/level_icon/${vo.site_level}.gif" class="tier_img">
					<c:out value="${vo.summoner_id}"/></td>
				<td style="text-align: left;">
					<!-- 일반 / 솔로랭크 티어 정보 -->
					<c:if test="${vo.game_mode == '일반' or vo.game_mode == '솔로 랭크' or vo.game_map == '칼바람 나락'}">
						<img src="/resources/imgs/tier/${vo.solo_tier}.png" class="tier_img">
						<c:out value="| ${vo.solo_tier_grade} | "/>
					</c:if>
					
					<!-- 자유랭크 티어 정보 -->
					<c:if test="${vo.game_mode == '자유 랭크'}">
						<img src="/resources/imgs/tier/${vo.free_tier}.png" class="tier_img">
						<c:out value="| ${vo.free_tier_grade} | "/>
					</c:if>

					<!-- 그 외 정보 -->
						
					<c:out value="${vo.honor_rate}"/>
				</td>
				
				<td>
					<c:out value="${vo.board_date}"/>
				</td>
				<td><c:out value="${vo.cru_pre}/${vo.cru_max}"/></td>
			</tr>
		</c:forEach>
		<!-- 사용자 게시판 조회 end -->
		
		</table>
		
		
		<!-- 글 작성 -->
		<div style="text-align: right; width: 1150px; padding: 30px 20px 30px ;">	
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
									<li class="page-item"><a class="page-link" href="javascript:Frameset('board_list.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}')">이전</a></li>				
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
													<a class="page-link paging_num" href="javascript:Frameset('board_list.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}')">${p }</a>
												</li>
											</c:when>
										</c:choose>															
									</c:forEach>
								
								<!-- 값이 있을때의 반복문 end -->
										
								<!-- 다음 페이지 조건문 -->
								<c:if test="${paging.endPage != paging.lastPage}">
									<li class="page-item">
										<a class="page-link" href="javascript:Frameset('board_list.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}')">다음</a>
									</li>
								</c:if>	
								<!-- 다음 페이지 조건문 end -->
							</c:if>
							
							
							
							
							
							
							
							<!-- searchKeyword not null -->
							<c:if test="${paging.searchKeyword != null}">
								<!-- 이전 페이지 조건문 -->
								<c:if test="${paging.startPage != 1 }">
									<li class="page-item"><a class="page-link" href="javascript:Frameset('board_list.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}
									&searchCondition=${paging.searchCondition }&searchKeyword=${paging.searchKeyword }
									&search_check_map=${paging.search_check_map}&search_check_mode=${paging.search_check_mode}')">이전</a></li>				
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
													<a class="page-link paging_num" href="javascript:Frameset('board_list.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}
													&searchCondition=${paging.searchCondition }&searchKeyword=${paging.searchKeyword }
													&search_check_map=${paging.search_check_map}&search_check_mode=${paging.search_check_mode}')"
													>${p }</a>
												</li>
											</c:when>
										</c:choose>															
									</c:forEach>
								
								<!-- 값이 있을때의 반복문 end -->
										
								<!-- 다음 페이지 조건문 -->
								<c:if test="${paging.endPage != paging.lastPage}">
									<li class="page-item">
										<a class="page-link" href="javascript:Frameset('board_list.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}
										&searchCondition=${paging.searchCondition }&searchKeyword=${paging.searchKeyword }
										&search_check_map=${paging.search_check_map}&search_check_mode=${paging.search_check_mode}')">다음</a>
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