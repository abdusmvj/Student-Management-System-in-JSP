<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DBConnection.jsp" %>
<%@page import="java.sql.*" %>
<%

PreparedStatement pst = null;
ResultSet rs = null;

String sql = "INSERT INTO student_tb(id,name,department,location,dob,contact_no,email) VALUES(DEFAULT,?,?,?,?,?,?)";

/* String id = request.getParameter("id"); */
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
/* pst.setString(1, id); */
pst.setString(1, name);
pst.setString(2, department);
pst.setString(3, location);
pst.setString(4, dob);
pst.setString(5, contact);
pst.setString(6, email);

pst.executeUpdate();
con.close();

session.setAttribute("flash_new_entry", "New Entry was successfully created!");
response.sendRedirect("view-all-entries.jsp");

%>