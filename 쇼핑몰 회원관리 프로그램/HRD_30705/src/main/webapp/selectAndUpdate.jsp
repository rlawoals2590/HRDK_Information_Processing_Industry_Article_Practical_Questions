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
<title>쇼핑몰 회원관리 ver 1.0</title>
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
<h3>회원목록조회/수정</h3>
<table border="1">
<tr>
	<td>회원번호</td>
	<td>회원성명</td>
	<td>전화번호</td>
	<td>통신사</td>
	<td>가입일자</td>
	<td>고객등급</td>
	<td>거주지역</td>
</tr>
<% 
	try{
		con = Util.getConnection();
		stmt = con.createStatement();
		String sql = "select custno, custname, concat(concat(concat(substr(phone, 0, 3), '-'), concat(substr(phone, 4, 4), '-')), substr(phone, 8, 4)) as phone, address, to_char(joindate, 'YYYY-MM-DD') as joindate, grade, city from MEMBER_TBL_02";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			String city = null;
			switch(rs.getString("city")){
				case "01":
					city = "서울";
					break;
				case "10":
					city = "인천";
					break;
				case "20":
					city = "성남";
					break;
				case "30":
					city = "대전";
					break;
				case "40":
					city = "광주";
					break;
				case "60":
					city = "부산";
					break;
			}
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
	<td><a href="update.jsp?custno=<%=rs.getInt("custno")%>" style="color: blue; text-decoration: none;"><%=rs.getInt("custno")%></a></td>
	<td><%=rs.getString("custname")%></td>
	<td><%=rs.getString("phone")%></td>
	<td><%=rs.getString("address")%></td>
	<td><%=rs.getString("joindate")%></td>
	<td><%=grade%></td>
	<td><%=city%></td>
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