<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga farmacie</title>
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
String nume = request.getParameter("Name");
int anul_infiintarii = 0;
String city = request.getParameter("city");
String county = request.getParameter("county");
String surname = request.getParameter("surname");
String first_name = request.getParameter("first_name");
String date_of_birth = request.getParameter("date_of_birth");
String empl_year = request.getParameter("empl_year");
if(request.getParameter("Est_year")!=null)
anul_infiintarii = Integer.valueOf(request.getParameter("Est_year"));
PharmaciesModel pharmacies = new PharmaciesModel(nume, anul_infiintarii);
LocationsModel locations = new LocationsModel(county, city);
EmployeesModel employees = new EmployeesModel(surname, first_name, date_of_birth, empl_year);
if (nume != null) {
jb.connect();
PharmaciesDAO pharmacyDAO = new PharmaciesDAO(jb.getConnection());
pharmacyDAO.addPharmacies(pharmacies, locations, employees);
jb.disconnect();
%>
<p  align="center" style="color:black;font-family: Verdana, sans-serif;">Datele au fost adaugate.</p><%
} else {
%>
<h1 align="center" style="color:black;font-family: Verdana, sans-serif;"> Adaugati o noua farmacie:</h1>
<form action="nou_Farmacie.jsp" method="post">
<table style="margin-left: auto;
  margin-right: auto;">
<tr>
<td align="right">Nume:</td>
<td> <input type="text" name="Name" size="40" /></td>
</tr>
<tr>
<td align="right">Anul infiintarii:</td>
<td> <input type="text" name="Est_year" size="30" /></td>
</tr>
<tr>
<td align="right">Oras:</td>
<td> <input type="text" name="city" size="30" /></td>
</tr>
<tr>
<td align="right">Judet:</td>
<td> <input type="text" name="county" size="30" /></td>
</tr>
<tr>
<td align="right">Nume angajat:</td>
<td> <input type="text" name="surname" size="30" /></td>
</tr>
<tr>
<td align="right">Prenume angajat:</td>
<td> <input type="text" name="first_name" size="30" /></td>
</tr>
<tr>
<td align="right">Data nasterii:</td>
<td> <input type="text" name="date_of_birth" size="30" /></td>
</tr>
<tr>
<td align="right">Anul angajarii:</td>
<td> <input type="text" name="empl_year" size="30" /></td>
</tr>
</table>
<p align="center">
<input type="submit" value="Adauga farmacie" />
</form>
<%
}
%>
<p align="center">
<a href="home.html"><button>Home</button></a>
<br/>
</body>
</html>