<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/libs.min.css" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Marcellus&display=swap" rel="stylesheet">
</head>
<body>
    <div class="page-wrapper">
        <header class="page-header">
            <div class="page-header__inner">
                <div class="page-header__sidebar">
                    <div class="page-header__menu-btn"><button class="menu-btn ico_menu is-active"></button></div>
                    <div class="page-header__logo"><img src="/resources/imgs/logo.png" alt="logo" style="width: 50px; height: 50px;"></div>
                </div>
                <div class="page-header__content">
                    <div class="page-header__search">
                        <div class="search">
                            <div class="search__input"><i class="ico_search"></i><input type="search" name="search" placeholder="Search"></div>
                        </div>
                    </div>
                    <div class="page-header__action"><a class="profile" href="#!"><img src="assets/img/profile.png" alt="profile"></a></div>
                </div>
            </div>
        </header>
        <div class="page-content">
            <aside class="sidebar is-show" id="sidebar">
                <div class="sidebar-box">
                    <ul class="uk-nav">
                        <li class="uk-active"><a href="#"><i class=""></i><span>구인게시판</span></a></li>
                        
                        <li><a href="#"><i class="ico_profile"></i><span>프로필</span></a></li>

                        <li><a href="#"><i class="ico_favourites"></i><span>채팅방</span></a></li>

                        <li><a href="#"><i class="ico_chats"></i><span>채팅</span></a></li>

                        <li><a href="#"><i class="ico_friends"></i><span>포인트샵</span></a></li>
                    </ul>
                </div>
            </aside>            
        </div>
    </div>
    
    <script src="/resources/js/libs.js"></script>
    <script src="/resources/js/main.js"></script>
</body>
</html>