<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Farmacii</title>
</head>
<style type="text/css">
body {background-image:url("142036.jpg");
	  background-size:1080px;}  
</style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
<h1 align="center"> Tabela Farmacii:</h1>
<br/>
<p align="center"><a href="nou_Farmacie.jsp"><button>Adauga o noua farmacie.</button></a> <a
href="home.html"><button>Home</button></a></p>
<form action="m1_Farmacie.jsp" method="post">
<table border="1" align="center">
<tr>
<td><b>Mark:</b></td>
<td><b>IdFarmacie:</b></td>
<td><b>Nume farmacie:</b></td>
<td><b>Anul infiintarii:</b></td>
<td><b>Judet:</b></td>
<td><b>Oras:</b></td>
<td><b>Nume angajat:</b></td>
<td><b>Prenume angajat:</b></td>
<td><b>Data nasterii:</b></td>
<td><b>Anul angajarii:</b></td>
</tr>
<%
jb.connect();
PharmaciesDAO pharmacy = new PharmaciesDAO(jb.getConnection());
ResultSet rs = pharmacy.showPharmacies();
long x;
while (rs.next()) {
x = rs.getLong("idpharmacy");
%>
<tr>
<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
<td><%= x%></td>
<td><%= rs.getString("Name")%></td>
<td><%= rs.getString("Est_Year")%></td>
<td><%= rs.getString("County")%></td>
<td><%= rs.getString("City")%></td>
<td><%= rs.getString("Surname")%></td>
<td><%= rs.getString("First_Name")%></td>
<td><%= rs.getString("Date_of_birth")%></td>
<td><%= rs.getString("Empl_year")%></td>
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