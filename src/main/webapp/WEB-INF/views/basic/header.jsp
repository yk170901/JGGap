<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Object ban = session.getAttribute("ban"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>	
	<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/libs.min.css" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">    
    <link href="https://fonts.googleapis.com/css2?family=Marcell`us&display=swap" rel="stylesheet">
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
	            	<a class="profile" href="/profile/profile.do"><img src="#" id="profile_img"></a>
	            	<div><span id="profile_summoner_id"></span></div>
	            	<div id="profile_dropdown">
	            		<div class="profile_point"><span class="profile_point_value" style="color: white;"></span></div>
	            		<a href="#" class="profile_dropdown_list" style="color: white;">내 전적</a>
	            		<a href="/profile/profile.do" class="profile_dropdown_list" style="color: white;">회원정보</a>
	            		<a class="profile_dropdown_list" style="color: white;" id="CSC">고객센터</a>
	            		<a href="/basic/logout.do" class="profile_dropdown_list" style="color: white;">로그아웃</a>
	            	</div>
	            </div>
	        </div>
	    </div>
	</header>
    <aside class="sidebar">
        <div class="sidebar-box">
            <ul class="uk-nav">
                <li class="uk-active"><a href="http://localhost:8080/board_list/board_list.do"><i class="ico_home"></i><span>구인게시판</span></a></li>

                <li><a href="http://192.168.1.82:8080/chat/chat.do?user_no=<%= session.getAttribute("user_no")%>&summoner_id=<%=session.getAttribute("summoner_id")%>&ban=<%= session.getAttribute("ban")%>&solo_tier=<%=session.getAttribute("solo_tier")%>"><i class="ico_chats"></i><span>채팅</span></a></li>

                <li><a href="http://localhost:8080/shop/shop.do"><i class="ico_store"></i><span>포인트샵</span></a></li>
                
                <li><a href="http://localhost:8080/record/record.do"><i class="ico_search"></i><span>전적검색</span></a></li>
                
                <% if ((int)ban == 3) { %>
                <li><a href="http://localhost:8080/admin/admin_page.do"><i class="ico_profile"></i><span>회원 정보 관리</span></a></li>
                
                <li><a href="http://localhost:8080/admin/achievement_grant.do"><i class="ico_profile"></i><span>업적 부여</span></a></li>
                
                <li><a href="http://localhost:8080/admin/report_history.do"><i class="ico_profile"></i><span>신고 내역</span></a></li>	
              <%   }%>
              	<li>
              		<span>FRIENDS</span>
              		<ul class="friend">              			
              		</ul>              	
              		<span>BANNED</span>
              		<ul class="banned">              		
              		</ul>
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
