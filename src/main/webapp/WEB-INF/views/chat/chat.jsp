<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
int id_1 = (int)1;
int id_2 = (int)2;
int id_3 = (int)3;
%>
<html>
<head>
    <meta charset="utf-8">
    <title>채1방2</title>
    <meta content="Templines" name="author">
    <meta content="TeamHost" name="description">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="HandheldFriendly" content="true">
    <meta name="format-detection" content="telephone=no">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
<!--     <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon"> -->
    <link rel="stylesheet" href="/resources/css/libs.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<style>
/* 보내는 사람 */
.total_my_div {
	width: 100%;
	height: auto;
	display: flex;
	flex-direction: row-reverse;
    align-items: flex-end;
}

.total_you_div {
	width: 100%;
	height: auto;
	display: flex;
}

.total_you_thir_div{
	display: flex;
	flex-direction: column;
}

.total_you_sec_div{
	display: flex;
}

.you_img_div {
	width: 45px;
	height: 45px;
	margin-right: 7px;
	margin-top: 3px;
}

.profile_img {
	border-radius: 30px;
}

.you_name_p {
	margin-left: 3px;
}


.total_my_div::after {
	clear: both;
}

.total_you_div::after {
	clear: both;
}

.clock_my_div {
	width: 33px;
	float: right;
	color: black;
	margin-bottom: 5px;
	font-size: 12px;
}

.clock_you_div {
	display: flex;
	width: 33px;
	float: right;
	color: black;
	margin-bottom: 5px;
	margin-left: 5px;
	font-size: 12px;
	flex-direction: column-reverse;
}


.message_my{
/* 	text-align: right; */
/* 	display:inline-block; */
/* 	clear:both; */
	float:right;
	font-size: 15px;
/* 	text-align: right; */
/* 	border: 1px solid black; */
	padding: 10px 15px 10px 15px;
	border-radius: 10px;
	background-color: #f46119;
	max-width: 300px;
	word-wrap: break-word;
	margin-top: 3px;
	margin-bottom: 3px;
	color: white;
	position: relative;
	
}

.message_you{
	display:inline-block;
	clear:both;
	float:left;
	font-size: 15px;
	padding: 10px 15px 10px 15px;
	border-radius: 10px;
	background-color: rgb(245,245,245);
	max-width: 400px;
	word-wrap: break-word;
	margin-top: 3px;
	margin-bottom: 3px;
}

</style>
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
                                <div class="chat-user-list__search">
                                    <div class="search">
                                        <div class="search__input"><i class="ico_search"></i><input type="search" name="search" placeholder="Search"></div>
                                    </div>
                                </div>
                                
                                
                                <div class="chat-user-list__body">
                                    <ul>
                                        <li>
                                            <div class="user-item --active">
                                                <div class="user-item__avatar"><img src="assets/img/user-list-1.png" alt="user"></div>
                                                <div class="user-item__desc">
                                                    <div class="user-item__name"><a href="chatBronze.do?user_no=<%= request.getParameter("user_no") %>&summoner_id=<%= request.getParameter("summoner_id") %>&ban=<%= request.getParameter("ban") %>&id=<%=id_1%>">Iron Bronze Silver</a></div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="user-item --active">
                                                <div class="user-item__avatar"><img src="assets/img/user-list-2.png" alt="user"></div>
	                                                <div class="user-item__desc">
	                                                    <div class="user-item__name"><a href="chatGold.do?user_no=<%= request.getParameter("user_no") %>&summoner_id=<%= request.getParameter("summoner_id") %>&ban=<%= request.getParameter("ban") %>&id=<%=id_1%>">Gold Platinum Diamond</a></div>
	                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="user-item">
                                                <div class="user-item__avatar"><img src="assets/img/user-list-3.png" alt="user"></div>
                                                <div class="user-item__desc">
                                                    <div class="user-item__name"><a href="chatMaster.do?user_no=<%= request.getParameter("user_no") %>&summoner_id=<%= request.getParameter("summoner_id") %>&ban=<%= request.getParameter("ban") %>&id=<%=id_1%>">Master GrandMaster Challenger</a></div>
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
<!--          </div> -->
<%@ include file="/WEB-INF/views/basic/footer.jsp" %>
</body>
</html>