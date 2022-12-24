<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*,dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Angajati</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
<h1 align="center"> Tabela Angajati:</h1>
<br/>
<p align="center"><a href="nou_Angajat.jsp"><b>Adauga un nou angajat.</b></a> <a
href="home.html"><b>Home</b></a></p>
<form action="sterge_Angajat.jsp" method="post">
<table border="1" align="center">
<tr>
<td><b>Mark:</b></td>
<td><b>IdAngajat:</b></td>
<td><b>Nume:</b></td>
<td><b>Prenume:</b></td>
<td><b>Data nasterii:</b></td>
<td><b>Anul angajarii:</b></td>
</tr>
<%
jb.connect();
EmployeesDAO employeesDAO = new EmployeesDAO(jb.getConnection());
ResultSet rs = employeesDAO.showEmployees();
long x;
while (rs.next()) {
x = rs.getLong("idemployee");
%>
<tr>
<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
<td><%= rs.getString("Surname")%></td>
<td><%= rs.getString("First_name")%></td>
<td><%= rs.getString("Date_of_birth")%></td>
<td><%= rs.getString("Empl_year")%></td>
<%
}
%>
</tr>
</table><br/>
<p align="center">
<input type="submit" value="Sterge liniile marcate">
</p>
</form>
<%
rs.close();
jb.disconnect();
%>
<br/>
<p align="center">
<a href="home.html"><b>Home</b></a>
<br/>
</p>
</body>
</html>