<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>


<%
	Connection conn = null;

	String url = "jdbc:mysql://localhost:3306/shoppingmall";
	String id = "root"; 
	String pwd = "MySQLqlalf7545!";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, id, pwd);

	/* out.println("<h1>MySQL DB 연결 성공</h1>"); */
	
%>