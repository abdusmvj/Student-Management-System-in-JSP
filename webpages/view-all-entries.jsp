<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConnection.jsp" %>
<% 
if(session.getAttribute("id") == "" || session.getAttribute("id") == null) {
	session.setAttribute("flash_msg", "Please Signin to view content!");
	response.sendRedirect("index.jsp");
} 
%>
<%@page import="java.sql.*" %>
<%

PreparedStatement pst = null;
ResultSet rs = null;
String sql = "SELECT * FROM student_tb AS st JOIN city_state AS cs ON st.location=cs.city_id";

pst = con.prepareStatement(sql);
rs = pst.executeQuery();

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student Information System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script>
            function confirm_delete() {
                return confirm("Are you sure want to delete?");
            }
        </script>
    </head>
    <body>
        <h1 class="page-header text-center">Student Information System</h1>
               
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
      			<div class="col-lg-7">
      				<h2 class="page-header">Students Listing</h2>
      			</div>
     			<div class="col-lg-5" style="height: 100%;">
     			<p class="text-right page-header">
     				<a class="btn btn-primary" href="home.jsp">Back to Home</a>
               		<a class="btn btn-success" href="new-entry.jsp">Create New Entry</a>
          		</p>
      			</div>
      		</div>
        	
        	
            <div class="row">
            	<% if(session.getAttribute("flash_new_entry") != "" && session.getAttribute("flash_new_entry") != null) { %>
		   			<div class="alert alert-info text-center"><%=session.getAttribute("flash_new_entry")%></div>
		  		<% session.removeAttribute("flash_new_entry"); } %>
		  		<% if(session.getAttribute("flash_del_msg") != "" && session.getAttribute("flash_del_msg") != null) { %>
		   			<div class="alert alert-info text-center"><%=session.getAttribute("flash_del_msg")%></div>
		  		<% session.removeAttribute("flash_del_msg"); } %>
		  		<% if(session.getAttribute("flash_update_msg") != "" && session.getAttribute("flash_update_msg") != null) { %>
		   			<div class="alert alert-info text-center"><%=session.getAttribute("flash_update_msg")%></div>
		  		<% session.removeAttribute("flash_update_msg"); } %>
		  		<!-- <div class="col-lg-3">
                    <h3 class="page-header text-center">Menu</h3>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="new-entry.jsp">Add New Entry</a></li>
                        <li class="list-group-item"><a href="view-all-entries.jsp">View All Entries</a></li>
                        <li class="list-group-item"><a href="find-student.jsp">Find Student</a></li>
                    </ul>
                </div> -->
                <div class="col-lg-12">
                    
                    <table class="table table-hover table-bordered">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Department</th>
                            <th>Location</th>
                            <th>DOB</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th class="text-right">Action</th>
                        </tr>
                        <% while(rs.next()) { %>
                        <tr>
                            <td><%=rs.getString("id") %></td>
                            <td><%=rs.getString("name") %></td>
                            <td><%=rs.getString("department") %></td>
                            <td><%=rs.getString("city_name")+", "+rs.getString("state") %></td>
                            <td><%=rs.getString("dob") %></td>
                            <td><%=rs.getString("contact_no") %></td>
                            <td><%=rs.getString("email") %></td>
                            <td class="text-right">
                            	<a class="btn btn-success btn-xs" href="update.jsp?id=<%=rs.getInt("id")%>">Update</a>
                                <a class="btn btn-danger btn-xs" onclick="return confirm_delete()" href="delete.jsp?id=<%=rs.getInt("id")%>">delete</a>
                           	</td>
                        </tr>
                        <% } %>
                       <!--  <tr>
                        	<td colspan="8">
                        		Pagination code coming soon
                        	</td>
                        </tr> -->
                    </table>
                </div>                
            </div>
        </div>
        
        
        <div style="height: 30px;"></div>
        <div class="text-center footer" style="">
            &copy;  2016 Meghnad Saha Institute of Technology
        </div>
    </body>
</html>
<% con.close(); %>