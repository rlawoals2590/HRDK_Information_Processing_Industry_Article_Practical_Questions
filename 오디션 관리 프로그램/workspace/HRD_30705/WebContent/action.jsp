<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String artist_id = request.getParameter("artist_id");
	String artist_name = request.getParameter("artist_name");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String artist_gender = request.getParameter("artist_gender");
	String talent = request.getParameter("talent");
	String agency = request.getParameter("agency");
	
	Connection conn = null;
	Statement stmt = null;
	
	try {
		conn = Util.getConnection();
		stmt = conn.createStatement();
		
		String sql = "insert into tbl_artist_201905 values('"+ artist_id +"', '"+ artist_name +"', '"+ year + month + day +"', '"+ artist_gender +"', '"+ talent +"', '"+ agency +"')";
		stmt.executeUpdate(sql);
		%>
		<jsp:include page="select.jsp"></jsp:include>
		<%
	} catch(Exception e){
		e.printStackTrace();
	}
%>