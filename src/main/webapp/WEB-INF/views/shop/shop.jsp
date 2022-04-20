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
		
		<!-- 보유포인트 및 포인트 획득방법 드롭다운 -->
	    <main class="shop-main">
   			<div class="shop-top">
   				<div class="shop-class"><p>응모</p></div>
   				<div id="shop-point-wrapper">
	   				<div id="shop-point">내가 보유한 포인트 : <span class="shop-explain-color">999</span> Point</div>
	   				<div id="shop-explain">
	   					<img src="/resources/imgs/info.jpeg">
			   			<div class="shop-explain-wrapper">
					    	<h2 style="margin-bottom: 15px;">포인트 획득 방법</h2>
					    	<div>소환사협곡(2인,5인) - 승리시 <span class="shop-explain-color">10</span>P / 패배시 <span class="shop-explain-color">5</span>P</div>
					    	<div>소환사협곡(일반) - 승리시 <span class="shop-explain-color">7</span>P / 패배시 <span class="shop-explain-color">3</span>P</div>
					    	<div>칼바람나락 - 승리시 <span class="shop-explain-color">3</span>P / 패배시 <span class="shop-explain-color">1</span>P</div>
				    	</div>
				    </div>
				</div>
	    	</div>
	    	<hr class="shop-line">
	    	<!-- 응모상품 목록 -->
	    	<div class="shop-apply-wrapper">
		    	<div class="shop-apply">
		    		<div class="point-amount"><p>10P</p></div>
			    	<div class="shop-apply-img">
			    		<img src="/resources/imgs/shop_items/shop_brandskin.jpg">
			    	</div>
			    	<div class="shop-apply-btn">
			    		<button>응모하기</button>
			    		<div class="shop-apply-fre">응모횟수 : 0회</div>
			    	</div>
		    	</div>
		    	<div class="shop-apply">
		    		<div class="point-amount"><p>10P</p></div>
		    		<div class="shop-apply-img">
			    		<img src="/resources/imgs/shop_items/shop_blitzskin.jpg">
			    	</div>
			    	<div class="shop-apply-btn">
			    		<button>응모하기</button>
			    	</div>
		    	</div>
		    	<div class="shop-apply">
		    		<div class="point-amount"><p>10P</p></div>
		    		<div class="shop-apply-img">
			    		<img src="/resources/imgs/shop_items/shop_nunuskin.jpg">
			    	</div>
			    	<div class="shop-apply-btn">
			    		<button>응모하기</button>
			    	</div>
		    	</div>
		    	<div class="shop-apply">
		    		<div class="point-amount"><p>10P</p></div>
		    		<div class="shop-apply-img">
			    		<img src="/resources/imgs/shop_items/shop_nocturneskin.jpg">
			    	</div>
			    	<div class="shop-apply-btn">
			    		<button>응모하기</button>
			    	</div>
		    	</div>
		    	<div class="shop-apply">
		    		<div class="point-amount"><p>10P</p></div>
		    		<div class="shop-apply-img">
			    		<img src="/resources/imgs/shop_items/shop_nunuskin.jpg">
			    	</div>
			    	<div class="shop-apply-btn">
			    		<button>응모하기</button>
			    	</div>
		    	</div>
		    	<div class="shop-apply">
		    		<div class="point-amount"><p>10P</p></div>
		    		<div class="shop-apply-img">
			    		<img src="/resources/imgs/shop_items/shop_nunuskin.jpg">
			    	</div>
			    	<div class="shop-apply-btn">
			    		<button>응모하기</button>
			    	</div>
		    	</div>
		    </div>
		    <hr class="shop-line">
		    <!-- 구매상품 목록 -->
		    <div class="shop-top" style="border-bottom: 1px solid gray;">
   				<div class="shop-class"><p>구매</p></div>
   			</div>
		    <div class="shop-buy-wrapper">
		    	<div class="shop-buy">
		    		<div class="point-amount"><p>5000P</p></div>
		    		<div class="shop-buy-img">
			    		<img src="/resources/imgs/shop_items/shop_nunuskin.jpg">
			    	</div>
			    	<div class="shop-buy-btn">
			    		<button>구매하기</button>
			    	</div>
		    	</div>
		    	<div class="shop-buy">
		    		<div class="point-amount"><p>5000P</p></div>
		    		<div class="shop-buy-img">
			    		<img src="/resources/imgs/shop_items/shop_nunuskin.jpg">
			    	</div>
			    	<div class="shop-buy-btn">
			    		<button>구매하기</button>
			    	</div>
		    	</div>
		    	<div class="shop-buy">
		    		<div class="point-amount"><p>5000P</p></div>
		    		<div class="shop-buy-img">
			    		<img src="/resources/imgs/shop_items/shop_nunuskin.jpg">
			    	</div>
			    	<div class="shop-buy-btn">
			    		<button>구매하기</button>
			    	</div>
		    	</div>
		    </div>
	    </main>
    
    <%@ include file="/WEB-INF/views/basic/footer.jsp"%>

</body>

</html>
