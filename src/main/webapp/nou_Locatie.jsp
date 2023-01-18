<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga locatie</title>
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
String Judet = request.getParameter("County");
String Oras = request.getParameter("City");
LocationsModel lc = new LocationsModel(Judet, Oras);
if (Judet != null) {
jb.connect();
LocationsDAO locationDAO = new LocationsDAO(jb.getConnection());
locationDAO.addLocations(lc);
jb.disconnect();
%>
<h1 align="center" style="color:black;font-family: Verdana, sans-serif;">Datele au fost adaugate.</h1><%
} else {
%>
<h1 align="center" style="color:black;font-family: Verdana, sans-serif;"> Adaugati o noua locatie:</h1>
<form action="nou_Locatie.jsp" method="post">
<table style="margin-left: auto;
  margin-right: auto;">
<tr>
<td align="center">Judet:</td>
<td> <input type="text" name="County" size="40" /></td>
</tr>
<tr style="text-align: center; 
    vertical-align: middle;">
<td align="center">Oras:</td>
<td> <input type="text" name="City" size="30" /></td>
</tr>
</table>
<p align="center">
<input type="submit" value="Adauga locatie" />
</form>
<%
}
%>
<p align="center">
<a href="home.html"><button>Home</button></a>
<br/>
</body>
</html>