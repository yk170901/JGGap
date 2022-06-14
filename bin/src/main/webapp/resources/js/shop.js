$(function() { $('.apply').on("click", function() {
		var item_point = Number($(this).parents(".shop-apply").children(".point-amount").text().split('P')[0].trim());
		var usable_points = Number($(this).parents(".shop-main").children(".shop-top").children("#shop-point-wrapper").children("#shop-point").children('.shop-explain-color').text().trim());
		var item_per = Number($(this).parents(".shop-apply-btn").children(".description").children(".point-per").text().split(': ')[1].split('%')[0]);
		var item_remain = Number($(this).parents(".shop-apply-btn").children(".description").children(".item-remain").text().split(': ')[1].split('/')[0]);
		var item_name = $(this).parents(".shop-apply").children(".item_name").text();
		// 상품 남은 수량이 없는 상품 클릭시
		if(item_remain <= 0){
			Swal.fire({
				title: "상품이 모두 떨어졌습니다...",
				icon: "info",
				confirmButtonText: '네...'
			})
		} else{
				// 포인트가 상품 요구 포인트보다 적을 시
				if(item_point > (usable_points)){
				Swal.fire({
					title : "포인트가 부족합니다",
					icon : 'warning',
					confirmButtonText: '확인'
				})
			} else {
				// 포인트가 상품 요구 포인트 이상 있을 시 난수와 상품확률을 비교하여 당/낙첨 판단
				var user_per = (Math.random()*100) +1;
				if(item_per < user_per){
					Swal.fire({
						imageUrl: '/resources/imgs/shop_etc/sad_imoji.png',
						title : '꽝!',
						confirmButtonText: '네...'
					}).then(function(){
						// 낙첨시
						Swal.mixin().fire({
									toast: true,
									position: 'center-center',
									showConfirmButton: false,
									timer: 5000,
									timerProgressBar: true,
									icon: 'success',
									title: 'loading...'
						})
						$.ajax({
							url : "/shop/apply.do",
							type : "POST",
							data : {
								item_name : item_name,
								item_point : item_point,
								item_per : item_per,
								item_remain : item_remain
							},
							success: function(data) {								
								location.href = "/shop/shop.do";
							},
							error : function(request, status, err){
								alert("code = "+ request.status+"\n error = " +err);						
							}
						})
					})
				} else {
					Swal.fire({
						imageUrl: '/resources/imgs/shop_etc/happy_imoji.png',
						title: '당첨!',
						html: '상품코드 : KREQWQEITKDB<br/>등록기간 : 7/22 23:59까지<br/>기간만료시 사용불가',
						confirmButtonText: '네!!!'
					}).then(function(){
						// 당첨시 상품 재고를 1 감소
						item_remain = item_remain - 1;
						Swal.mixin().fire({
									toast: true,
									position: 'center-center',
									showConfirmButton: false,
									timer: 4000,
									timerProgressBar: true,
									icon: 'success',
									title: 'loading...'
						})
						$.ajax({
							url : "/shop/apply.do",
							type : "POST",
							data : {
								item_name : item_name,
								item_point : item_point,
								item_per : item_per,
								item_remain : item_remain
							},
							success: function(data) {								
								location.href = "/shop/shop.do";
							},
							error : function(request, status, err){
								alert("code = "+ request.status+"\n error = " +err);						
							}
						})
					})
					
				}
					
				}
			}		
	})
})

// 상품 구매 시
$(function(){ $('.shop-buy-btn').on('click', function(){
	var item_point = Number($(this).parents(".shop-buy").children(".point-amount").text().split('P')[0].trim());
	var usable_points = Number($(this).parents(".shop-main").children(".shop-top").children("#shop-point-wrapper").children("#shop-point").children('.shop-explain-color').text().trim());
		if(item_point > (usable_points)){
				Swal.fire({
					title : "포인트가 부족합니다",
					icon : 'warning',
					confirmButtonText: '확인'
				})
		} else{
			Swal.fire({
			title: '구매 완료!',
			html: '상품에 대한 안내를 문자메시지로 발송드렸습니다.',
			confirmButtonText: '확인',
			icon: 'success'
			}).then(function(){
					$.ajax({
					url : "/shop/buy.do",
					type : "POST",
					data : {
						item_point : item_point
					},
					success: function(data) {
						Swal.mixin().fire({
							toast: true,
							position: 'center-center',
							showConfirmButton: false,
							timer: 1600,
							timerProgressBar: true,
							icon: 'success',
							title: 'loading...'
						})
						location.href = "/shop/shop.do";
					},
					error : function(request, status, err){
						alert("code = "+ request.status+"\n error = " +err);						
					}
				})
			})			
		}		
	})	
})