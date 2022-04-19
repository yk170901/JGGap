<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ㅈㄱㅊㅇ - 전적검색과 구인을 한 번에!</title>
    <meta content="Templines" name="author">
    <meta content="TeamHost" name="description">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="HandheldFriendly" content="true">
    <meta name="format-detection" content="telephone=no">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <link rel="shortcut icon" href="/resources/img/favicon.png" type="image/x-icon">
	<link rel="stylesheet" href="/resources/css/shop.css" type="text/css">
</head>

<body class="page-store">
    
	<%@ include file="/WEB-INF/views/basic/header.jsp" %>
		
	    <main class="shop-main">
   			<div id="shop-point-notice">
   				<p id="shop-point"></p>
   				<div id="shop-explain-img"><img src="/resources/imgs/info.jpeg"></div>
	   			<div class="shop-explain-wrapper">
			    	<h2>포인트 획득 방법</h2><br/>
			    	<p>소환사협곡(2인,5인) - 승리시 <span class="shop-explain">10</span>P / 패배시 <span class="shop-explain">5</span>P</p>
			    	<p>소환사협곡(일반) - 승리시 <span class="shop-explain">7</span>P / 패배시 <span class="shop-explain">3</span>P</p>
			    	<p>칼바람나락 - 승리시 <span class="shop-explain">3</span>P / 패배시 <span class="shop-explain">1</span>P</p>
		    	</div>
	    	</div>
	    	<hr>
	    	<div class="shop-apply-wrapper">
		    	<div class="shop-apply">
		    	</div>
		    	<div class="shop-apply">
		    	</div>
		    	<div class="shop-apply">
		    	</div>
		    	<div class="shop-apply">
		    	</div>
		    	<div class="shop-apply">
		    	</div>
		    	<div class="shop-apply">
		    	</div>
		    </div>
	    </main>
    
    <%@ include file="/WEB-INF/views/basic/footer.jsp"%>

</body>

</html>
