<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DBConnection.jsp" %>
<%@page import="java.sql.*" %>
<%

PreparedStatement pst = null;
ResultSet rs = null;

String sql = "UPDATE student_tb SET name=?,department=?,location=?,dob=?,contact_no=?,email=? WHERE id=?";
String id = request.getParameter("id");
String name = request.getParameter("name");
String department = request.getParameter("department");
String location = request.getParameter("location");

String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");

String contact = request.getParameter("contact");
String email = request.getParameter("email");

String dob = year+"-"+month+"-"+day;

pst = con.prepareStatement(sql);
pst.setString(1, name);
pst.setString(2, department);
pst.setString(3, location);
pst.setString(4, dob);
pst.setString(5, contact);
pst.setString(6, email);
pst.setString(7, id);
pst.executeUpdate();
con.close();

session.setAttribute("flash_update_msg", "Student information updated successfully!");
response.sendRedirect("view-all-entries.jsp");
%>