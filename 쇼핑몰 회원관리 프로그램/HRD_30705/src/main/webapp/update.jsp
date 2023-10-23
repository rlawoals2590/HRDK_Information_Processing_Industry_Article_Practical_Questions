<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util"%>
<%
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	Statement stmt = null;
	String custno = request.getParameter("custno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="check.js"></script>
<style>
	.a {
		text-decoration: underline;
	}
</style>
</head>
<body>
<header><jsp:include page="header.jsp"></jsp:include></header>
<nav><jsp:include page="nav.jsp"></jsp:include></nav>
<section>
<h3>홈쇼핑 회원정보 수정</h3>
<form action="action2.jsp" name="fr_insert">
<table border="1">
<tr>
<% 
	try{
		con = Util.getConnection();
		stmt = con.createStatement();
		String sql = "select custno, custname, phone, address, to_char(joindate, 'YYYY-MM-DD') as joindate, grade, city from MEMBER_TBL_02 where custno = "+custno+"";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
%>
	<td>회원번호(자동생성)</td>
	<td><input type="text" value="<%=rs.getInt("custno")%>" name="custno"></td>
</tr>
<tr>
	<td>회원성명</td>
	<td><input type="text" value="<%=rs.getString("custname")%>" name="custname"></td>
</tr>
<tr>
	<td>회원전화</td>
	<td><input type="text" value="<%=rs.getString("phone")%>" name="phone"></td>
</tr>
<tr>
	<td>통신사(SK, KT, LG)</td>
	<td><input type="radio" value="SK" name="address">SK<input type="radio" value="KT" name="address">KT<input type="radio" value="LG" name="address">LG</td>
</tr>
<tr>
	<td>가입날짜</td>
	<td><input type="text" value="<%=rs.getString("joindate")%>" name="joindate"></td>
</tr>
<tr>
	<td>고객등급[A:VIP, B:일반, C:직원]</td>
	<td><input type="text" value="<%=rs.getString("grade")%>" name="grade"></td>
</tr>
<tr>
	<td>도시코드</td>
	<td><input type="text" value="<%=rs.getString("city")%>" name="city"></td>
</tr>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<tr>
	<td colspan="2">
		<input type="submit" value="수 정" onclick="return checkUpdateData()">
		<a href="selectAndUpdate.jsp"><input type="button" value="조 회"></a>
	</td>
</tr>
</table>
</form>
</section>
</body>
<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</html>