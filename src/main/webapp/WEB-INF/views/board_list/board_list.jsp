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
<script src="../resources/js/post_list.js?ver=1" type="text/javascript"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/basic/header.jsp" %>
<div class="total_div" style="background-color: white;">
	<div class=map_game_gategory>
	
		<form action="board_list.do" method="get" onsubmit="is_checked()">
			<!-- 맵 분류 -->
			<div class="map">
				<div class="main_hr">
					<span class="map_category">맵 분류</span>
				</div>
				<div class="new">
				    <div class="form-group">
				      <input type="checkbox" id="hupgok" checked="checked">
				      <label for="hupgok">소환사 협곡</label>
				      &ensp;
				      <input type="checkbox" id="kalbaram" checked="checked">
				      <label for="kalbaram">칼바람 나락</label>
				    </div>
				</div>

			</div>
			
			
			
			
			<!-- 게임 분류 -->
			<div class="game">
				<div class="main_hr">
					<span class="game_category">게임 분류</span>
				</div>
				<div class="form-group">
				      <input type="checkbox" id="mode_normal" checked="checked">
				      <label for="mode_normal">일반</label>
				      &ensp;
				      <input type="checkbox" id="mode_solorank" checked="checked">
				      <label for="mode_solorank">솔로 랭크</label>
				      &ensp;
				      <input type="checkbox" id="mode_freerank" checked="checked">
				      <label for="mode_freerank">자유 랭크</label>
				</div>
			</div>
			
			
			
			<!-- 검색 기능 -->
			<div class="search">
				<select name="searchCondition" class="radius" id="search_value">
					<option value="제목">제 목</option>
					<option value="작성자">작성자</option>
				</select>
				<input type="text" class="radius" id="text_ra" name="searchKeyword"/>
				<input type="submit" value="조 회" id="submitbutton"/>
			</div>
			
			
		</form>

	</div>
	
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
		<!-- 관리자 -->
		<c:forEach items="${admin_list}" var="admin_vo">
			<tr>
				<td class="admin_td admin_td_left"><c:out value="공지"/></td>
				<td class="admin_td"><c:out value="${admin_vo.board_title}"/></td>
				<td class="admin_td"><c:out value="관리자"/></td>
				<td class="admin_td"><c:out value="${admin_vo.board_date}"/></td>
				<td class="admin_td"><c:out value="-"/></td>
				
			</tr>
		</c:forEach>			
			
			
		<!-- 사용자 -->
		<c:forEach items="${list}" var="vo">
			<tr>
				<td><c:out value="${vo.post_no}"/></td>
				<td><c:out value="${vo.board_title}"/></td>
				<td><c:out value="${vo.user_no}"/></td>
				<td><c:out value="${vo.board_date}"/></td>
				<td><c:out value="0/4"/></td>
				
			</tr>
		</c:forEach>
		
		</table>
			
	</div>
	
</div>
	
	
<%@ include file="/WEB-INF/views/basic/footer.jsp" %>
</body>
</html>