<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Angajati</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<style type="text/css">
body {background-image:url("142036.jpg");
	  background-size:1080px;}  
</style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
<h1 align="center">Tabela Angajati:</h1>
<br/>
<p align="center"><a href="nou_Angajat.jsp"><button>Adauga un nou angajat.</button></a> <a
href="home.html"><button>Home</button></a></p>
<%
jb.connect();
String temp=request.getParameter("primaryKey");
long aux = 0;
String Nume = "Popescu";
String Prenume = "Ioana";
String Data_Nasterii = "1995-06-25";
String Anul_Angajarii = "2021-03-14";
if(temp!=null){
	aux=java.lang.Long.parseLong(temp);
	EmployeesDAO employeesDAO= new EmployeesDAO(jb.getConnection());
	ResultSet rs=employeesDAO.returnRowAfterIdEmployees("employees","idemloyee",aux);
	Nume = rs.getString("surname");
	Prenume =  rs.getString("first_name");
	Data_Nasterii =  rs.getString("date_of_birth");
	Anul_Angajarii =  rs.getString("empl_year");
	rs.close();}
jb.disconnect();
%>
<form action="m2_Angajat.jsp" method="post">
<table align="center">
<tr>
<td align="right">IdAngajat:</td>
<td> <input type="text" name="idangajat" size="30" value="<%= aux%>" readonly/></td>
</tr>
<tr>
<td align="right">Nume:</td>
<td> <input type="text" name="surname" size="30" value="<%= Nume%>"/></td>
</tr>
<tr>
<td align="right">Prenume:</td>
<td> <input type="text" name="first_name" size="30" value="<%= Prenume%>"/></td>
</tr>
<tr>
<td align="right">Data nasterii:</td>
<td> <input type="text" name="date_of_birth" size="30" value="<%= Data_Nasterii%>"/></td>
</tr>
<tr>
<td align="right">Anul angajarii:</td>
<td> <input type="text" name="empl_year" size="30" value="<%= Anul_Angajarii%>"/></td>
</tr>
</table><p align="center">
<input type="submit" value="Modifica linia">
</p>
</form>
<p align="center" >
<a href="home.html"><button>Home</button></a>
<br/>
</body>
</html>