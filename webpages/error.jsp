<%@page isErrorPage="true" %>
<%@page import="java.time.ZoneId"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Oops! The website is under construction</title>
	<link href="css/404style.css" rel="stylesheet" type="text/css"  media="all" />
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css"  media="all" />
</head>
<body>
	<!--start-wrap--->
	<div class="wrap">
		<!--start-content------>
		<div class="content">
		<div style="width: 70%; margin: auto;">
			<img src="img/error-img.png" title="error" />
			<p>
				<span><label></label></span>
				<!-- The website is under construction please try again later... -->
				
			</p>
			<a href="home.jsp">Back To Home</a>
			<div class="copy-right">
				<p>&copy; <%=new Date().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getYear()%> All rights Reserved | PCS Global pvt. ltd.</p>
			</div>
		</div>
		</div>
		<!--End-Content------>
	</div>
	<!--End-wrap--->
	<div class="container alert alert-danger">
		<%=exception.toString()%>
		
	</div>
</body>
</html>
