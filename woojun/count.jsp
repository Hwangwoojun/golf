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
th {
	width: 200px;
}
#dd {
	text-align: right;
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
	<h2>강사매출현황</h2>
	<div>
		<table border="1">
			<tr>
				<th>강사코드</th>
				<th>강의명</th>
				<th>강사명</th>
				<th>총매출</th>
			</tr>
			<%
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
			
			Statement stmt = con.createStatement();
			
			String sql = " SELECT T.TEACHER_CODE, T.CLASS_NAME, T.TEACHER_NAME, "
					+ " TO_CHAR(sum(C.TUITION), '999,999,999') as total "
					+ " FROM TBL_CLASS_202201 C "
					+ " join TBL_TEACHER_202201 T on T.TEACHER_CODE = C.TEACHER_CODE "
					+ " group by T.TEACHER_CODE, T.CLASS_NAME, T.TEACHER_NAME "
					+ " order by T.TEACHER_CODE asc ";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
			%>
			<tr>
				<td><%= rs.getString("TEACHER_CODE") %></td>
				<td><%= rs.getString("CLASS_NAME") %></td>
				<td><%= rs.getString("TEACHER_NAME") %></td>
				<td id="dd">\<%= rs.getString("total") %></td>
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