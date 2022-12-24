<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Angajati</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Angajati:</h1>
        <br/>
        <p align="center"><a href="nou_Angajat.jsp"><b>Adauga un nou angajat.</b></a> <a href="home.html"><b>Home</b></a></p>
        <%
            jb.connect();
        	long aux= 0;
        	String temp=request.getParameter("primaryKey");
        	if(temp!=null){
            aux = java.lang.Long.parseLong(request.getParameter("idemployee"));}
            String Nume = request.getParameter("Surname");
            String Prenume = request.getParameter("First_Name");
            String Data_Nasterii = request.getParameter("date_of_birth");
            String Anul_Angajarii = request.getParameter("empl_year");
            
            String[] campuri = {"surname", "first_name", "date_of_birth", "empl_year"};
            String[] valori = {"Nume", "Prenume", "Data_Nasterii", "Anul_Angajarii"};
            EmployeesDAO employeesDAO= new EmployeesDAO(jb.getConnection());
            employeesDAO.modifyEmployees("employees", "idemployee", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="home.html"><b>Home</b></a>
            <br/>
    </body>
</html>