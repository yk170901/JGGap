function is_checked(){
	/* 값을 불러오기 위한 코드 */
	var hupgok = document.getElementById("hupgok").checked;
	var kalbaram = document.getElementById("kalbaram").checked;
	var mode_normal = document.getElementById("mode_normal").checked;
	var mode_solorank = document.getElementById("mode_solorank").checked;
	var mode_freerank = document.getElementById("mode_freerank").checked;

	/* 체크 여부 확인 */
	if(hupgok == false && kalbaram == false){
		alert('맵 분류를 선택해주세요.');
		return false;
	}


	if(hupgok == true && kalbaram == true){
		if(mode_normal == false && mode_solorank == false && mode_freerank == false){
			alert('게임 분류를 선택해주세요.');
			return false;
		}
	}
	
	if(hupgok == true){
		if(mode_normal == false && mode_solorank == false && mode_freerank == false){
			alert('게임 분류를 선택해주세요.');
			return false;
		}
	}

	if(hupgok == false && kalbaram == true){
		if(mode_normal == true || mode_solorank == true || mode_freerank == true){
			alert('칼바람 나락이 선택된 상태로 게임 분류 선택이 불가능 합니다.');
			return false;
		}
	}
	
}


function Frameset(page) {
		framecode = "<frameset rows='1*'>"
		+ "<frame name=main src='" + page + "'>"
		+ "</frameset>";

		document.write(framecode);
		document.title = "구인 게시판";
		document.close();
		
		

	}
