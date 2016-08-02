<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

session.removeAttribute("id");
session.removeAttribute("name");
session.removeAttribute("email");

session.setAttribute("flash_msg_logout", "You have logged out successfully!");

response.sendRedirect("index.jsp");

%>