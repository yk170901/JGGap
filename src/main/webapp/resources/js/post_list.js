
function Frameset(page) {
		framecode = "<frameset rows='1*'>"
		+ "<frame name=main src='" + page + "'>"
		+ "</frameset>";

		document.write(framecode);
		document.title = "구인 게시판";
		document.title.after('<link rel="shortcut icon" href="/resources/imgs/favicon.ico" type="image/x-icon">');
		document.close();
		
	}
	
function testDate(){
	const dbdate = new Date(document.getElementById("dbdate").value);
	const nowdate = new Date(document.getElementById("nowdate").value);

	console.log("db저장된 시간 : "+ dbdate);
	console.log("현재 시간 : "+nowdate);
	
	const diffDate = dbdate.getTime() - nowdate.getTime();
	
	const dateDays = Math.abs(diffDate / (1000 * 3600));
	
	console.log(dateDays);
	
	document.getElementById("target_name").value = dateDays;
//	localStorage.setItem('date', dateDays);
	
}


window.onload = function() {
    document.getElementById('button_submit').onclick = function() {
		/* 값을 불러오기 위한 코드 */
		var hupgok = document.getElementById("hupgok").checked;
		var kalbaram = document.getElementById("kalbaram").checked;
		var mode_normal = document.getElementById("mode_normal").checked;
		var mode_solorank = document.getElementById("mode_solorank").checked;
		var mode_freerank = document.getElementById("mode_freerank").checked;
	
		if(hupgok == false && kalbaram == false && mode_normal == false && mode_solorank == false && mode_freerank == false){
			Swal.fire({
				html : "키워드를 선택해 주세요.",
				icon : 'warning',
				confirmButtonText: '확인',
				confirmButtonColor: "#F46119"
			})
			return true;
		}
	
		/* 체크 여부 확인 */
		if(hupgok == false && kalbaram == false){
			Swal.fire({
				html : "맵 분류를 선택해 주세요.",
				icon : 'warning',
				confirmButtonText: '확인',
				confirmButtonColor: "#F46119"
			})
			return false;
		}
		
		if(hupgok == true && kalbaram == true){
			Swal.fire({
				html : "맵 분류를 한 가지만 선택해 주세요.",
				icon : 'warning',
				confirmButtonText: '확인',
				confirmButtonColor: "#F46119"
			})
			return false;
		}
	
	
		if(hupgok == true && kalbaram == false){
			if(mode_normal == false && mode_solorank == false && mode_freerank == false){
			Swal.fire({
				html : "게임 분류를 선택해 주세요.",
				icon : 'warning',
				confirmButtonText: '확인',
				confirmButtonColor: "#F46119"
			})
				return false;
			}
		}
		
		if(hupgok == true){
			if(mode_normal == false && mode_solorank == false && mode_freerank == false){
			Swal.fire({
				html : "게임 분류를 선택해 주세요.",
				icon : 'warning',
				confirmButtonText: '확인',
				confirmButtonColor: "#F46119"
			})
				return false;
			}
		}
	
		if(hupgok == false && kalbaram == true){
			if(mode_normal == true || mode_solorank == true || mode_freerank == true){
			Swal.fire({
				html : "게임 분류 선택이 불가능 합니다.",
				icon : 'warning',
				confirmButtonText: '확인',
				confirmButtonColor: "#F46119"
			})
				return false;
			}
		}
	
        document.getElementById('frm').submit();
    };
};
