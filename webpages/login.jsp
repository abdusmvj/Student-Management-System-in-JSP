<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement,java.sql.ResultSet" %>
<%@ include file="DBConnection.jsp"%>
<%
PreparedStatement pst = null;
ResultSet rs = null;
String sql = "SELECT * FROM admin WHERE email=? AND password=?";

String email = request.getParameter("email");
String password = request.getParameter("password");
int flag= 0;


pst = con.prepareStatement(sql);
pst.setString(1, email);
pst.setString(2, password);

rs = pst.executeQuery();

while(rs.next()) {
	flag++;
}
if(flag > 0) {
	rs.beforeFirst();
	rs.next();
	session.setAttribute("name", rs.getString("name"));
	session.setAttribute("email", rs.getString("email"));
	session.setAttribute("id", rs.getString("id"));
	session.setAttribute("login_success", "Login Successfull!");
	con.close();
	response.sendRedirect("home.jsp");
} else {
	session.setAttribute("flash_err_login", "Invalid Email ID or Password!");
	con.close();
	response.sendRedirect("index.jsp");
}


%>