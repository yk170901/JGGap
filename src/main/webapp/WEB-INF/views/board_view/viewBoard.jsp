<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ㅈㄱㅊㅇ - 구인글 조회</title>
    <link href="../resources/css/post_detail.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="/resources/imgs/favicon.ico" type="image/x-icon">
</head>
<body>
	<%@ include file="/WEB-INF/views/basic/header.jsp" %>
	<hr>
	<%--신고 모달 --%>
	<div class="modal-bg">
		<div class="modal">
			<h3 class="modal-title">신고 작성</h3>
			<input type="text" name="report_title" id="report-title" placeholder="제목을 적어주세요" maxlength="30">
			<textarea name="report_content" id="report-content" style="color: black;" placeholder="내용을 적어주세요" maxlength="330"></textarea>
			<input type="hidden" name="report_target" id="report-target" value="">
			<button id="submitReport">신고하기</button>
			<span class="modal-close">&times;</span>
		</div>
	</div>

	<div class="post-wrap">
		<div class="post-content">
			<div class="post-header">
				<h1 class="post-header-top"><c:out value="${board.board_title }" /></h1>
				<input type="hidden" name="post_no" value=<c:out value="${board.post_no }" /> id="post-no">
				
				<input type="hidden" value=<c:out value="${board.writer.user_no }" /> id="writer-no"/>
				<div class="post-header-bottom">
					<div class="user-info writer-info">
						<div class="user-info">
							<c:if test="${board.game_mode == '일반' or board.game_mode == '솔로 랭크' or board.game_map == '칼바람 나락'}">
								<img src="../resources/imgs/tier/${board.writer.solo_tier}.png" class="tier-img">
								<span class="writer-info-separator">|</span>
								<div class="user-info"><c:out value="${board.writer.solo_tier } ${board.writer.solo_tier_grade }" /></div>
							</c:if>
							
							<c:if test="${board.game_mode == '자유 랭크'}">
								<img src="../resources/imgs/tier/${board.writer.free_tier}.png" class="tier-img">
								<span class="writer-info-separator">|</span>
								<div class="user-info"><c:out value="${board.writer.free_tier } ${board.writer.free_tier_grade }" /></div>
							</c:if>					
						</div>
						<span class="writer-info-separator">|</span>
						<div class="user-info"><img src="../resources/imgs/level_icon/${board.writer.site_level}.gif">&emsp;</div>
						<div class="user-info"><a class="user-record-link" href="/record/record.do?user_no=${board.writer.user_no}"><c:out value="${board.writer.summoner_id }" /></a></div>
						<span class="writer-info-separator">|</span>
						<div class="user-info"><c:out value="${board.writer.honor_rate }" /></div>
						
						
						<%-- 글 작성자에게는 본인 친구추가 버튼이 안 보임--%>
					    <c:if test="${sessionScope.user_no != board.writer.user_no}">
					    
					    	<c:set var="loopOver" value="false"/>
							<c:forEach var="friend" items="${friends}">
							
						     <%-- loopOver가 반대가 되면 break --%> 
							     	<c:if test="${not loopOver}">
							       	 	<c:choose>
								           	<c:when test="${friend.user_no eq sessionScope.user_no and friend.friend == board.writer.summoner_id}">
								          		<c:choose>
										        	<c:when test="${friend.status =='친구'}">
														<button class="friend-btn chg-friend-status" action="deleteFriend" value="${board.writer.summoner_id }" style="background-color: #f46119; color: white;">친구 삭제</button>
								           				<c:set var="loopOver" value="true" />
								           			</c:when>
								           			<%--내가 상대를 차단함 --%>
										        	<c:when test="${friend.status =='차단'}">
														<button class="friend-btn chg-friend-status" action="cancelBan" value="${board.writer.summoner_id }" style="color: red;">차단 풀기</button>
								           				<c:set var="loopOver" value="true" />
								           			</c:when>
										        	<c:when test="${friend.status =='대기'}">
														<button class="friend-btn chg-friend-status" action="cancelFriendRequest" value="${board.writer.summoner_id }" style="background-color: #f46119; color: white;">대기 중</button>
								           				<c:set var="loopOver" value="true" />
								           			</c:when>
										        </c:choose>
								           	</c:when>
								        	<%--상대방이 내게 친구 신청을 걸었는데 내가 아직 응답하지 않았을 때 --%>
								        	<c:when test="${friend.user_no eq board.writer.user_no and friend.friend == sessionScope.summoner_id and status=='대기'}">
													<button class="friend-btn chg-friend-status" action="acceptFriendRequest" value="${board.writer.summoner_id}" style="color: gold;">친구 수락</button>
						           				<c:set var="loopOver" value="true" />
						           			</c:when>
							       		</c:choose>
							    	</c:if>
								</c:forEach>
						    	
				       	 		<%-- 친추한 적이 없거나 친구삭제/차단해제 등을 해서 무관한 관계가 되었을 때 --%>
						     	<c:if test="${not loopOver}">
									<button class="friend-btn befriend" value="${board.writer.summoner_id }">친구 추가</button>
						     	</c:if>
					     	
						</c:if>
					</div>
					
					<div class="post-info">
						<div class="post-info">맵 분류&nbsp;&nbsp;:&nbsp;&nbsp;<span class="post-info-detail"><c:out value="${board.game_map }" /></span></div>
						<c:if test="${board.game_map eq '소환사의 협곡' }">						
							<div class="post-info">게임 분류&nbsp;&nbsp;:&nbsp;&nbsp;<span class="post-info-detail"><c:out value="${board.game_mode }" /></span></div>
						</c:if>
						<input value="${board.cru_pre }">
						<div class="post-info">플레이 인원&nbsp;&nbsp;:&nbsp;&nbsp;<span class="post-info-detail"><span id="cru-pre">${board.cru_pre }</span> / ${board.cru_max }</span></div>
						<input type="hidden" id="cru-max" value=" ${board.cru_max }">
						<div class="post-info">작성날짜&nbsp;&nbsp;:&nbsp;&nbsp;<span class="post-info-detail" style="color: black;"><c:out value="${board.board_date }" /></span></div>
						
						<%--글 작성자에게는 작성자 신고 버튼이 안 보임 --%>
						<c:if test="${sessionScope.user_no != board.writer.user_no }">
							<button class="report-btn" value="${board.writer.user_no }">신고</button>
						</c:if>
					</div>
				</div>
			</div>
			
			<hr>
			
			<div><span id="post-content">${board.board_text }</span></div>
			
			<%--작성자에게만 글 수정/삭제 버튼이 보임 --%>
			<c:if test="${sessionScope.user_no == board.writer.user_no }">
				<div id="writer-post-button">
					<a class="detail-big-btn modify-post" href="../board_detail/updateBoard.do?post_no=<c:out value="${board.post_no }"/>" style=" padding-left: 20px; padding-right: 20px;">수정</a>
					<button class="detail-big-btn" id="delete-post" style="display: inline-block;">삭제</button>
				</div>
			</c:if>
		</div>
		
		<div class="chosen-user-list" hidden="hidden">
			<c:forEach items="${choice}" var="choiceList">
				<input value="<c:out value="${choiceList }" />" class="chosen-users">
			</c:forEach>
		</div>
		
		<div class="session-info" hidden="hidden">
			<input id="session-user-no" value="<c:out value="${sessionScope.user_no }"/>">
			<input id="session-summoner-id" value="<c:out value="${sessionScope.summoner_id }"/>">
		</div>
		<hr>
		<div class="reply_wrap">
			<div id="reply-header" style="font-weight:bold;"><img src="../resources/imgs/post_detail/message.png" id="message-img">댓글 <c:out value="${board.reply_amount }" /></div>
			<div id="reply-content">
				<c:forEach var="reply" items="${reply}">
					<div class="reply-content-repeat">
						<input class="user_re_no" value=${reply.user_no } type="hidden">
						<div class="user-info">
							
							<div class="user-info">
								<c:if test="${board.game_mode == '일반' or board.game_mode == '솔로 랭크' or board.game_map == '칼바람 나락'}">
									<img src="../resources/imgs/tier/${reply.replier.solo_tier}.png" class="tier-img">
									<span class="replier-info-separator">|</span>
									<div class="user-info">&nbsp;<c:out value="${reply.replier.solo_tier } ${reply.replier.solo_tier_grade }" /></div>
								</c:if>
								
								<c:if test="${board.game_mode == '자유 랭크'}">
									<img src="../resources/imgs/tier/${reply.replier.free_tier}.png" class="tier-img">
									<span class="replier-info-separator">|</span>
									<div class="user-info">&nbsp;<c:out value="${reply.replier.free_tier } ${reply.replier.free_tier_grade }" /></div>
								</c:if>
							</div>
							<span class="replier-info-separator">|</span>
							<div class="user-info"><img src="../resources/imgs/level_icon/${reply.replier.site_level}.gif"></div>
							<div class="user-infolink">&emsp;<a class="user-record-link" href="/record/record.do?user_no=${reply.replier.user_no}">${reply.replier.summoner_id }</a></div>
							<span class="replier-info-separator">|</span>
							<div class="user-info">${reply.replier.honor_rate }</div>
							
							<%--댓글 작성자는 해당 댓글에 있는 본인에 대한 친구추가 버튼이 안 보임 --%>
						    <c:if test="${sessionScope.user_no != reply.user_no}">
						    
								<c:set var="loopOver" value="false"/>
								<c:forEach var="friend" items="${friends}">
								
							     <%-- loopOver가 반대가 되면 break --%>
							     	<c:if test="${not loopOver}">
