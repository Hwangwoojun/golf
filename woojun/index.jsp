<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
* {
	box-sizing: border-box;
	margin: 0;
}

h1 {
	width: 100%;
	height: 70px;
	text-align: center;
	color: white;
	background-color: black;
	padding-top: 10px;
}

nav {
	background-color: gray;
	width: 100%;
	height: 40px;
	padding-top: 4px;
}

a {
	margin-left: 10px;
	font-size: 20px;
	font-weight: bold;
	text-decoration: none;
	color: white;
}

footer {
	width: 100%;
	height: 60px;
	background-color: gray;
	font-size: 25px;
	font-weight: bold;
	position: fixed;
	text-align: center;
	bottom: 0;
	padding-top: 7px;
	color: white;
}
h2 {
	margin-top: 20px;
	margin-bottom: 20px;
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
	<header>
		<h1>골프연습장 회원관리 프로그램 ver 1.0</h1>
		<nav>
			<a href="view.jsp">강사조회</a> <a href="insert.jsp">수강신청</a> <a
				href="vieww.jsp">회원정보조회</a> <a href="count.jsp">강사매출현황</a> <a
				href="index.jsp">홈으로</a>
		</nav>
	</header>
	<h2>골프연습장 회원관리 프로그램</h2>
	<footer> HRDKOREA Copyright@2015 All right resevred Enanal
		Resesers Developement Service of Korea </footer>
</body>
</html>