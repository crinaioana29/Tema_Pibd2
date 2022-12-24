<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga locatie</title>
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
<p>Datele au fost adaugate.</p><%
} else {
%>
<h1> Suntem in tabela Locatie.</h1>
<form action="nou_Locatie.jsp" method="post">
<table>
<tr>
<td align="right">Judet:</td>
<td> <input type="text" name="County" size="40" /></td>
</tr>
<tr>
<td align="right">Oras:</td>
<td> <input type="text" name="City" size="30" /></td>
</tr>
</table>
<input type="submit" value="Adauga locatie" />
</form>
<%
}
%>
<br/>
<a href="home.html"><b>Home</b></a>
<br/>
</body>
</html>