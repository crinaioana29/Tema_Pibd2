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
        <h1 align="center"> Tabela Farmacii:</h1>
        <br/>
        <p align="center"><a href="nou_Farmacie.jsp"><b>Adauga o noua farmacie.</b></a> <a href="home.html"><b>Home</b></a></p>
        <%
            jb.connect();
        	long aux= 0;
        	String temp=request.getParameter("primaryKey");
        	if(temp!=null){
            aux = java.lang.Long.parseLong(request.getParameter("idpharmacy"));}
            String Nume = request.getParameter("Name");
            String Anul_Infiintarii = request.getParameter("est_year");
            
            String[] campuri = {"name", "est_year"};
            String[] valori = {"Nume", "Anul_Infiintarii"};
            PharmaciesDAO pharmaciesDAO= new PharmaciesDAO(jb.getConnection());
            pharmaciesDAO.modifyPharmacies("pharmacies", "idpharmacy", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="home.html"><b>Home</b></a>
            <br/>
    </body>
</html>