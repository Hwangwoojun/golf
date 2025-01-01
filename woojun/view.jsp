<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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

div {
	display: flex;
	justify-content: center;
}
table {
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
	<h2>강사조회</h2>
	<div>
		<table border="1">
			<tr>
				<th>강사코드</th>
				<th>강사명</th>
				<th>강의명</th>
				<th>수강료</th>
				<th>강사자격취득일</th>
			</tr>
			<%
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
			
			Statement stmt = con.createStatement();
			
			String sql = "SELECT TEACHER_CODE, TEACHER_NAME, CLASS_NAME, "
					+ " TO_CHAR(CLASS_PRICE, '999,999,999') as total, "
					+ " TEACHER_REGIST_DATE "
					+ " FROM TBL_TEACHER_202201 ";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
			%>
			<tr>
				<td><%= rs.getString("TEACHER_CODE") %></td>
				<td><%= rs.getString("TEACHER_NAME") %></td>
				<td><%= rs.getString("CLASS_NAME") %></td>
				<td>\<%= rs.getString("total") %></td>
				<td><%= rs.getString("TEACHER_REGIST_DATE").substring(0,4) %>년<%= rs.getString("TEACHER_REGIST_DATE").substring(4,6) %>월<%= rs.getString("TEACHER_REGIST_DATE").substring(6,8) %>일</td>		
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<footer> HRDKOREA Copyright@2015 All right resevred Enanal
		Resesers Developement Service of Korea </footer>
</body>
</html>