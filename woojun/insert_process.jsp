<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String REGIST_MONTH = request.getParameter("REGIST_MONTH");
String C_NO = request.getParameter("C_NO");
String CLASS_AREA = request.getParameter("CLASS_AREA");
String TEACHER_CODE = request.getParameter("TEACHER_CODE");
String TUITION = request.getParameter("TUITION");

int result = 0;

Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

String sql = "insert into TBL_CLASS_202201 values(?, ?, ?, ?, ?)";
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, REGIST_MONTH);
pstmt.setString(2, C_NO);
pstmt.setString(3, CLASS_AREA);
pstmt.setString(4, TUITION);
pstmt.setString(5, TEACHER_CODE);
result = pstmt.executeUpdate();

if (result > 0) {
%>
<script type="text/javascript">
	window.location.href = "index.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
	history.back();
</script>
<%
}
%>

