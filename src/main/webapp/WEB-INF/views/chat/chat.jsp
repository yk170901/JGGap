<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>채팅방</title>
    <meta content="Templines" name="author">
    <meta content="TeamHost" name="description">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="HandheldFriendly" content="true">
    <meta name="format-detection" content="telephone=no">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <link rel="stylesheet" href="/resources/css/libs.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/chat.css">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	<script type="text/javascript" src="/resources/js/chat.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="page-chats">
<!-- <div class="page-wrapper"> -->
	<%@ include file="/WEB-INF/views/basic/header.jsp" %>
<!-- 		<div class="page-content"> -->
            <main class="page-main">
            
               <div class="uk-grid uk-grid-small" data-uk-grid>
                	
                	<!-- 채팅방 목록 -->
                    <div class="uk-width-1-3@l" style="margin-left: 23%; margin-top: 7%;">
                        <div class="chat-user-list" style="width: 400px; height: 600px;">
                            <div class="chat-user-list__box">
                                
                                
                                <div class="chat-user-list__body">
                                    <ul>
                                    	<li>
                                    		<div class="user-item --active" style="margin-top: 10px; margin-bottom: 20px;">
                                    			<div class="user-item__desc summoner_id_info">
                                    				<span class="messages_class">메시지</span>
                                    			</div>
                                    		</div>
                                    	</li>
                                        <li class="test_info">
                                            <div class="user-item --active">
                                                <div class="user-item__avatar"><img src="/resources/imgs/tier/UNRANKED.png" alt="user"></div>
                                                <div class="user-item__desc">
                                                    <div class="user-item__name"><a class="context_font" href="javascript:FramesetUn('chatUnrank.do?user_no=<%= request.getParameter("user_no") %>&summoner_id=<%= request.getParameter("summoner_id") %>&ban=<%= request.getParameter("ban") %>&solo_tier=<%= request.getParameter("solo_tier")%>')">언랭크</a></div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="test_info">
                                            <div class="user-item --active">
                                                <div class="user-item__avatar"><img src="/resources/imgs/tier/iron_bronze_silver.png" alt="user"></div>
                                                <div class="user-item__desc">
                                                    <div class="user-item__name"><a class="context_font" href="javascript:FramesetBr('chatBronze.do?user_no=<%= request.getParameter("user_no") %>&summoner_id=<%= request.getParameter("summoner_id") %>&ban=<%= request.getParameter("ban") %>&solo_tier=<%= request.getParameter("solo_tier")%>')">아이언 | 브론즈 | 실버</a></div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="test_info">
                                            <div class="user-item --active">
                                                <div class="user-item__avatar"><img src="/resources/imgs/tier/gold_platinum_diamond.png" alt="user"></div>
	                                                <div class="user-item__desc">
	                                                    <div class="user-item__name"><a class="context_font" href="javascript:FramesetGo('chatGold.do?user_no=<%= request.getParameter("user_no") %>&summoner_id=<%= request.getParameter("summoner_id") %>&ban=<%= request.getParameter("ban") %>&solo_tier=<%= request.getParameter("solo_tier")%>')">골드 | 플래티넘 | 다이아몬드</a></div>
	                                                </div>
                                            </div>
                                        </li>
                                        <li class="test_info">
                                            <div class="user-item">
                                                <div class="user-item__avatar"><img src="/resources/imgs/tier/master_grandmaster_challenger.png" alt="user"></div>
	                                                <div class="user-item__desc">
	                                                    <div class="user-item__name"><a class="context_font" href="javascript:FramesetMa('chatMaster.do?user_no=<%= request.getParameter("user_no") %>&summoner_id=<%= request.getParameter("summoner_id") %>&ban=<%= request.getParameter("ban") %>&solo_tier=<%= request.getParameter("solo_tier")%>')">마스터 | 그랜드마스터 | 챌린저</a></div>
	                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    
                                </div>     
                            </div>
                        </div>
                    </div>
               </div>
           </main>
<%@ include file="/WEB-INF/views/basic/footer.jsp" %>
</body>
</html>