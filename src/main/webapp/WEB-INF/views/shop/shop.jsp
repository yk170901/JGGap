<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="shortcut icon" href="/resources/imgs/favicon.png" type="image/x-icon">
	<link rel="stylesheet" href="/resources/css/shop.css" type="text/css">
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body class="page-store">
    
	<%@ include file="/WEB-INF/views/basic/header.jsp" %>
		
		<!-- 보유포인트 및 포인트 획득방법 드롭다운 -->
	    <main class="shop-main">
   			<div class="shop-top" style="border-bottom: 1px solid gray;">
   				<div class="shop-class"><p>응모</p></div>
   				<div id="shop-point-wrapper">
	   				<div id="shop-point">내가 보유한 포인트 : 
	   					<span class="shop-explain-color"><c:forEach items="${usablePoints }" var="point">${point.usable_points }</c:forEach></span> Point
	   				</div>
	   				<div id="shop-explain">
	   					<img src="/resources/imgs/info.png">
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
		    	<c:forEach items="${items}" var="item" varStatus="items">
			    	<div class="shop-apply<c:if test="${item.item_remain <= 0 }">-off</c:if>">
			    		<div class="item_name">${item.item_name }</div>
			    		<div class="point-amount"><p>${item.item_point }P</p></div>
				    	<div class="shop-apply-img">
				    		<img src="/resources/imgs/shop_items/${item.item_file}.jpg">
				    	</div>
				    	<div class="shop-apply-btn">	
				    		<div class="description">		    		
					    		<div class="shop-apply-fre">
					    			<c:forEach items="${applied }" var="applied">
							    		<c:if test="${item.item_name eq applied.item_name }">
							    			<c:out value="응모횟수 : ${applied.item_applied }회"></c:out>
							    		</c:if>								    			    		
							    	</c:forEach>
							    </div>
					    		<div class="point-per">당첨확률 : ${item.item_per }%</div>
					    		<div class="item-remain">남은 상품 : ${item.item_remain }/${item.item_total }</div>
				    		</div>
				    		<button class="apply">응모하기</button>
				    	</div>
			    	</div>
			    </c:forEach>
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
<script src="/resources/js/shop.js"></script>
</body>
</html>
