<%@page language="java" %>
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
        <h1 class="text-center jumbotron">Student Information System</h1>
               
   		<div class="container">
   		<% if(session.getAttribute("flash_msg") != "" && session.getAttribute("flash_msg") != null) { %>
   			<div class="alert alert-warning text-center">Alert! <%=session.getAttribute("flash_msg")%></div>
  		<% session.removeAttribute("flash_msg"); } %>
   		</div>
   		<div class="container">
   		<% if(session.getAttribute("flash_msg_logout") != "" && session.getAttribute("flash_msg_logout") != null) { %>
   			<div class="alert alert-info text-center"><%=session.getAttribute("flash_msg_logout")%></div>
  		<% session.removeAttribute("flash_msg_logout"); } %>
   		</div>
   		<div class="container">
   		<% if(session.getAttribute("flash_err_login") != "" && session.getAttribute("flash_err_login") != null) { %>
   			<div class="alert alert-danger text-center">Oops! <%=session.getAttribute("flash_err_login")%></div>
  		<% session.removeAttribute("flash_err_login"); } %>
   		</div>
        <div class="container" style="width:350px; border: 1px solid #ccc; padding: 20px;">
            <h3 class="page-header" style="font-weight: bold;">Signin</h3>
            <form action="login.jsp" method="post" onsubmit="return authenticate()">
                <div class="form-group">
                    <label>Enter Email</label>
                    <input type="text" id="email" name="email" class="form-control">
                </div>
                <div class="form-group">
                    <label>Enter Password</label>
                    <input type="password" id="password" name="password" class="form-control">
                </div>
                <input type="submit" value="Login" onclick="" class="btn btn-primary">
            </form>
        </div>
        
        
        <div style="height: 30px;"></div>
        <div class="text-center footer" style="">
            &copy;  2016 Meghnad Saha Institute of Technology
        </div>
    </body>
</html>
