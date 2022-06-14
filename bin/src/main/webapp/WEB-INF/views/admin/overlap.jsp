<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업적 부여 완료</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="shortcut icon" href="/resources/imgs/favicon.ico" type="image/x-icon">
</head>
<body>
<script type="text/javascript">
Swal.fire({
	icon: 'error',
	title: '실패',
	text: '회원이 보유한 업적입니다.',   }).then(function(){
	location.href='/admin/achievement_grant.do';
	})
</script>
</body>
</html>