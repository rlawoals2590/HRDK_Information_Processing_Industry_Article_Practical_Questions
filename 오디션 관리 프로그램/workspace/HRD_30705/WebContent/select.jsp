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
	.b {
		text-decoration: underline;
	}
</style>
</head>
<body>
<header><jsp:include page="header.jsp"></jsp:include></header>
<nav><jsp:include page="nav.jsp"></jsp:include></nav>
<section>
<h3>참가자목록조회</h3>
<table border="1">
<tr>
	<td>참가번호</td>
	<td>참가자명</td>
	<td>생년월일</td>
	<td>성별</td>
	<td>특기</td>
	<td>소속사</td>
</tr>
<%
	try {
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql = "select artist_id, artist_name, TO_CHAR(to_date(artist_birth), 'YYYY\"년\"MM\"월\"DD\"일\"') as birth, artist_gender, talent, agency from TBL_ARTIST_201905";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			String gender = null;
			String talent = null;
			
			switch(rs.getString("artist_gender")) {
				case "F":
					gender = "여";
					break;
				case "M":
					gender = "남";
					break;
			}
			switch(rs.getString("talent")) {
				case "1":
					talent = "보컬";
					break;
				case "2":
					talent = "댄스";
					break;
				case "3":
					talent = "랩";
					break;
			}
%>
<tr>
	<td><%=rs.getString("artist_id") %></td>
	<td><%=rs.getString("artist_name") %></td>
	<td><%=rs.getString("birth") %></td>
	<td><%=gender%></td>
	<td><%=talent%></td>
	<td><%=rs.getString("agency") %></td>
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