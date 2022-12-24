<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Farmacii</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
<h1 align="center">Tabela Farmacii:</h1>
<br/>
<p align="center"><a href="nou_Farmacie.jsp"><b>Adauga o noua farmacie.</b></a> <a
href="home.html"><b>Home</b></a></p>
<%
jb.connect();
String temp=request.getParameter("primaryKey");
long aux = 0;
String Nume = "Catena";
int Anul_Infintarii=0;
if(temp!=null){
	aux=java.lang.Long.parseLong(temp);
	PharmaciesDAO pharmaciesDAO= new PharmaciesDAO(jb.getConnection());
	ResultSet rs=pharmaciesDAO.returnRowAfterIdPharmacies("pharmacies","idpharmacy",aux);
	Nume = rs.getString("name");
	Anul_Infintarii = rs.getInt("est_year");
	rs.close();}
jb.disconnect();
%>
<form action="m2_Farmacie.jsp" method="post">
<table align="center">
<tr>
<td align="right">IdFarmacie:</td>
<td> <input type="text" name="idfarmacie" size="30" value="<%= aux%>" readonly/></td>
</tr>
<tr>
<td align="right">Nume:</td>
<td> <input type="text" name="name" size="30" value="<%= Nume%>"/></td>
</tr>
<tr>
<td align="right">Anul Infintarii:</td>
<td> <input type="text" name="est_year" size="30" value="<%= Anul_Infintarii%>"/></td>
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