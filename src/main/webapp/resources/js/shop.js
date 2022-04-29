$(function() { $('.apply').on("click", function() {
		var item_point = Number($(this).parents(".shop-apply").children(".point-amount").text().split('P')[0].trim());
		var usable_points = Number($(this).parents(".shop-main").children(".shop-top").children("#shop-point-wrapper").children("#shop-point").children('.shop-explain-color').text().trim());
		var item_per = Number($(this).parents(".shop-apply-btn").children(".description").children(".point-per").text().split(': ')[1].split('%')[0]);
		var item_remain = Number($(this).parents(".shop-apply-btn").children(".description").children(".item-remain").text().split(': ')[1].split('/')[0]);
		if(item_remain <= 0){
			Swal.fire({
				title: "상품이 모두 떨어졌습니다...",
				icon: "info",
				confirmButtonText: '네...'
			})
		} else{
				if(item_point > (usable_points)){
				Swal.fire({
					title : "포인트가 부족합니다",
					icon : 'warning',
					confirmButtonText: '확인'
				})
			} else {
				var user_per = (Math.random()*100) +1;
				if(item_per < user_per){
					Swal.fire({
						imageUrl: '/resources/imgs/shop_etc/sad_imoji.png',
						title : '꽝!',
						confirmButtonText: '네...'
					})
				} else {
					Swal.fire({
						imageUrl: '/resources/imgs/shop_etc/happy_imoji.png',
						title: '당첨!',
						confirmButtonText: '네!!!'
					})
					item_remain = item_remain - 1;
				}
				$.ajax({
					url : "/shop/apply.do",
					type : "POST",
					data : {
						item_name : $(this).parents(".shop-apply").children(".item_name").text(),
						item_point : item_point,
						item_per : item_per,
						item_remain : item_remain
					},
					success: function(data) {
						Swal.mixin().fire({
							toast: true,
							position: 'center-center',
							showConfirmButton: false,
							timer: 1300,
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
				}
			}		
	})
})