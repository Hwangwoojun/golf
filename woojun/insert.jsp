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

form {
	display: flex;
	justify-content: center;
}
#ii {
	text-align: center;
}
</style>
<script type="text/javascript">
	function yy() {
		var REGIST_MONTH = document.frm.REGIST_MONTH.value;
		var C_NAME = document.frm.C_NAME.value;
		var C_NO = document.frm.C_NO.value;
		var CLASS_AREA = document.frm.CLASS_AREA.value;
		var TEACHER_CODE = document.frm.TEACHER_CODE.value;
		var TUITION = document.frm.TUITION.value;
		
		if(REGIST_MONTH == "") {
			alert("수강월이 입력되지 않았습니다");
			document.frm.REGIST_MONTH.focus();
		}
		else if(C_NAME == "") {
			alert("회원명이 선택되지 않았습니다");
			document.frm.C_NAME.focus();
		}
		else if(CLASS_AREA == "") {
			alert("강의장소가 선택되지 않았습니다");
			document.frm.CLASS_AREA.focus();
		}
		else if(TEACHER_CODE == "") {
			alert("강의명가 선택되지 않았습니다");
			document.frm.TEACHER_CODE.focus();
		}
		else {
			alert("수강신청이 정상적으로 완료되었습니다!");
			document.frm.submit();
		}
	}
	function yyyy() {
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		document.frm.reset();
		document.frm.REGIST_MONTH.focus();
	}
	function dd() {
		var ddd = document.frm.TUITION;
		var dddd = document.frm.TEACHER_CODE;
		var ddddd = document.frm.C_NO;
		var dddddd = document.frm.C_NAME;
		ddd.value = "";
		dddd.options[0].selected = true;
		ddddd.value = dddddd.value;
	}
    function tt() {
        var ttt = document.frm.TEACHER_CODE;
        var tttt = document.frm.C_NO;
        var ttttt = document.frm.TUITION;
        var price = ttt.value * 1000;
        var c_no = tttt.value;
   
        if (c_no >= 20000) price *= 0.5;

        ttttt.value = price;
    }
</script>
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
	<h2>수강신청</h2>
	<form name="frm" action="insert_process.jsp" method="post">
		<table border="1">
			<tr>
				<th>수강월</th>
				<td><input type="text" name="REGIST_MONTH">2022년03월
					예)202203</td>
			</tr>
			<tr>
				<th>회원명</th>
				<td><select name="C_NAME" onchange="dd()">
						<option value="">회원명</option>
						<option value="10001">홍길동</option>
						<option value="10002">장발장</option>
						<option value="10003">임꺽정</option>
						<option value="20001">성춘향</option>
						<option value="20002">이몽룡</option>
				</select></td>
			</tr>
			<tr>
				<th>회원번호</th>
				<td><input type="text" name="C_NO" readonly="readonly">예)10001
				</td>
			</tr>
			<tr>
				<th>강의장소</th>
				<td><select name="CLASS_AREA">
						<option value="">강의장소</option>
						<option value="서울본원">서울본원</option>
						<option value="성남분원">성남분원</option>
						<option value="대전분원">대전분원</option>
						<option value="부산분원">부산분원</option>
						<option value="대구분원">대구분원</option>
				</select></td>
			</tr>
			<tr>
				<th>강의명</th>
				<td><select name="TEACHER_CODE" onchange="tt()">
						<option value="">강의신청</option>
						<option value="100">초급반</option>
						<option value="200">중급반</option>
						<option value="300">고급반</option>
						<option value="400">심화반</option>
				</select></td>
			</tr>
			<tr>
				<th>수강료</th>
				<td><input type="text" name="TUITION"></td>
			</tr>
			<tr>
			<td colspan="2" id="ii">
			<button type="button" onclick="yy()">수강신청</button>
			<button type="button" onclick="yyyy()">다시쓰기</button>
			</td>
			</tr>
		</table>
	</form>
	<footer> HRDKOREA Copyright@2015 All right resevred Enanal
		Resesers Developement Service of Korea </footer>
</body>
</html>