<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오디션 관리 프로그램 ver 2019-06</title>
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
<h3>오디션 등록</h3>
<form action="action.jsp" name="frm_insert">
<table border="1" style="text-align: left;">
<tr>
	<td>참가번호</td>
	<td><input type="text" name="artist_id">*참가번호는 (A000)4자리입니다.</td>
</tr>
<tr>
	<td>참가자명</td>
	<td><input type="text" name="artist_name"></td>
</tr>
<tr>
	<td>생년월일</td>
	<td><input type="text" name="year">년<input type="text" name="month">월<input type="text" name="day">일</td>
</tr>
<tr>
	<td>성별</td>
	<td><input type="radio" name="artist_gender" value="M">남성<input type="radio" name="artist_gender" value="F">여성</td>
</tr>
<tr>
	<td>특기</td>
	<td>
		<select name="talent">
		    <option value="">특기선택</option>
		    <option value="1">[1]보컬</option>
		    <option value="2">[2]댄스</option>
		    <option value="3">[3]랩</option>
		</select>
	</td>
</tr>
<tr>
	<td>소속사</td>
	<td><input type="text" name="agency"></td>
</tr>
<tr>
	<td colspan="2" style="text-align: center;">
		<input type="submit" value="오디션 등록" onclick="return checkData();">
		<input type="reset" value="다시쓰기" onclick="return resetData();">
	</td>
</tr>
</table>
</form>
</section>
</body>
<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</html>