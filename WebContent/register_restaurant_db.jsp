<%@page import="db.DBManager"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@page import="java.util.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<%
	request.setCharacterEncoding("UTF-8");

	String rest_name = request.getParameter("rest_name");
	String address = request.getParameter("address");
	Double x = Double.parseDouble(request.getParameter("x"));
	Double y = Double.parseDouble(request.getParameter("y"));
	

	try {
		DBManager db = DBManager.getInstance();
		Connection con = db.open();

		String sql = "insert into restaurant values(null, ?,?,?)";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1,rest_name);
		stmt.setDouble(2,x);
		stmt.setDouble(3,y);
		
		stmt.executeUpdate();
	
		response.sendRedirect("register_restaurant.jsp");		
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

%>



