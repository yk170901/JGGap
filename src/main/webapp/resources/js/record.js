$(function() {
	
	var summoner_id = getParameter("summoner_id");
	alert('엌');
	
	function getParameter(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		results = regex.exec(location.search);
		return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	$.ajax({
			url: "/record/record_check.do",
			type: "post",
			data: { summoner_id: summoner_id },
			dataType: "json",
			success: function(data) {
				
					
			},
			error: function(err) {
				
			}


		})
})