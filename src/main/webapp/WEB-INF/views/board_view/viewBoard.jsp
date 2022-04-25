<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- c 가져오기 -->
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구인 게시글 상세 페이지</title>
    <link href="../resources/css/post_detail.css" rel="stylesheet" type="text/css">
    <script src="../resources/js/post_detail.js?ver=3" type="text/javascript"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/basic/header.jsp" %>
	
	<hr><br>

	<div class="post-wrap">
		<div class="post-content">
			<div class="post-header">
				<!-- 포스트 넘버 임의로 줌 -->
				<input type="hidden" name="post_no" value="72">
				<h1 class="post-header-top"><c:out value="${board_view_reply.reply_count }" />${board.board_title }</h1>
				<div class="post-header-bottom">
					
					<div class="user-info writer-info">
						<c:set var="tier" value="${board.writer.solo_rank_tier }"/>
							<!-- 이걸 더 예쁘게 줄이는 방법이 있을 거 같은데... -->
							<c:if test="${fn:contains(tier,'challenger') }">
								<div class="user-info"><img src="../resources/imgs/tier/challenger.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'grandmaster') }">
								<div class="user-info"><img src="../resources/imgs/tier/grand_master.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'master') }">
								<div class="user-info"><img src="../resources/imgs/tier/master.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'diamond') }">
								<div class="user-info"><img src="../resources/imgs/tier/diamond.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'platinum') }">
								<div class="user-info"><img src="../resources/imgs/tier/platinum.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'gold') }">
								<div class="user-info"><img src="../resources/imgs/tier/gold.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'silver') }">
								<div class="user-info"><img src="../resources/imgs/tier/silver.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'bronze') }">
								<div class="user-info"><img src="../resources/imgs/tier/bronze.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'iron') }">
								<div class="user-info"><img src="../resources/imgs/tier/iron.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'unranked') }">
								<div class="user-info"><img src="../resources/imgs/tier/unranked.png" id="tier-img"></div>
							</c:if>
						<span class="writer-info-separator">|</span>
					
							<!-- <%-- ${fn:toUpperCase(${fn:substring(tier, 0, 1) })} --%> -->
							
							<c:if test="${fn:endsWith(tier,'1') }">
								<div class="user-info"><c:out value="${fn:substringBefore(tier, '1') }" />&nbsp;I</div>
							</c:if>
						
							<c:if test="${fn:endsWith(tier,'2') }">
								<div class="user-info"><c:out value="${fn:substringBefore(tier, '2') }" />&nbsp;II</div>
							</c:if>
						
							<c:if test="${fn:endsWith(tier,'3') }">
								<div class="user-info"><c:out value="${fn:substringBefore(tier, '3') }" />&nbsp;III</div>
							</c:if>
						
							<c:if test="${fn:endsWith(tier,'4') }">
								<div class="user-info"><c:out value="${fn:substringBefore(tier, '4') }" />&nbsp;IV</div>
							</c:if>
						
						<span class="writer-info-separator">|</span>
						<div class="user-info"><c:out value="${board.writer.site_level }" />&emsp;</div>
						<div class="user-info"><c:out value="${board.writer.summoner_id }" /></div>
						<span class="writer-info-separator">|</span>
						<div class="user-info"><c:out value="${board.writer.honor_rate }" /></div>
						<button class="follow">팔로우</button>
					</div>
					
					<div class="post-info">
						<div class="post-info">맵 분류 : <span class="post-info-detail"><c:out value="${board.game_map }" /></span></div>
						<div class="post-info">게임 분류 : <span class="post-info-detail"><c:out value="${board.game_mode }" /></span></div>
						<div class="post-info">모집인원 : <span class="post-info-detail"><c:out value="${board.cru_pre } / ${board.cru_max }" /></span></div>
						<div class="post-info">작성날짜 : <c:out value="${board.board_date }" /></div>
						<button class="report" onclick="">신고</button>
					</div>
					
				</div>
			</div>
			
			<hr>
			
			<div><span id="post-content"><c:out value="${board_view_reply.reply_count }" />${board.board_text }</span></div>
			
			<!-- 이건 c if문으로, session의 user_no가 글쓴이의 user_no와 같을 때만 보여주기  -->
			<div id="writer-post-button">
				<a class="detail-big-btn modify-post" href="../board_detail/updateBoard.do?post_no=<c:out value="${board.post_no }"/>"style=" padding-left: 20px; padding-right: 20px;">수정</a>
				<button class="detail-big-btn" onclick="confirmDelete()">삭제</button>
			</div>
		</div>
		
		<hr>
		
		<div class="reply_wrap">
			<div id="reply-header"><img src="../resources/imgs/post_detail/message.png" id="message-img">댓글 <c:out value="${board_view_reply.reply_count }" /></div>
			<div id="reply-content">
				<c:forEach var="reply" items="${reply}">
					<div class="reply-content-repeat">
						<div class="user-info">
							
							<c:set var="tier" value="${reply.replier.solo_rank_tier }"/>
							<!-- 이걸 더 예쁘게 줄이는 방법이 있을 거 같은데... -->
							<c:if test="${fn:contains(tier,'challenger') }">
								<div class="user-info"><img src="../resources/imgs/tier/challenger.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'grandmaster') }">
								<div class="user-info"><img src="../resources/imgs/tier/grand_master.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'master') }">
								<div class="user-info"><img src="../resources/imgs/tier/master.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'diamond') }">
								<div class="user-info"><img src="../resources/imgs/tier/diamond.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'platinum') }">
								<div class="user-info"><img src="../resources/imgs/tier/platinum.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'gold') }">
								<div class="user-info"><img src="../resources/imgs/tier/gold.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'silver') }">
								<div class="user-info"><img src="../resources/imgs/tier/silver.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'bronze') }">
								<div class="user-info"><img src="../resources/imgs/tier/bronze.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'iron') }">
								<div class="user-info"><img src="../resources/imgs/tier/iron.png" id="tier-img"></div>
							</c:if>
							
							<c:if test="${fn:contains(tier,'unranked') }">
								<div class="user-info"><img src="../resources/imgs/tier/unranked.png" id="tier-img"></div>
							</c:if>
							
							<span class="replier-info-separator">|</span>
							
							<c:if test="${fn:endsWith(tier,'1') }">
								<div class="user-info"><c:out value="${fn:substringBefore(tier, '1') }" />&nbsp;I</div>
							</c:if>
						
							<c:if test="${fn:endsWith(tier,'2') }">
								<div class="user-info"><c:out value="${fn:substringBefore(tier, '2') }" />&nbsp;II</div>
							</c:if>
						
							<c:if test="${fn:endsWith(tier,'3') }">
								<div class="user-info"><c:out value="${fn:substringBefore(tier, '3') }" />&nbsp;III</div>
							</c:if>
						
							<c:if test="${fn:endsWith(tier,'4') }">
								<div class="user-info"><c:out value="${fn:substringBefore(tier, '4') }" />&nbsp;IV</div>
							</c:if>
							
							<span class="replier-info-separator">|</span>
							<div class="user-info">${reply.replier.site_level }&emsp;</div>
							<div class="user-info">${reply.replier.summoner_id }</div>
							<span class="replier-info-separator">|</span>
							<div class="user-info">${reply.replier.honor_rate }</div>
							<button class="follow">팔로우</button>
							<span id="reply-date">( <c:out value="${reply.re_date }" /> )</span>
							<button class="report">신고</button>
						</div>
						
						<div>
							<span class="reply-content"><c:out value="${reply.re_text }" /></span>
							<!-- <button class="detail-small-btn delete-reply">삭제</button> -->
							<!-- <form action="" method="post" onsubmit="return checkUser()" id="user-check-form"> -->
								<button id="select-user-to-play-with" type="submit"><img src="../resources/imgs/post_detail/unchecked.png" id="check-img" onclick="checkUser()"></button>
							<!-- </form> -->
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="new-reply">
				<form method="post" action="insertReply.do">
					<input type="hidden" name="post_no" value=${board.post_no }>
					<input type="text" name="re_text" placeholder="내용을 작성하세요." id="new-reply-text">
					<button type="submit" class="detail-big-btn submit-reply">작성</button>				
				</form>
			</div>
		</div>
		
	</div>
	
	<br><hr>
	
	<%@ include file="/WEB-INF/views/basic/footer.jsp" %>

</body>
</html>