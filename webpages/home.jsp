<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("id") == "" || session.getAttribute("id") == null) {
	session.setAttribute("flash_msg", "Please Signin to view content!");
	response.sendRedirect("index.jsp");
} 
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
                <h2 class="page-header text-center">Dashboard</h2>
                <% if(session.getAttribute("login_success") != "" && session.getAttribute("login_success") != null) { %>
	            	<div class="alert alert-success text-center"><%=session.getAttribute("login_success")%></div>
	            <%	session.removeAttribute("login_success"); } %>
                <div class="col-lg-4"></div>
                <div class="col-lg-4 well">                                    
                    <ul class="list-group">
                        <li class="list-group-item text-center"><a href="new-entry.jsp">CREATE NEW STUDENT</a></li>
                        <li class="list-group-item text-center"><a href="view-all-entries.jsp">VIEW ALL STUDENTS</a></li>
                        <li class="list-group-item text-center"><a href="find-student.jsp">FIND STUDENT</a></li>
                    </ul>
                </div>                
                <div class="col-lg-4"></div>                
            </div>
        </div>
        
        
        <div style="height: 30px;"></div>
        <div class="text-center footer" style="">
            &copy;  2016 Meghnad Saha Institute of Technology
        </div>
    </body>
</html>
