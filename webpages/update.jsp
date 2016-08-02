<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@include file="DBConnection.jsp" %>
<% 
if(session.getAttribute("id") == "" || session.getAttribute("id") == null) {
	session.setAttribute("flash_msg", "Please Signin to view content!");
	response.sendRedirect("index.jsp");
} 
%>

<%

PreparedStatement pst = null;
ResultSet rs = null, states_rs = null, cities_rs = null;
String student_query = "SELECT * FROM student_tb JOIN city_state ON student_tb.location=city_state.city_id WHERE student_tb.id=?";
String state_list_query = "SELECT state FROM city_state GROUP BY state ORDER BY state";
String city_list_query = "SELECT * FROM city_state WHERE state=?";

String id = request.getParameter("id");

// query for creating student data
pst = con.prepareStatement(student_query);
pst.setString(1, id);
rs = pst.executeQuery();
rs.next();

// query for getting state list
pst = con.prepareStatement(state_list_query);
states_rs = pst.executeQuery();
		
// query for getting cities for a specific state
pst = con.prepareStatement(city_list_query);
pst.setString(1, rs.getString("state"));
cities_rs = pst.executeQuery();

String[] dob = rs.getString("dob").split("-");

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
                        <li class="list-group-item"><a href="new-entry.jsp">Add New Entry</a></li>
                        <li class="list-group-item"><a href="view-all-entries.jsp">View All Entries</a></li>
                        <li class="list-group-item"><a href="find-student.jsp">Find Student</a></li>
                    </ul>
                </div>
                <div class="col-lg-7">
                    <h1 class="page-header">Add New Entry</h1>
                    <form action="update-user.jsp" method="post">
                    	
                            <input type="hidden" name="id" value="<%=rs.getString("id") %>">
                        
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" name="name" value="<%=rs.getString("name") %>" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Department</label>
                            <input type="text" name="department" value="<%=rs.getString("department") %>" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Contact No.</label>
                            <input type="number" name="contact" value="<%=rs.getString("contact_no") %>" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="text" name="email" value="<%=rs.getString("email") %>" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Select Location</label>
                        	<div class="row">
                        		<div class="col-lg-6">
	                        		<select id="state" onchange="getCityList(this)" class="form-control">
	                        			<option>--select state--</option>
	                        			<% while(states_rs.next()) { %>
	                        				<option value="<%=states_rs.getString(1) %>" <% if(rs.getString("state").equals(states_rs.getString(1))){ out.print("selected"); } %>>
	                        					<%=states_rs.getString(1) %>
                        					</option>
	                        			<% } %>
	                        		</select>
                        		</div>
                        		<div class="col-lg-6">
                        			<select name="location" id="city" class="form-control">
		                               <option value="">--select city--</option>
		                               <% while(cities_rs.next()) { %>
	                               	   <option value="<%=cities_rs.getString("city_id") %>" <% if(rs.getString("city_name").equals(cities_rs.getString("city_name"))){ out.print("selected"); } %>>
	                        		   	<%=cities_rs.getString("city_name") %>
                        			   </option>
		                               <% } %>
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
                                        <option value="<%=i%>" <%if(i == Integer.parseInt(dob[2])){ out.print("selected"); } %>><%=i%></option>
                                        <% } %>
                                    </select>
                                </div>
                                <% String months[] = {"--select month--","January","February","March","April", "May","June","July","August","September","October","November","December"};  %>
                                <div class="col-lg-4">
                                    <select name="month" class="form-control">
                                        <% for(int i = 0; i < months.length; i++){ %>
                                        <option value="<%=(i < 10)? "0"+i: i%>" <%if(i == Integer.parseInt(dob[1])){ out.print("selected"); } %>><%=months[i]%></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="col-lg-4">
                                    <select name="year" class="form-control">
                                        <option value="">--select year--</option> 
                                        <% for(int i = 1970; i < 2008; i++) { %>
                                        <option value="<%=i%>" <%if(i == Integer.parseInt(dob[0])){ out.print("selected"); } %>><%=i%></option>
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