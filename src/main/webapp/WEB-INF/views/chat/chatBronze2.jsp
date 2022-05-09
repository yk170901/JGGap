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
                    
                    
                    
                     <!-- 채팅 대화목록 -->
                    <div class="uk-width-2-3@l" style="width: 600px; height: 600px; margin-top: 7%;">
                        <div class="chat-messages-box">
                            <div class="chat-messages-head" style="padding: 13px;">
									<span style="text-align: center; color: rgb(244, 97, 25); font-weight: bold;">바른 말 고운 말 사용하여주세요!</span>
                            </div>
                            
                            <!-- 대화 오고가는 곳 -->
                            <!-- 스크롤 div -->
                            <div class="chat-messages-body" id="chat">
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
<!--                                         	<button class="ico_emoji-happy"></button> -->
<!--                                         	<button class="ico_gallery"></button></div> -->
												<img src="/resources/imgs/profile_icon/${profile_icon }.png" style="width:45px; height: 45px; border-radius: 30px;">
												&ensp;
                                        <div class="chat-messages-form-controls">
                                        
                                        	<!-- 메시지 보내는 textbox -->
                                        	<input class="chat-messages-input" type="text" placeholder="메시지를 입력해주세요." id="message" size=50>
                                        	
                                        </div>
                                        &ensp;&ensp;
                                        <div>
                                        
                                        <input type="button" id="sendBtn" value="전 송"/>
                                        </div>
<!--                                         <div class="chat-messages-form-btn"> -->
<!--                                         	<button class="ico_microphone" type="button"></button> -->
<!--                                         </div> -->
                                    </div>
<!--                                 </form> -->
                            </div>
                            <!-- 메시지 보내는 submit end -->
                        </div>
                    </div>
                    
                    
                    
                    
                </div>
               </div>
           </main>
<%@ include file="/WEB-INF/views/basic/footer.jsp" %>
</body>
<script type="text/javascript">
	// 프로필 아이콘 숫자 가져오기
	var profile_icon = '${profile_icon}';
	
	$(function() {
		$("#message").on('keydown',function(e) {
			if(e.keyCode == 13) {
				if($('#message').val() == ''){
					return false;
				}
				sendMessage();
				$('#message').val('');
			}
		})
	});
	
	$("#sendBtn").click(function() {
		if($('#message').val() == ''){
			return false;
		}
		sendMessage();
		$('#message').val('')
		document.getElementById("message").focus();
		
		let chat = document.querySelector('#chat');
        chat.scrollTop = chat.scrollHeight;
	});
	
	
// 	let sock = new SockJS("<c:url value="/echo"/>");
	sock = new SockJS("/chat/echo1");
	
// 	sock = new SockJS("localhost:8080/chat/echo");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	
	// 메시지 전송
	function sendMessage() {
		var summoner_id = '${summoner_id}';
		sock.send(profile_icon + " : " + summoner_id + " : " + $("#message").val());
	}
	
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		
		// 컨트롤러에서 가져온 summoner_id
		var summoner_id = '${summoner_id}';	
		let [a, b , c]  = data.split(" : ");
		// a - 프로필 아이콘
		// b - 소환사 id
		// c - 내용
		
		// 메시지를 생성할 div 생성
		let messageArea = document.getElementById('messageArea');
				
		// 본인이 보낼 경우 div 생성
		let total_my = document.createElement('div');
		let clock_my = document.createElement('div');
		let new_pTag_my = document.createElement('div');
		
		// 상대가 보낼 경우 div 생성
		let total_you = document.createElement('div');
		let total_you_sec = document.createElement('div');
		let you_img = document.createElement('div');
		let you_name = document.createElement('div');
		let new_pTag_you = document.createElement('div');
		let clock_you = document.createElement('div');
		let total_you_thir = document.createElement('div');
			
		// 현재 시간 구하기
		var today = new Date();
		var hours = ('0' + today.getHours()).slice(-2);
		var minutes = ('0' + today.getMinutes()).slice(-2);
		
		
		// 조건
		if(summoner_id == b) {
			// 본인이 보낼경우
			total_my.setAttribute('class', 'total_my_div'); // 토탈 div
			clock_my.setAttribute('class', 'clock_my_div'); // 시간
			new_pTag_my.setAttribute('class', 'message_my'); // 내용
			
			clock_my.innerHTML = hours + ":" + minutes;
			new_pTag_my.innerHTML = c; // 내용 넣기
			
			messageArea.appendChild(total_my);
			
			total_my.appendChild(new_pTag_my);
			total_my.appendChild(clock_my);
			
		} else {
				
			// 상대방이 보낼경우
			total_you.setAttribute('class', 'total_you_div'); // 토탈 div
			total_you_sec.setAttribute('class', 'total_you_sec_div'); // 이름+내용 담긴 div
			you_img.setAttribute('class', 'you_img_div'); // 이미지 담긴 값
			you_name.setAttribute('class', 'you_name_p'); // 이름 담긴 값
			new_pTag_you.setAttribute('class', 'message_you'); // 내용
			clock_you.setAttribute('class', 'clock_you_div'); // 시간
			total_you_thir.setAttribute('class', 'total_you_thir_div'); // 시간

			// a-아이디
			// b-받은내용
			you_img.innerHTML = "<img class='profile_img' src=/resources/imgs/profile_icon/"+a+".png>"; // 아이콘 넘버 넣기
			you_name.innerHTML = b; // 아이디
			new_pTag_you.innerHTML = c; // 내용 넣기
			clock_you.innerHTML = hours + ":" + minutes;
			
			messageArea.appendChild(total_you); // 토탈 div 생성
			total_you.appendChild(you_img); // 아이콘 넘버
			total_you.appendChild(total_you_thir); // 감싸는 div
			total_you_thir.appendChild(you_name);// 아이디
			total_you_thir.appendChild(total_you_sec); // 두번째 토탈 div
			total_you_sec.appendChild(new_pTag_you); // 채팅 내용
			total_you_sec.appendChild(clock_you);// 시간	
			
		}
		let chat = document.querySelector('#chat');
		chat.scrollTop = chat.scrollHeight;
	}
	
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");

	}
</script>
</html>