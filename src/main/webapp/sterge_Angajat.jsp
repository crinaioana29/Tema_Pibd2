<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Angajat</title>
</head>
<style type="text/css">
body {background-image:url("142036.jpg");
	  background-size:1080px;}
	  	  
</style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
<%
String[] s = request.getParameterValues("primarykey");
jb.connect();
EmployeesDAO employee = new EmployeesDAO(jb.getConnection());
employee.deleteEmployees(s);
jb.disconnect();
%>
<h1 align="center" style="color:black;font-family: Verdana, sans-serif;"> Datele au fost sterse.</h1>
<p align="center">
<a href="home.html"><button>Home</button></a>
<br/>
</p>
</body>
</html>