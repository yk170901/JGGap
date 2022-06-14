<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 로그인</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="shortcut icon" href="/resources/imgs/favicon.ico" type="image/x-icon">
</head>
<body>
<script type="text/javascript">
Swal.fire({
	icon: 'error',
	title: '중복 로그인',
	text: '이미 로그인 된 상태 입니다 로그아웃 시킵니다.',   }).then(function(){
	location.href='../../login.jsp';
	})
</script>
</body>
</html>