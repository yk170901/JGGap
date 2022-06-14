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
	icon: 'success',
	title: '입력 완료',
	text: '정상처리 되었습니다.',   }).then(function(){
	location.href='/admin/achievement_grant.do';
	})
</script>
</body>
</html>