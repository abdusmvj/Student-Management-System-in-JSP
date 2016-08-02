<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.FileReader"%>
<%@include file="DBConnection.jsp" %>
<% 
if(session.getAttribute("id") == "" || session.getAttribute("id") == null) {
	session.setAttribute("flash_msg", "Please Signin to view content!");
	response.sendRedirect("index.jsp");
} 
%>
<%

String sql = "SELECT state from city_state GROUP BY state ORDER BY state";
PreparedStatement pst = con.prepareStatement(sql);
ResultSet rs = pst.executeQuery();

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student Information System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script src="js/script.js"></script>
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
                <div class="col-lg-3">
                    <h3 class="page-header text-center">Menu</h3>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="new-entry.jsp">Add New Entry</a></li>
                        <li class="list-group-item"><a href="view-all-entries.jsp">View All Entries</a></li>
                        <li class="list-group-item"><a href="find-student.jsp">Find Student</a></li>
                    </ul>
                </div>
                <div class="col-lg-7">
                    <h1 class="page-header">Add New Entry</h1>
                    <form action="add-student.jsp" method="post">
                    	<div class="form-group">
                            <label>ID</label>
                            <input type="text" name="id" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" name="name" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Department</label>
                            <input type="text" name="department" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Contact No.</label>
                            <input type="number" name="contact" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="text" name="email" class="form-control">
                        </div>
                        <div class="form-group">
                        	<label>Select Location</label>
                        	<div class="row">
                        		<div class="col-lg-6">
	                        		<select id="state" onchange="getCityList(this)" class="form-control">
	                        			<option>--select state--</option>
	                        			<% while(rs.next()) { %>
	                        				<option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
	                        			<% } %>
	                        		</select>
                        		</div>
                        		<div class="col-lg-6">
                        			<select name="location" id="city" class="form-control">
		                               <option value="">--select city--</option>
		                            </select>	
                        		</div>
                       		</div>                            
                        </div>
                        <div class="form-group">
                            <label>Select Date Of Birth</label>
                            <div class="row">
                                <div class="col-lg-4">
                                    <select name="day" class="form-control">
                                        <option value="">--Select Day--</option> 
                                        <% for(int i = 1; i <= 31; i++) { %>
                                        <option value="<%=i%>"><%=i%></option>
                                        <% } %>
                                    </select>
                                </div>
                                <% String months[] = {"--select month--","January","February","March","April", "May","June","July","August","September","October","November","December"};  %>
                                <div class="col-lg-4">
                                    <select name="month" class="form-control">
                                        <% for(int i = 0; i < months.length; i++){ %>
                                        <option value="<%=(i < 10)? "0"+i: i%>"><%=months[i]%></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="col-lg-4">
                                    <select name="year" class="form-control">
                                    	<option value="">--select year--</option>
                                        <% for(int i = 1970; i < 2008; i++) { %>
                                        <option value="<%=i%>"><%=i%></option>
                                        <% } %>
                                    </select>
                                </div>
                            </div>
                            
                        </div>
                        <input type="submit" class="btn btn-primary" value="Submit">   
                        <input type="reset" class="btn btn-warning" value="reset">
            
                    </form>
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