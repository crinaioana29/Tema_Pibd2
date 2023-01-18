<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Locatii</title>
</head>
<style type="text/css">
body {background-image:url("142036.jpg");
	  background-size:1080px;}  
</style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
<h1 align="center"> Tabela Locatii:</h1>
<br/>
<p align="center"><a href="nou_Locatie.jsp"><button>Adauga o noua locatie.</button></a> <a
href="home.html"><button>Home</button></a></p>
<form action="m1_Locatie.jsp" method="post">
<table border="1" align="center">
<tr>
<td><b>Mark:</b></td>
<td><b>IdLocatie:</b></td>
<td><b>Judet:</b></td>
<td><b>Oras:</b></td>
</tr>
<%
jb.connect();
LocationsDAO lc = new LocationsDAO(jb.getConnection());
ResultSet rs = lc.showLocations();
long x;
while (rs.next()) {
x = rs.getLong("idlocation");
%>
<tr>
<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
<td><%= x%></td>
<td><%= rs.getString("County")%></td>
<td><%= rs.getString("City")%></td>
<%
}
%>
</tr>
</table><br/>
<p align="center">
<input type="submit" value="Modifica linia">
</p>
</form>
<%
jb.disconnect();%>
<p align="center">
<a href="home.html"><button>Home</button></a>
<br/>
</p>
</body>
</html>