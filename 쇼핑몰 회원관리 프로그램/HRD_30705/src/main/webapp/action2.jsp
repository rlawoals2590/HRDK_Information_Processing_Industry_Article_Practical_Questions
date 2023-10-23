<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util"%>
<%
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	Statement stmt = null;
	
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	try {
		con = Util.getConnection();
		stmt = con.createStatement();
		String sql = "update MEMBER_TBL_02 set custno = "+custno+", custname = '"+custname+"', phone = '"+phone+"', address = '"+address+"', joindate = '"+joindate+"', grade =  '"+grade+"', city = '"+city+"' where custno = "+custno+"";
		stmt.executeUpdate(sql);
		%>
		<jsp:include page="selectAndUpdate.jsp"></jsp:include>
		<%
	}catch(Exception e) {
		e.printStackTrace();
	}
%>