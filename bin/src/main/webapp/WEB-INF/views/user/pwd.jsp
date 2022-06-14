<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="shortcut icon" href="/resources/imgs/favicon.ico" type="image/x-icon">
</head>
<body>
<script type="text/javascript">
Swal.fire({
	icon: 'error',
	title: '로그인 실패',
	text: '비밀번호가 틀렸습니다.',   }).then(function(){
	location.href='../../login.jsp';
	})
</script>
</body>
</html>