<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga angajat</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
<%
String Nume = request.getParameter("Surname");
String Prenume = request.getParameter("First_name");
String Data_Nasterii = request.getParameter("Date_of_Birth");
String Anul_Angajarii = request.getParameter("Empl_Year");
EmployeesModel employee = new EmployeesModel(Nume, Prenume, Data_Nasterii, Anul_Angajarii);
if (Nume != null) {
jb.connect();
EmployeesDAO employeeDAO = new EmployeesDAO(jb.getConnection());
employeeDAO.addEmployees(employee);
jb.disconnect();
%>
<p>Datele au fost adaugate.</p><%
} else {
%>
<h1> Suntem in tabela Angajati.</h1>
<form action="nou_Angajat.jsp" method="post">
<table>
<tr>
<td align="right">Nume:</td>
<td> <input type="text" name="Surname" size="40" /></td>
</tr>
<tr>
<td align="right">Prenume:</td>
<td> <input type="text" name="First_Name" size="30" /></td>
</tr>
<tr>
<td align="right">Data nasterii:</td>
<td> <input type="text" name="Date_of_birth" size="40" /></td>
<tr>
<td align="right">Anul angajarii:</td>
<td> <input type="text" name="Empl_Year" size="40" /></td>
</tr>
</table>
<input type="submit" value="Adauga angajat" />
</form>
<%
}
%>
<br/>
<a href="home.html"><b>Home</b></a>
<br/>
</body>
</html>