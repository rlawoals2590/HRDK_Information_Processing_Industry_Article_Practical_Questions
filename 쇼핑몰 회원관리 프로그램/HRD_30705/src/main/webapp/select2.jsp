<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util"%>
<%
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	Statement stmt = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
<link rel="stylesheet" href="css/style.css">
<style>
	.c {
		text-decoration: underline;
	}
</style>
</head>
<body>
<header><jsp:include page="header.jsp"></jsp:include></header>
<nav><jsp:include page="nav.jsp"></jsp:include></nav>
<section>
<h3>회원매출조회</h3>
<table border="1">
<tr>
	<td>회원번호</td>
	<td>회원성명</td>
	<td>고객등급</td>
	<td>매출</td>
</tr>
<% 
	try{
		con = Util.getConnection();
		stmt = con.createStatement();
		String sql = "select a.custno, a.custname, a.grade, to_char(sum(b.price), '999,999,999,999') as sum from MEMBER_TBL_02 a, MONEY_TBL_02 b where a.custno = b.custno group by a.custno, a.custname, a.grade order by sum(b.price) desc";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			String grade = null;
			switch(rs.getString("grade")){
			case "A":
				grade = "VIP";
				break;
			case "B":
				grade = "일반";
				break;
			case "C":
				grade = "직원";
				break;
		}
%>
<tr>
	<td><%=rs.getInt("custno")%></td>
	<td><%=rs.getString("custname")%></td>
	<td><%=grade%></td>
	<td><%=rs.getString("sum")%></td>
</tr>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</table>
</section>
</body>
<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</html>