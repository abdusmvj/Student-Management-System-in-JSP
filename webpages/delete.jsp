<%-- 
    Document   : delete
    Created on : 29-Jul-2016, 12:00:39
    Author     : @Siddhartha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="DBConnection.jsp" %>
<%@page import="java.sql.*"%>
<%
    PreparedStatement pst = null;
    ResultSet rs = null;
    String sql = "DELETE FROM student_tb WHERE id=?";
    String id = request.getParameter("id"); 
    
    // preparing the query
    pst = con.prepareStatement(sql);
    pst.setString(1, id);
    pst.executeUpdate(); // executing the query
    con.close();
    
    session.setAttribute("flash_del_msg", "Student was successfully deleted form entry list!");    
    response.sendRedirect("view-all-entries.jsp");
%>