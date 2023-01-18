<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Farmacii</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<style type="text/css">
body {
	background-image: url("142036.jpg");
	background-size: 1080px;
}
</style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Farmacii:</h1>
	<br />
	<p align="center">
		<a href="nou_Farmacie.jsp"><button>Adauga o noua
				farmacie.</button></a> <a href="home.html"><button>Home</button></a>
	</p>
	<%
	String temp = request.getParameter("primarykey");
	Long primary_key = 0L;
	if (temp != null)
		primary_key = Long.valueOf(primary_key);
	%>
	<form action="m2_Farmacie.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">IdFarmacie:</td>
				<td><input type="text" name="primarykey" size="30"
					value="<%=temp%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Nume:</td>
				<td><input type="text" name="name" size="30" "/></td>
			</tr>
			<tr>
				<td align="right">Anul infintarii:</td>
				<td><input type="text" name="est_year" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Nume angajat:</td>
				<td><input type="text" name="firstname" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Prenume:</td>
				<td><input type="text" name="surname" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Data nasterii:</td>
				<td><input type="text" name="date_of_birth" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Data angajarii:</td>
				<td><input type="text" name="empl_date" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Oras:</td>
				<td><input type="text" name="city" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Judet:</td>
				<td><input type="text" name="county" size="30" /></td>
			</tr>
		</table>
		<p align="center">
			<input type="submit" value="Modifica linia">
		</p>
	</form>
	<p align="center">
		<a href="home.html"><button>Home</button></a> <br />
</body>
</html>