<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<script type="text/javascript">
Swal.fire({
	icon: 'error',
	title: '로그인 실패',
	text: '아이디가 존재하지 않거나, 아이디 또는 비밀번호가 틀렸습니다.',   }).then(function(){
	location.href='../../login.jsp';
	})
</script>
</body>
</html>