<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("id") == "" || session.getAttribute("id") == null) {
	session.setAttribute("flash_msg", "Please Signin to view content!");
	response.sendRedirect("index.jsp");
} 
%>
<%@include file="DBConnection.jsp" %>
<%@page import="java.sql.*" %>
<%
String id = request.getParameter("id");
if(id == "" || id == null) {
	response.sendRedirect("home.jsp");
}
PreparedStatement pst = null;
ResultSet rs = null;
String sql = "SELECT * FROM student_tb WHERE id=?";

pst = con.prepareStatement(sql);
pst.setString(1, id);
rs = pst.executeQuery();

rs.next();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student Information System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <h1 class="text-center">Student Information System</h1>
               
        <nav class="navbar" style="background-color: #633974;">
            <div class="container">
                <div class="navbar-header">
                    <a href="home.jsp" class="navbar-brand">Home</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="contactus.jsp">Contact Us</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                	<li class="active"><p style="font-weight: bold; color:#fff;" class="navbar-text">Hello, <%=session.getAttribute("name")%></p></li>
                	<li><a href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </nav>
        
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <h3 class="page-header text-center">Menu</h3>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="new-entry.html">Add New Entry</a></li>
                        <li class="list-group-item"><a href="view-all-entries.html">View All Entries</a></li>
                        <li class="list-group-item"><a href="find-student.html">Find Student</a></li>
                    </ul>
                </div>
                <div class="col-lg-7">
                    <h1 class="page-header">Student Information</h1>
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th>ID</th>
                                <td><%=rs.getString("id") %></td>
                            </tr>
                            <tr>
                                <th>Name</th>
                                <td><%=rs.getString("name") %></td>
                            </tr>
                            <tr>
                                <th>Department</th>
                                <td><%=rs.getString("department") %></td>
                            </tr>
                            <tr>
                                <th>Location</th>
                                <td><%=rs.getString("location") %></td>
                            </tr>
                            <tr>
                                <th>DOB</th>
                                <td><%=rs.getString("dob") %></td>
                            </tr>
                            <tr>
                                <th>Phone</th>
                                <td>C<%=rs.getString("contact_no") %></td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td><%=rs.getString("email") %></td>
                            </tr>
                        </table>
                </div>                
            </div>
        </div>
        <div style="height: 50px;"></div>
        <div class="text-center footer" style="">
            &copy;  2016 Meghnad Saha Institute of Technology
        </div>
    </body>
</html>
<% con.close(); %>