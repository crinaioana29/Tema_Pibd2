<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Locatii</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
<h1 align="center">Tabela Locatii:</h1>
<br/>
<p align="center"><a href="nou_Locatie.jsp"><b>Adauga o noua locatie.</b></a> <a
href="home.html"><b>Home</b></a></p>
<%
jb.connect();
String temp=request.getParameter("primaryKey");
long aux = 0;
String Judet = "Dambovita";
String Oras = "Moreni";
if(temp!=null){
	aux=java.lang.Long.parseLong(temp);
	LocationsDAO lc= new LocationsDAO(jb.getConnection());
	ResultSet rs=lc.returnRowAfterIdLocations("locations","idlocation",aux);
	Judet = rs.getString("county");
	Oras = rs.getString("city");
	rs.close();}
jb.disconnect();
%>
<form action="m2_Locatie.jsp" method="post">
<table align="center">
<tr>
<td align="right">IdLocatie:</td>
<td> <input type="text" name="idlocatie" size="30" value="<%= aux%>" readonly/></td>
</tr>
<tr>
<td align="right">Judet:</td>
<td> <input type="text" name="county" size="30" value="<%= Judet%>"/></td>
</tr>
<tr>
<td align="right">Oras:</td>
<td> <input type="text" name="city" size="30" value="<%= Oras%>"/></td>
</tr>
</table><p align="center">
<input type="submit" value="Modifica linia">
</p>
</form>
<p align="center" >
<a href="home.html"><b>Home</b></a>
<br/>
</body>
</html>