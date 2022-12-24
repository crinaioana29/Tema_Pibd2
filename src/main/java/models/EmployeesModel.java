package models;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

public class EmployeesModel {
	String surname, first_name;
	Date date_of_birth, empl_year;
	String str_date,str_empl_year;
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd",Locale.ENGLISH);

//	default constructor
	public EmployeesModel() {
		surname = "";
		first_name = "";

	}
	
	public EmployeesModel(String surname, String first_name, String date_of_birth, String empl_year) throws ParseException {
		this.surname = surname;
		this.first_name = first_name;
		str_date=date_of_birth;
		str_empl_year=empl_year;

	}
	
	public String getSurname() {
		return surname;
	}
	
	public String getFirst_Name() {
		return first_name;
	}
	
	public Date getDateOfBirth() throws ParseException {
		java.util.Date dateStr=format.parse(str_date);
		this.date_of_birth = new Date(dateStr.getTime());
		return date_of_birth;	
	}
	
	public Date getEmplYear() throws ParseException {
		java.util.Date dateStr=format.parse(str_empl_year);
		this.empl_year = new Date(dateStr.getTime());
		return empl_year;
	}
	
	
}
