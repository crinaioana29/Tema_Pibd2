<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Farmacii</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
<h1 align="center"> Tabela Farmacii:</h1>
<br/>
<p align="center"><a href="nou_Farmacie.jsp"><b>Adauga o noua farmacie.</b></a> <a
href="home.html"><b>Home</b></a></p>
<form action="m1_Farmacie.jsp" method="post">
<table border="1" align="center">
<tr>
<td><b>Mark:</b></td>
<td><b>IdFarmacie:</b></td>
<td><b>Nume:</b></td>
<td><b>Anul infiintarii:</b></td>
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
<br/>
<p align="center">
<a href="home.html"><b>Home</b></a>
<br/>
</p>
</body>
</html>