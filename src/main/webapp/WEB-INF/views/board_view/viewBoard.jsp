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
    <link rel="shortcut icon" href="/resources/imgs/favicon.png" type="image/x-icon">
    
</head>
<body>
	<%@ include file="/WEB-INF/views/basic/header.jsp" %>
	
	<!-- 라이터 넘버로 관리자 여부 보는 게 아니라 ban 넘버로 보기 -->
	<div class="modal-bg">
		<div class="modal">
			<h3 class="modal-title">신고 작성</h3>
			신고 제목 : <input type="text" name="report_title" id="report-title">
			신고 내용 : <textarea name="report_content" id="report-content" style="color: black;"></textarea>
			<input type="hidden" name="report_target" id="report-target" value="">
			<button id="submitReport">신고하기</button>
			<span class="modal-close">&times;</span>
		</div>
	</div>

	<div class="post-wrap">
		<div class="post-content">
			<div class="post-header">
				<!-- 포스트 넘버 임의로 줌 -->
				<input type="hidden" name="post_no" value=<c:out value="${board.post_no }" /> id="post-no">
				<h1 class="post-header-top"><c:out value="${board.board_title }" /></h1>
				<input type="hidden" value=<c:out value="${board.writer.user_no }" /> id="writer-no"/>
				<div class="post-header-bottom">
					<c:if test="${board.writer.user_no != 10028}">
					
						<div class="user-info writer-info">
							<div class="user-info">
								<c:if test="${board.game_mode == '일반' or board.game_mode == '솔로 랭크' or board.game_map == '칼바람 나락'}">
									<img src="../resources/imgs/tier/${board.writer.solo_tier}.png" class="tier-img">
								</c:if>
								
								<c:if test="${board.game_mode == '자유 랭크'}">
									<img src="../resources/imgs/tier/${board.writer.free_tier}.png" class="tier-img">
								</c:if>					
							</div>
							<span class="writer-info-separator">|</span>
							<div class="user-info"><c:out value="${fn:toUpperCase(board.writer.solo_tier) } ${board.writer.solo_tier_grade }" /></div>
							
							<span class="writer-info-separator">|</span>
							<div class="user-info"><img src="../resources/imgs/level_icon/${board.writer.site_level}.gif">&emsp;</div>
							<div class="user-info"><c:out value="${board.writer.summoner_id }" /></div>
							<span class="writer-info-separator">|</span>
							<div class="user-info"><c:out value="${board.writer.honor_rate }" /></div>
							
						    <c:if test="${sessionScope.user_no != board.writer.user_no}">
						    
						    	<c:set var="loopOver" value="false"/>
								<c:forEach var="friend" items="${friends}">
								
							     <%-- loopOver가 반대가 되면 break --%>
							     	<c:if test="${not loopOver}">
							       	 	<c:choose>
							       	 		<%-- 내가 상대에게 최초로 친추를 했을 때 --%>
								          	<c:when test="${friend.friend eq board.writer.summoner_id}">
								          		<c:choose>
										        	<c:when test="${friend.status =='수락'}">
														<button class="friend-btn chg-friend-status" action="deleteFriend" value="${board.writer.summoner_id}">친구 삭제</button>
								           				<c:set var="loopOver" value="true" />
								           			</c:when>
										        	<c:when test="${friend.status =='차단'}">
														<button class="friend-btn falseBefriend" onclick="alert('친구 신청이 완료되었습니다.')">친구 추가</button>
								           				<c:set var="loopOver" value="true" />
								           			</c:when>
										        	<c:when test="${friend.status =='대기'}">
														<button class="friend-btn chg-friend-status" action="cancelFriendRequest" value="${board.writer.summoner_id}">대기 중</button>
								           				<c:set var="loopOver" value="true" />
								           			</c:when>
										        	<c:when test="${friend.status =='거절'}">
														<button class="friend-btn chg-friend-status" action="befriendAgain" value="${board.writer.summoner_id}">친구 추가</button>
								           				<c:set var="loopOver" value="true" />
								           			</c:when>
										        	<c:when test="${empty friend.status}">
														<button class="friend-btn chg-friend-status" action="befriendAgain" value="${board.writer.summoner_id}">친구 추가</button>
								           				<c:set var="loopOver" value="true" />
								           			</c:when>
										        </c:choose>
								           	</c:when>
								           	
							       	 		<%-- 상대가 내게 최초로 친추를 했을 때 --%>
								           	<c:when test="${friend.user_no eq board.writer.user_no}">
								          		<c:choose>
										        	<c:when test="${friend.status =='수락'}">
														<button class="friend-btn chg-friend-status" action="deleteFriend" value="${board.writer.user_no }">친구 삭제</button>
								           				<c:set var="loopOver" value="true" />
								           			</c:when>
								           			<%--내가 상대를 차단함 --%>
										        	<c:when test="${friend.status =='차단'}">
														<button class="friend-btn chg-friend-status" action="cancelBan" value="${board.writer.user_no }">차단 풀기</button>
								           				<c:set var="loopOver" value="true" />
								           			</c:when>
										        	<c:when test="${friend.status =='대기'}">
														<button class="friend-btn chg-friend-status" action="acceptFriendRequest" value="${board.writer.user_no}">친구 수락</button>
								           				<c:set var="loopOver" value="true" />
								           			</c:when>
										        	<c:when test="${friend.status =='거절'}">
														<button class="friend-btn chg-friend-status" action="befriendAgain" value="${board.writer.user_no }">친구 추가</button>
								           				<c:set var="loopOver" value="true" />
								           			</c:when>
										        	<c:when test="${empty friend.status}">
														<button class="friend-btn chg-friend-status" action="befriendAgain" value="${board.writer.user_no}">친구 추가</button>
								           				<c:set var="loopOver" value="true" />
								           			</c:when>
										        </c:choose>
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
							<div class="post-info">맵 분류 : <span class="post-info-detail"><c:out value="${board.game_map }" /></span></div>
							<div class="post-info">게임 분류 : <span class="post-info-detail"><c:out value="${board.game_mode }" /></span></div>
							<div class="post-info">플레이 인원 : <span class="post-info-detail"><c:out value="${board.cru_pre } / ${board.cru_max }" /></span></div>
							<input type="hidden" id="cru-max" value=" ${board.cru_max }">
							<div class="post-info">작성날짜 : <c:out value="${board.board_date }" /></div>
							<c:if test="${sessionScope.user_no != board.writer.user_no }">
								<button class="report-btn" value="${board.writer.user_no }">신고</button>
							</c:if>
						</div>
						
					</c:if>
				</div>
			</div>
			
			<hr>
			
			<div><span id="post-content"><c:out value="${board_view_reply.reply_count }" />${board.board_text }</span></div>
			
			<c:if test="${sessionScope.user_no == board.writer.user_no }">
				<div id="writer-post-button">
					<a class="detail-big-btn modify-post" href="../board_detail/updateBoard.do?post_no=<c:out value="${board.post_no }"/>" style=" padding-left: 20px; padding-right: 20px;">수정</a>
					<form method="post" action="../board_detail/postDelete.do?post_no=<c:out value="${board.post_no }"/>" style="display: inline-block;" onsubmit="return confirmPostDelete()">
						<button class="detail-big-btn" type="submit">삭제</button>
					</form>
				</div>
			</c:if>
		</div>
		
		<div class="chosen-user-list" style="display: hidden;">
			<c:forEach items="${choice}" var="choiceList">
				<input value="<c:out value="${choiceList }" />" class="chosen-users">
			</c:forEach>
		</div>
		
		<div class="session-info">
			<input id="session-user-no" value="<c:out value="${sessionScope.user_no }"/>">
			<input id="session-summoner-id" value="<c:out value="${sessionScope.summoner_id }"/>">
		</div>
		
		<!-- 관리자가 쓴 글에서는 댓글 작성/조회 불가 -->
		<c:if test="${board.writer.user_no != 10028}">
			<hr>
			<div class="reply_wrap">
				<div id="reply-header"><img src="../resources/imgs/post_detail/message.png" id="message-img">댓글 <c:out value="${board.reply_amount }" /></div>
				<div id="reply-content">
					<c:forEach var="reply" items="${reply}">
						<div class="reply-content-repeat">
							<input class="user_re_no" value=${reply.user_no }>
							<div class="user-info">
								
								<div class="user-info">
									<c:if test="${board.game_mode == '일반' or board.game_mode == '솔로 랭크' or board.game_map == '칼바람 나락'}">
										<img src="../resources/imgs/tier/${reply.replier.solo_tier}.png" class="tier-img">
									</c:if>
									
									<c:if test="${board.game_mode == '자유 랭크'}">
										<img src="../resources/imgs/tier/${reply.replier.free_tier}.png" class="tier-img">
									</c:if>
								</div>
								<span class="replier-info-separator">|</span>
								<div class="user-info">&nbsp;<c:out value="${fn:toUpperCase(reply.replier.solo_tier) } ${reply.replier.solo_tier_grade }" /></div>
								<span class="replier-info-separator">|</span>
								<div class="user-info"><img src="../resources/imgs/level_icon/${reply.replier.site_level}.gif">&emsp;</div>
								<div class="user-info">${reply.replier.summoner_id }</div>
								<span class="replier-info-separator">|</span>
								<div class="user-info">${reply.replier.honor_rate }</div>
								
							    <c:if test="${sessionScope.user_no != reply.user_no}">
							    
							    	<c:set var="loopOver" value="false"/>
									<c:forEach var="friend" items="${friends}">
									
								     <%-- loopOver가 반대가 되면 break --%>
								     	<c:if test="${not loopOver}">
								       	 	<c:choose>
								       	 		<%-- 내가 상대에게 최초로 친추를 했을 때 --%>
									          	<c:when test="${friend.friend eq reply.replier.summoner_id}">
									          		<c:choose>
											        	<c:when test="${friend.status =='수락'}">
															<button class="friend-btn chg-friend-status" action="deleteFriend" value="${reply.replier.summoner_id }">친구 삭제</button>
									           				<c:set var="loopOver" value="true" />
									           			</c:when>
											        	<c:when test="${friend.status =='차단'}">
															<button class="friend-btn falseBefriend" onclick="alert('친구 신청이 완료되었습니다.')">친구 추가</button>
									           				<c:set var="loopOver" value="true" />
									           			</c:when>
											        	<c:when test="${friend.status =='대기'}">
															<button class="friend-btn chg-friend-status" action="cancelFriendRequest" value="${reply.replier.summoner_id }">대기 중</button>
									           				<c:set var="loopOver" value="true" />
									           			</c:when>
											        	<c:when test="${friend.status =='거절'}">
															<button class="friend-btn chg-friend-status" action="befriendAgain" value="${reply.replier.summoner_id }">친구 추가</button>
									           				<c:set var="loopOver" value="true" />
									           			</c:when>
											        	<c:when test="${empty friend.status}">
															<button class="friend-btn chg-friend-status" action="befriendAgain" value="${reply.replier.summoner_id }">친구 추가</button>
									           				<c:set var="loopOver" value="true" />
									           			</c:when>
											        </c:choose>
									           	</c:when>
									           	
								       	 		<%-- 상대가 내게 최초로 친추를 했을 때 --%>
									           	<c:when test="${friend.user_no eq reply.replier.user_no}">
									          		<c:choose>
											        	<c:when test="${friend.status =='수락'}">
															<button class="friend-btn chg-friend-status" action="deleteFriend" value="${reply.user_no }">친구 삭제</button>
									           				<c:set var="loopOver" value="true" />
									           			</c:when>
									           			<%--내가 상대를 차단함 --%>
											        	<c:when test="${friend.status =='차단'}">
															<button class="friend-btn chg-friend-status" action="cancelBan" value="${reply.user_no }">차단 풀기</button>
									           				<c:set var="loopOver" value="true" />
									           			</c:when>
											        	<c:when test="${friend.status =='대기'}">
															<button class="friend-btn chg-friend-status" action="acceptFriendRequest" value="${reply.user_no }">친구 수락</button>
									           				<c:set var="loopOver" value="true" />
									           			</c:when>
											        	<c:when test="${friend.status =='거절'}">
															<button class="friend-btn chg-friend-status" action="befriendAgain" value="${reply.user_no }">친구 추가</button>
									           				<c:set var="loopOver" value="true" />
									           			</c:when>
											        	<c:when test="${empty friend.status}">
															<button class="friend-btn chg-friend-status" action="befriendAgain" value="${reply.user_no }">친구 추가</button>
									           				<c:set var="loopOver" value="true" />
									           			</c:when>
											        </c:choose>
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
								
								<!-- 본인이 작성한 댓글이면 삭제 버튼이, 아니면 신고 버튼이 보임. -->
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
								<c:if test="${sessionScope.user_no == board.writer.user_no }">
									<button class="choose-user">
										<img src="../resources/imgs/post_detail/unchecked.png" class="check-img" value="${reply.user_no }">
									</button>
								</c:if>
							</div>
						</div>
					</c:forEach>
				</div>
				
				<!-- 글쓴이는 댓글 작성 불가 -->
				<c:if test="${sessionScope.user_no != board.writer.user_no }">
					<div id="new-reply">
						<form method="post" action="insertReply.do" onsubmit="return checkReplyValidation();">
							<input type="hidden" name="post_no" value=${board.post_no }>
							<input type="text" name="re_text" placeholder="내용을 작성하세요." id="new-reply-text">
							<button type="submit" class="detail-big-btn submit-reply">작성</button>				
						</form>
					</div>
				</c:if>
			</div>
		</c:if>
	</div>
	
	<%@ include file="/WEB-INF/views/basic/footer.jsp" %>

</body>
    <script src="../resources/js/post_detail.js?ver=3" type="text/javascript"></script>
</html>