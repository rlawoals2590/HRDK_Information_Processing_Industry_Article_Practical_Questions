<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util"%>
<%
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	Statement stmt = null;
	StringBuffer sb = new StringBuffer();
	
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
		String sql = "insert into MEMBER_TBL_02 values ("+custno+", '"+custname+"', '"+phone+"', '"+address+"', '"+joindate+"', '"+grade+"', '"+city+"')";
		stmt.executeUpdate(sql);
		%>
		<jsp:include page="selectAndUpdate.jsp"></jsp:include>
		<%
	}catch(Exception e) {
		e.printStackTrace();
	}
%>