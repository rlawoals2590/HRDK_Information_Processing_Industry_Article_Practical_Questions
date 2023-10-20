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
	.c {
		text-decoration: underline;
	}
</style>
</head>
<body>
<header><jsp:include page="header.jsp"></jsp:include></header>
<nav><jsp:include page="nav.jsp"></jsp:include></nav>
<section>
<h3>멘토점수조회</h3>
<table border="1">
<tr>
	<td>채점번호</td>
	<td>참가번호</td>
	<td>참가자명</td>
	<td>생년월일</td>
	<td>점수</td>
	<td>평점</td>
	<td>멘토</td>
</tr>
<%
	try {
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql = "select c.serial_no, c.artist_id, a.artist_name, TO_CHAR(to_date(artist_birth), 'YYYY\"년\"MM\"월\"DD\"일\"') as birth, c.point, b.mento_name from TBL_ARTIST_201905 a, TBL_MENTO_201905 b, TBL_POINT_201905 c where a.artist_id = c. artist_id and b.mento_id = c.mento_id order by c.serial_no";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			String average = null;
			
			if (rs.getInt("point") >= 90){
				average = "A";
			}else if (rs.getInt("point") < 90 && rs.getInt("point") >= 80 ){
				average = "B";
			}else if (rs.getInt("point") < 80 && rs.getInt("point") >= 70 ){
				average = "C";
			}else if (rs.getInt("point") < 70 && rs.getInt("point") >= 60 ){
				average = "D";
			}else {
				average = "F";
			}
			
%>
<tr>
	<td><%=rs.getString("serial_no") %></td>
	<td><%=rs.getString("artist_id") %></td>
	<td><%=rs.getString("artist_name") %></td>
	<td><%=rs.getString("birth") %></td>
	<td><%=rs.getString("point") %></td>
	<td><%=average %></td>
	<td><%=rs.getString("mento_name") %></td>
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