<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/profile.css" type="text/css">
</head>
<body>
	<%@ include file="/WEB-INF/views/basic/header.jsp" %>
	<main class="page-main">
		<div class="page-body">
			<!-- 프로필 정보 -->
			<div class="profile-body">
				<div class="profile-info">
					<div class="profile-info-icon">
						<img class="profile-icon" src="/resources/imgs/profile_icon/7.png" alt="profile">
					</div>
					<div class="profile-user">
						<div class="profile-user-title">네네스노윙순살</div>
						<div class="profile-user-text">명예지수 0.5 / 5.0</div>
					</div>
				</div>
				<div class="profile-button-body">
					<a class="profile-button" href="#!" onclick="chg_password()" ><span class="profile-button-text">비밀번호 변경</span></a>
					<a class="profile-button" href="#!"><span class="profile-button-text">전적 보기</span></a>
				</div>
			</div>
			<!-- 뱃지 목록 -->
			<div class="badges-box">
				<div class="badges-head">
					<h2 class="badges-title">활동 뱃지</h2>
				</div>
				<div class="badges-body">
					<ul class="badges-list">
                    	<li><img class="badges" src="/resources/imgs/profile_icon/9.png" alt="badge"><span>badge name</span></li>
                    	<li><img class="badges" src="/resources/imgs/profile_icon/9.png" alt="badge"><span>badge name</span></li>
                    	<li><img class="badges" src="/resources/imgs/profile_icon/9.png" alt="badge"><span>badge name</span></li>
                    	<li><img class="badges" src="/resources/imgs/profile_icon/9.png" alt="badge"><span>badge name</span></li>
                    	<li><img class="badges" src="/resources/imgs/profile_icon/9.png" alt="badge"><span>badge name</span></li>
                    	<li><img class="badges" src="/resources/imgs/profile_icon/9.png" alt="badge"><span>badge name</span></li>
                    	<li><img class="badges" src="/resources/imgs/profile_icon/9.png" alt="badge"><span>badge name</span></li>
                    	<li><img class="badges" src="/resources/imgs/profile_icon/9.png" alt="badge"><span>badge name</span></li>
                    	<li><img class="badges" src="/resources/imgs/profile_icon/9.png" alt="badge"><span>badge name</span></li>
                    	<li><img class="badges" src="/resources/imgs/profile_icon/9.png" alt="badge"><span>badge name</span></li>
                    </ul>
				</div>
			</div>
			<!-- 게시글 목록 -->
			<div class="board-box">
				<div class="boardlist-head">
					<h2 class="boardlist-title">게시글</h2>
				</div>
				<div class="board-list-body">
					<table border="1" class="board-list">
						<tr>
							<th width="100px">No</th>
							<th width="860px">제목</th>
							<th width="150px">등록일</th>
						</tr>
						<tr>
							<td>1</td>
							<td>찬호님</td>
							<td>2022-04-15</td>
						</tr>
						<tr>
							<td>2</td>
							<td>사이드바가</td>
							<td>2022-04-15</td>
						</tr>
						<tr>
							<td>3</td>
							<td>이상해요</td>
							<td>2022-04-15</td>
						</tr>
						<tr>
							<td>4</td>
							<td>길이가</td>
							<td>2022-04-15</td>
						</tr>
						<tr>
							<td>5</td>
							<td>짧아요</td>
							<td>2022-04-15</td>
						</tr>
						<tr>
							<td>6</td>
							<td>수정좀</td>
							<td>2022-04-15</td>
						</tr>
						<tr>
							<td>7</td>
							<td>수정좀</td>
							<td>2022-04-15</td>
						</tr>
						<tr>
							<td>8</td>
							<td>수정좀</td>
							<td>2022-04-15</td>
						</tr>
						<tr>
							<td>9</td>
							<td>수정좀</td>
							<td>2022-04-15</td>
						</tr>
						<tr>
							<td>10</td>
							<td>수정좀</td>
							<td>2022-04-15</td>
						</tr>
						
					</table>
				</div>
			</div>
			<!-- 모달 -->
			<div class="modal" id="Modal" tabindex="-1" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">

						<div class="modal-header">
							<h3 class="modal-title" id="change_password">비밀번호 변경</h3>
							<button type="button" class="modal-close"
								onclick="chg_password_cancle()">
								<span>X</span>
							</button>
						</div>
						<div class="modal-body">
							<form class="password_form" action="#" method="post">
								<div class="form-group">
									<label>현재 비밀번호</label> <input type="password" name="password"
										class="form-control" required />
								</div>
								<div class="form-group">
									<label>새 비밀번호 <small>(필수)</small></label> <input
										type="password" name="new-password" class="form-control"
										required />
								</div>
								<div class="form-group">
									<label>새 비밀번호 확인 <small>(필수)</small></label> <input
										type="password" name="new-password2" class="form-control"
										required />
								</div>
								<div class="form-group" style="text-align: right">
									<input class="primary" type="submit" value="비밀번호 변경" />
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button class="btn btn-secondary" type="button"
								onclick="chg_password_cancle()">취소</button>
						</div>



					</div>
					<div class="modal_layer"></div>
				</div>
			</div>




		</div>



	</main>
	<%@ include file="/WEB-INF/views/basic/footer.jsp" %>
	<script type="text/javascript" src="/resources/js/profile.js"></script>


</body>
</html>