<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga farmacie</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
<%
String Nume = request.getParameter("Name");
int Anul_Infiintarii=0;
if(request.getParameter("Est_year")!=null)
Anul_Infiintarii = Integer.valueOf(request.getParameter("Est_year"));
PharmaciesModel pharmacies = new PharmaciesModel(Nume, Anul_Infiintarii);
if (Nume != null) {
jb.connect();
PharmaciesDAO pharmacyDAO = new PharmaciesDAO(jb.getConnection());
pharmacyDAO.addPharmacies(pharmacies);
jb.disconnect();
%>
<p>Datele au fost adaugate.</p><%
} else {
%>
<h1> Suntem in tabela Farmacii.</h1>
<form action="nou_Farmacie.jsp" method="post">
<table>
<tr>
<td align="right">Nume:</td>
<td> <input type="text" name="Name" size="40" /></td>
</tr>
<tr>
<td align="right">Anul_Infiintarii:</td>
<td> <input type="text" name="Est_year" size="30" /></td>
</tr>
</table>
<input type="submit" value="Adauga farmacie" />
</form>
<%
}
%>
<br/>
<a href="home.html"><b>Home</b></a>
<br/>
</body>
</html>