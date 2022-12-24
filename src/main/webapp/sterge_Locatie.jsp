<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Locatie</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
<%
String[] s = request.getParameterValues("primarykey");
jb.connect();
LocationsDAO lc = new LocationsDAO(jb.getConnection());
lc.deleteLocations(s);
jb.disconnect();
%>
<p align="center">
<a href="home.html"><b>Home</b></a>
<br/>
</p>
</body>
</html>