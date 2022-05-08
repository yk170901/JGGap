function FramesetUn(page) {
		let [a, b]  = page.split("solo_tier=");
		if(b == "UNRANKED"){
			framecode = "<frameset rows='1*'>"
		+ "<frame name=main src='" + page + "'>"
		+ "</frameset>";

		document.write(framecode);
		document.title = "채팅방";
		document.close();
		}
		else
		{
			alert('채팅방에 적합하지 않는 티어 입니다.');
			return false;
		}
		
	}
	
function FramesetBr(page) {
		let [a, b]  = page.split("solo_tier=");
		if(b == "IRON" || b == "BRONZE" || b == "SILVER"){
			framecode = "<frameset rows='1*'>"
			+ "<frame name=main src='" + page + "'>"
			+ "</frameset>";
	
			document.write(framecode);
			document.title = "채팅방";
			document.close();
		}
		else
		{
			alert('채팅방에 적합하지 않는 티어 입니다.');
			return false;
		}
	}
	
function FramesetGo(page) {
		let [a, b]  = page.split("solo_tier=");
		if(b == "GOLD" || b == "PLATINUM" || b == "DIAMOND"){
			framecode = "<frameset rows='1*'>"
			+ "<frame name=main src='" + page + "'>"
			+ "</frameset>";
	
			document.write(framecode);
			document.title = "채팅방";
			document.close();
		}
		else
		{
			alert('채팅방에 적합하지 않는 티어 입니다.');
			return false;
		}
	}
	
function FramesetMa(page) {
		let [a, b]  = page.split("solo_tier=");
		if(b == "MASTER" || b == "GRANDMASTER" || b == "CHALLENGER"){
			framecode = "<frameset rows='1*'>"
			+ "<frame name=main src='" + page + "'>"
			+ "</frameset>";
	
			document.write(framecode);
			document.title = "채팅방";
			document.close();
		}
		else
		{
			alert('채팅방에 적합하지 않는 티어 입니다.');
			return false;
		}
	}