<%@page import="java.sql.*"%>
<%@page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConnection.jsp"%>
<%@page import="org.json.simple.JSONObject" %>
<%@page import="org.json.simple.JSONArray" %>
<%
String state = request.getParameter("state");
String sql = "SELECT city_id,city_name FROM city_state WHERE state=? ORDER BY city_name";

PreparedStatement pst = con.prepareStatement(sql);
pst.setString(1, state);
ResultSet rs = pst.executeQuery();
ResultSetMetaData rsmd = rs.getMetaData();

JSONArray json_array = new JSONArray();

while(rs.next()) {
	
	JSONObject obj = new JSONObject();
	obj.put("cityId", rs.getString("city_id"));
	obj.put("cityName", rs.getString("city_name"));
	json_array.add(obj);
	
}

out.print(json_array);

%>
