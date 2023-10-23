<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver 1.0</title>
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
<h3>쇼핑몰 회원관리 프로그램</h3>
<pre style="text-align: left;">
쇼핑몰 회원정보의 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.
프로그램 작성 순서
1. 회원정보 테이블을 생성한다.
2. 매출정보 테이블을 생성한다.
3. 회원정보, 매출정보 테이블에 제시된 문제지와 참조데이터를 추가 생성한다.
4. 회원정보 입력 화면프로그램을 작성한다.
5. 회원정보 조회 프로그램을 작성한다.
6. 회원매출정보 조회 프로그램을 작성한다.
</pre>
</section>
</body>
<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</html>