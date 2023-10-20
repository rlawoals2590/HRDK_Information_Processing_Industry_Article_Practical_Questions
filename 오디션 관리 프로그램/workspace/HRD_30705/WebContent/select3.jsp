<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn = null;
	Statement stmt = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오디션 관리 프로그램 ver 2019-06</title>
<link rel="stylesheet" href="css/style.css">
<style>
	.d {
		text-decoration: underline;
	}
</style>
</head>
<body>
<header><jsp:include page="header.jsp"></jsp:include></header>
<nav><jsp:include page="nav.jsp"></jsp:include></nav>
<section>
<h3>참가자등수조회</h3>
<table border="1">
<tr>
	<td>참가번호</td>
	<td>참가자명</td>
	<td>총점</td>
	<td>평균</td>
	<td>등수</td>
</tr>
<%
	try {
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql = "select a.artist_id, a.artist_name, sum(c.point) as sum , to_char(sum(c.point) / count(a.artist_id), '99.99') as avg,  rank() over (order by sum(c.point) desc) as rank from TBL_ARTIST_201905 a, tbl_point_201905 c where a.artist_id = c.artist_id group by a.artist_id, a.artist_name";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
%>
<tr>
	<td><%=rs.getString("artist_id") %></td>
	<td><%=rs.getString("artist_name") %></td>
	<td><%=rs.getString("sum") %></td>
	<td><%=rs.getString("avg") %></td>
	<td><%=rs.getString("rank") %></td>
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