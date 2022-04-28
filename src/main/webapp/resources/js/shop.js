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
					item_remain -= 1;
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
						location.href = "/shop/shop.do";
					},
					error : function(request, status, err){
						alert("code = "+ request.status+"\n error = " +err);						
					}
					, beforeSend: function () {
			              var width = 0;
			              var height = 0;
			              var left = 0;
			              var top = 0;
			
			              width = 50;
			              height = 50;
			
			
			              top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
			              left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();
			
			 
			
			              if($("#div_ajax_load_image").length != 0) {
			                     $("#div_ajax_load_image").css({
			                            "top": top+"px",
			                            "left": left+"px"
			                     });
			                     $("#div_ajax_load_image").show();
			              }
			              else {
			                     $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="/resources/imgs/shop_etc/loading.gif" style="width:100%; height:100%;"></div>');
			              }
			
				       }
				       , complete: function () {
				                     $("#div_ajax_load_image").hide();
				       }

					})	
				}
			}

		
	})
})