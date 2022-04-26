<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명예 점수</title>
</head>
<body>

	<!-- 명예 점수 주기-->
	<div class="modal honor-modal-container" id="modal" tabindex="-1"
		role="dialog">
		<div class="modal-content honor-modal-content">
			<div class="modal-header honor-modal-header">
				<h4 class="modal-title honor-modal-title" ></h4>
				<h5 class="honor-modal-title-text"> 님과의 게임은 어떠셨나요?</h5>
			</div>
			<div class="modal-body honor-modal-body">
				<form class="honor_form" name="honor_form">
					<div class="honor-form-group">
						<span class="honor-star"> ★★★★★ <span>★★★★★</span> <input
							type="range" name="honor-check" oninput="honor_drawStar(this)" value="1" step="0.5" min="0"
							max="5">
						</span>
					</div>
					<div class="honor-modal-button">
						<div class="honor-modal-button-body">
							
							<button type="button" class="honor-modal-submit">
								<span>확인</span>
							</button>
							<button type="button" class="modal-close honor-modal-close"
								onclick="honor_rate_cancle()">
								<span>취소</span>
							</button>
						</div>
					</div>

				</form>
			</div>
		</div>
			<div class="modal_layer"></div>
	</div>

</body>
</html>