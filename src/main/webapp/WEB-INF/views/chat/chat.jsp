<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>채2방2</title>
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
.total_test_div {
	display:inline-block;
	width: 100%;
	height: auto;
	display: flex;
	flex-direction: row-reverse;
    align-items: flex-end;}

.total_test_div::after {
	clear: both;
}

.clock_test_div {
	width: 33px;
	float:right;
	color: black;
	margin-bottom: 5px;
	font-size: 12px;
	
}


.pTag_my{
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

.pTag_you{
	display:inline-block;
	clear:both;
	float:left;
	font-size: 15px;
/* 	border: 1px solid black; */
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
                                                    <div class="user-item__name">Iron Bronze Silver</div>
<%--                                                     <div>${profile_icon}</div> --%>
<!--                                                     <div class="user-item__text">Let’s play now!</div> -->
                                                </div>
<!--                                                 <div class="user-item__info"> -->
<!--                                                     <div class="user-item__time">4m</div> -->
<!--                                                     <div class="user-item__count">1</div> -->
<!--                                                 </div> -->
                                            </div>
                                        </li>
                                        <li>
                                            <div class="user-item --active">
                                                <div class="user-item__avatar"><img src="assets/img/user-list-2.png" alt="user"></div>
	                                                <div class="user-item__desc">
	                                                    <div class="user-item__name">Gold Platinum Diamond</div>
<!-- 	                                                    <div class="user-item__text">Are you here?</div> -->
	                                                </div>
<!--                                                 <div class="user-item__info"> -->
<!--                                                     <div class="user-item__time">10m</div> -->
<!--                                                     <div class="user-item__count">2</div> -->
<!--                                                 </div> -->
                                            </div>
                                        </li>
                                        <li>
                                            <div class="user-item">
                                                <div class="user-item__avatar"><img src="assets/img/user-list-3.png" alt="user"></div>
                                                <div class="user-item__desc">
                                                    <div class="user-item__name">Master GrandMaster Challenger</div>
<!--                                                     <div class="user-item__text">You: Good I will wait you in the ga...</div> -->
                                                </div>
<!--                                                 <div class="user-item__info"> -->
<!--                                                     <div class="user-item__time">1h</div> -->
<!--                                                 </div> -->
                                            </div>
                                        </li>
                                    </ul>
                                </div>          
                            </div>
                        </div>
                    </div>
                    
                    
                    <!-- 채팅 대화목록 -->
                    <div class="uk-width-2-3@l" style="width: 600px; height: 600px; margin-top: 7%;">
                        <div class="chat-messages-box">
                            <div class="chat-messages-head">
									<span>접속한 티어 방 이름</span>
                            </div>
                            
                            <!-- 대화 오고가는 곳 -->
                            <div class="chat-messages-body">
                                <div id="messageArea">
                                	<!-- 메시지 append 되는 구간 -->
                                </div>
                            </div>
                            <!-- 대화 오고가는 곳 end-->
                            
                            <!-- 메시지 보내는 submit -->
                            <div class="chat-messages-footer">
<!--                                 <form action="#!"> -->
                                    <div class="chat-messages-form">
                                        <div class="chat-messages-form-btns">
                                        	<button class="ico_emoji-happy"></button>
                                        	<button class="ico_gallery"></button></div>
                                        <div class="chat-messages-form-controls">
                                        
                                        	<!-- 메시지 보내는 textbox -->
                                        	<input class="chat-messages-input" type="text" placeholder="메시지를 입력해주세요." id="message">
                                        	<input type="button" id="sendBtn" value="보내기"/>
                                        </div>
                                        <div class="chat-messages-form-btn">
                                        	<button class="ico_microphone" type="button"></button>
                                        </div>
                                    </div>
<!--                                 </form> -->
                            </div>
                            <!-- 메시지 보내는 submit end -->
                        </div>
                    </div>
                    
                    
                </div>
            </main>
<!--          </div> -->
<%@ include file="/WEB-INF/views/basic/footer.jsp" %>
</body>
<script type="text/javascript">
	$("#sendBtn").click(function() {
		if($('#message').val() == ''){
			return false;
		}
		sendMessage();
		$('#message').val('')
	});
// 	let sock = new SockJS("<c:url value="/echo"/>");
	sock = new SockJS("http://192.168.1.82:8080/chat/echo");
// 	sock = new SockJS("localhost:8080/chat/echo");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	
	// 메시지 전송
	function sendMessage() {
		var summoner_id = '${summoner_id}';
		
		sock.send(summoner_id + " : " + $("#message").val());
	}
	
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		// 컨트롤러에서 가져온 summoner_id
		var summoner_id = '${summoner_id}';
		
		
		
		let [a, b]  = data.split(" : "); // :기준으로 a-소환사ID  b-내용

		
		let messageArea = document.getElementById('messageArea');
		let new_pTag_my = document.createElement('div');
		let new_pTag_you = document.createElement('div');
		
		let total = document.createElement('div');
		let clock = document.createElement('div');
		
		if(summoner_id == a) {
			// 일치
// 			messageArea.append("꾹");
			total.setAttribute('class', 'total_test_div');
			clock.setAttribute('class', 'clock_test_div');
			new_pTag_my.setAttribute('class', 'pTag_my');
			
			// 현재 시간 구하기
			let today = new Date();
			let hour = today.getHours();
			let minutes = today.getMinutes()

			// 현재 시간 구하기2
			let time = today.toLocaleTimeString()
			
			clock.innerHTML = hour + ":" + minutes;
			new_pTag_my.innerHTML = b;
			
			messageArea.appendChild(total)
			
			total.appendChild(new_pTag_my);
			total.appendChild(clock);
			
			alert("내 아이디 : " + a);
			
		} else {
			// 불일치
			new_pTag_you.setAttribute('class', 'pTag_you');
			new_pTag_you.innerHTML = data;
			messageArea.appendChild(new_pTag_you);
			
			alert("상대방 아이디 : " + a);
		}
		
		
	}
	
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");

	}
</script>
</html>