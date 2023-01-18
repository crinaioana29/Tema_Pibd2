<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Locatii</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <style type="text/css">
body {background-image:url("142036.jpg");
	  background-size:1080px;}  
</style>
</head>
    <style type="text/css">
body {background-image:url("142036.jpg");
	  background-size:1080px;}  
</style>
</head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Locatii:</h1>
        <br/>
        <p align="center"><a href="nou_Locatie.jsp"><button>Adauga o noua locatie.</button></a> <a href="home.html"><button>Home</button></a></p>
        <%
            jb.connect();
        	long aux= 0;
        	String temp=request.getParameter("primaryKey");
        	if(temp!=null){
            aux = java.lang.Long.parseLong(request.getParameter("idlocation"));}
            String Judet = request.getParameter("County");
            String Oras = request.getParameter("City");
            
            String[] campuri = {"county", "city"};
            String[] valori = {"Judet", "Oras"};
            LocationsDAO lc= new LocationsDAO(jb.getConnection());
            lc.modifyLocations("locations", "idlocation", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate!</h1>
        <p align="center">
            <a href="home.html"><button>Home</button></a>
            <br/>
    </body>
</html>
