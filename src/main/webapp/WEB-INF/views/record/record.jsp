<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=request.getParameter("summoner_id") %> - 소환사 전적</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<link rel="shortcut icon" href="/resources/imgs/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/record.css" type="text/css">
</head>
<body>
	<%@ include file="/WEB-INF/views/basic/header.jsp"%>
	<main class="page-main">
		<div class="page-body">
			로딩중...............
		</div>
	</main>
	<%@ include file="/WEB-INF/views/basic/footer.jsp"%>

	<script type="text/javascript" src="/resources/js/record.js"></script>
</body>
</html>