<%-- 							     	<input value="${friend.user_no / reply.replier.user_no}">
							     	<input value="${friend.friend / sessionScope.summoner_id}">
							     	<input value="${friend.friend / sessionScope.summoner_id}"> --%>
							       	 	<c:choose>
								           	<c:when test="${friend.user_no eq sessionScope.user_no and friend.friend == reply.replier.summoner_id}">
								          		<c:choose>
										        	<c:when test="${friend.status =='친구'}">
														<button class="friend-btn chg-friend-status" action="deleteFriend" value="${reply.replier.summoner_id }" style="background-color: #f46119; color: white;">친구 삭제</button>
								           				<c:set var="loopOver" value="true" />
								           			</c:when>
								           			<%--내가 상대를 차단함 --%>
										        	<c:when test="${friend.status =='차단'}">
														<button class="friend-btn chg-friend-status" action="cancelBan" value="${reply.replier.summoner_id }" style="color: red;">차단 풀기</button>
								           				<c:set var="loopOver" value="true" />
								           			</c:when>
										        	<c:when test="${friend.status =='대기'}">
														<button class="friend-btn chg-friend-status" action="cancelFriendRequest" value="${reply.replier.summoner_id }" style="background-color: #f46119; color: white;">대기 중</button>
								           				<c:set var="loopOver" value="true" />
								           			</c:when>
										        </c:choose>
								           	</c:when>
								        	<%--상대방이 내게 친구 신청을 걸었는데 내가 아직 응답하지 않았을 때 --%>
								        	<c:when test="${friend.user_no eq reply.replier.user_no and friend.friend == sessionScope.summoner_id and friend.status eq '대기'}">
													<button class="friend-btn chg-friend-status" action="acceptFriendRequest" value="${reply.replier.summoner_id}" style="background-color: gold;">친구 수락</button>
						           				<c:set var="loopOver" value="true" />
						           			</c:when>
							       		</c:choose>
							    	</c:if>
								</c:forEach>
						    	
				       	 		<%-- 친추한 적이 없거나 친구삭제/차단해제 등을 해서 무관한 관계가 되었을 때 --%>
						     	<c:if test="${not loopOver}">
									<button class="friend-btn befriend" value="${reply.replier.summoner_id }">친구 추가</button>
						     	</c:if>
						     	
							</c:if>
							
							<span id="reply-date">( <c:out value="${reply.re_date }" /> )</span>
							
							<%-- 본인이 작성한 댓글이면 삭제 버튼이, 아니면 신고 버튼이 보임. --%>
							<c:choose>
							    <c:when test="${sessionScope.user_no != reply.user_no}">
									<button class="report-btn" value="${reply.user_no }">신고</button>
							    </c:when>    
							    <c:otherwise>
									<button class="delete-reply" style="color: red;" value="${reply.user_re_no }">삭제</button>
							    </c:otherwise>
							</c:choose>
							
						</div>
						
						<div>
							<span class="reply-content"><c:out value="${reply.re_text }" /></span>
							<%-- 글 작성자에게만 체크 버튼이 보임 --%>
							<c:if test="${sessionScope.user_no == board.writer.user_no }">
								<button class="choose-user">
									<img src="../resources/imgs/post_detail/unchecked.png" class="check-img" value="${reply.user_no }">
								</button>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<%-- 글쓴이는 댓글 작성 불가 --%>
			<c:if test="${sessionScope.user_no != board.writer.user_no }">
				<div id="new-reply">
					<input type="text" placeholder="내용을 작성하세요." id="new-reply-text">
					<button type="submit" class="detail-big-btn submit-reply">작성</button>
				</div>
			</c:if>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/basic/footer.jsp" %>

</body>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
	<script src="../resources/js/post_view.js?ver=3" type="text/javascript"></script>
</html>