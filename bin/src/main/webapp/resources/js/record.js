$(function() {
	
	var summoner_id = getParameter("summoner_id");
	location.href = "/record/record_check.do?summoner_id="+summoner_id;
	
	// 파라미터 가져오는 함수
	function getParameter(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		results = regex.exec(location.search);
		return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}

})