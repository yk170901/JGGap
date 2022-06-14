<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Object ban = session.getAttribute("ban"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ㅈㄱㅊㅇ - 전적검색과 구인을 한 번에!</title>	
	<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/libs.min.css" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">    
<!--     <link href="https://fonts.googleapis.com/css2?family=Marcellus&display=swap" rel="stylesheet"> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<header class="page-header">
	    <div class="page-header__inner">
	        <div class="page-header__sidebar">
	            <div class="page-header__menu-btn"><button class="menu-btn ico_menu is-active"></button></div>
	            <div class="page-header__logo"><a href="/board_list/board_list.do"><img src="/resources/imgs/logo.png" alt="logo" id="header_logo"></a></div>
	        </div>
	        <div class="page-header__content">
	            <div class="page-header__search">
	                <div class="search">
	                    <div class="search__input"><i class="ico_search"></i><input type="search" name="search" placeholder="전적검색할 소환사명..."></div>
	                </div>
	            </div>
	            <div class="page-header__action">
	            	<div id="profile-wrapper" style="display: flex; padding: 25px;">
	            		<div>
							<img src="#" id="profile-img" style="margin-right: 6px">            		
	            		</div>
		            	<div><p id="profile-summoner-id" style="margin-bottom: 0; font-family: 'Noto Sans KR', sans-serif; font-weight: 600; font-size: 17px;"></p></div>
		            	<div id="profile-dropdown">
		            		<div class="profile-point"><span class="profile-point-value" style="color: black;"></span></div>
		            		<a href="/record/record.do?summoner_id=${sessionScope.summoner_id}" class="profile-dropdown-list" style="color: black;">내 전적</a>
		            		<a href="/profile/profile.do" class="profile-dropdown-list" style="color: black;">회원정보</a>
		            		<a href="/basic/logout.do" class="profile-dropdown-list" style="color: black;">로그아웃</a>
		            	</div>
	            	</div>
	            </div>
	        </div>
	    </div>
	</header>
    <aside class="sidebar">
        <div class="sidebar-box">
            <ul class="uk-nav">
                <li class="uk-active"><a href="/board_list/board_list.do"><i class="ico_home"></i><span>구인게시판</span></a></li>
				<li><a href="javascript:Frameset2('/chat/chat.do?user_no=<%= session.getAttribute("user_no")%>&summoner_id=<%=session.getAttribute("summoner_id")%>&ban=<%= session.getAttribute("ban")%>&solo_tier=<%=session.getAttribute("solo_tier")%>')"><i class="ico_chats"></i><span>채팅</span></a></li>


                <li><a href="/shop/shop.do"><i class="ico_store"></i><span>포인트샵</span></a></li>
                
                <% if ((int)ban == 3) { %>
                <li><a href="/admin/admin_page.do"><i class="ico_profile"></i><span>회원 정보</span></a></li>
                
                <li><a href="/admin/achievement_grant.do"><i class="ico_profile"></i><span>업적 부여</span></a></li>
                
                <li><a href="/admin/report_history.do"><i class="ico_profile"></i><span>신고 내역</span></a></li>	
              <%   }%>
              	<li>
              		<div class="friend_ico_div">
              			<i class="ico_profile"></i>
              			<span style="margin-left: 5px; font-size: 13px;">FRIENDS</span>              		
              		</div>
              		<div class="friend_div">
	              		<ul class="friend">              			
	              		</ul>              		
              		</div>
              		
              		<div class="banned_ico_div">
	              		<i class="ico_profile"></i>
	              		<span style="margin-left: 5px; font-size: 13px;">BANNED</span>
	              	</div>
	              		<div class="banned_div">
		              		<ul class="banned">              		
		              		</ul>              		
	              		</div>              		
              		        	
              	</li>	
            </ul>
            
            <div class="uk-nav">
            </div>
        </div>
    </aside>  
    
    <script src="/resources/js/lib.js"></script>
    <script src="/resources/js/main.js"></script>
    <script src="/resources/js/header.js"></script>
</body>
</html>
