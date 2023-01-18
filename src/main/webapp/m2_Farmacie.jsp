<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, dao.*,models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Farmacii</title>
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
        <h1 align="center"> Tabela Farmacii:</h1>
        <br/>
        <p align="center"><a href="nou_Farmacie.jsp"><button>Adauga o noua farmacie.</button></a> <a href="home.html"><button>Home</button></a></p>
        <%
            jb.connect();
        	long aux= 0;
        	String temp=request.getParameter("primarykey");
        	if(temp!=null){
            	aux = java.lang.Long.parseLong(temp);
                String Nume = request.getParameter("name");
                String Anul_Infiintarii = request.getParameter("est_year");
                
                String[] campuri = {"name", "est_year"};
                String[] valori = {Nume, Anul_Infiintarii};
                
                PharmaciesDAO pharmaciesDAO= new PharmaciesDAO(jb.getConnection());
                
                String surname=request.getParameter("surname");
                String first_name=request.getParameter("firstname");
                String birth_date=request.getParameter("date_of_birth");
                String empl_date=request.getParameter("empl_date");        
                EmployeesModel employee=new EmployeesModel(surname,first_name,birth_date,empl_date);
                
                String city=request.getParameter("city");
                String county=request.getParameter("county");
                LocationsModel location=new LocationsModel(city,county);
                pharmaciesDAO.modifyPharmacies("pharmacies", "idpharmacy", aux, campuri, valori,location,employee);
            }

            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="home.html"><button>Home</button></a>
            <br/>
    </body>
</html>