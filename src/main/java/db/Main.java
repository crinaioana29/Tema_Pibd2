package db;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

import dao.EmployeesDAO;
import dao.LocationsDAO;
import dao.PharmaciesDAO;
import models.EmployeesModel;
import models.LocationsModel;
import models.PharmaciesModel;

public class Main {
	/*
	 * @return void
	 * @Params: ResultSet rs - ResultSet-ul pentru fiecare call al lui PrintQuery
	 * 
	 */
	public static void printQuery(ResultSet rs) throws SQLException {
		ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
		int columnsNumber = rsmd.getColumnCount();
		while (rs.next()) {
			for (int i = 1; i <= columnsNumber; i++) {
				if (i > 1) System.out.print(",  ");
					String columnValue = rs.getString(i);
					System.out.print(columnValue + " ");
			}
			System.out.println("");
		}
	}
	
	public static void main(String[] args) throws SQLException, Exception {
		//JavaBean connection to database		
		JavaBean jb = new JavaBean();
		jb.connect();
		
		//Testing locations queries		
		LocationsModel location = new LocationsModel("Italia", "Roma");
		LocationsDAO lc = new LocationsDAO(jb.getConnection());
		lc.addLocations(location); 
		String[] primaryKeys = {"2"};
		String[] campuri = {"idlocation", "county", "city"};
		String[] valori = {"1", "2", "3"};
		lc.modifyLocations("locations", "idlocation", 1, campuri, valori);
		lc.deleteLocations(primaryKeys);
		//print queries
		ResultSet rs = lc.showLocations();
		rs = lc.returnRowLocations("locations", 1);
		rs = lc.returnRowAfterIdLocations("locations", "idlocation", 1);
		printQuery(rs);
		
		//Testing employees queries		
		EmployeesModel employee = new EmployeesModel("Popescu", "Ion", "1980-08-23", "2002-03-25");
		EmployeesDAO employeesDAO = new EmployeesDAO(jb.getConnection());
		employeesDAO.addEmployees(employee);
		String[] primaryKeys2 = {"2"};
		String[] campuri2 = {"idemployee", "surname", "first_name", "date_of_birth", "empl_year"};
		String[] valori2 = {"1", "2", "3", "4", "5"};
		employeesDAO.modifyEmployees("employees", "idemployee", 1, campuri2, valori2);
		employeesDAO.deleteEmployees(primaryKeys2);
		//print queries		
		ResultSet rs2 = employeesDAO.showEmployees();
		rs2 = employeesDAO.returnRowEmployees("employees", 1);
		rs2 = employeesDAO.returnRowAfterIdEmployees("employees", "idemployee", 1);
		printQuery(rs2);
		
		//Testing pharmacies queries
		PharmaciesModel pharmacy = new PharmaciesModel("Catena", 2007);
		PharmaciesDAO pharmaciesDAO = new PharmaciesDAO(jb.getConnection());
		pharmaciesDAO.addPharmacies(pharmacy);
		String[] primaryKeys3 = {"2"};
		String[] campuri3 = {"idpharmacy", "name", "est_year"};
		String[] valori3 = {"1", "2", "3"};
		pharmaciesDAO.modifyPharmacies("pharmacies", "idpharmacy", 1, campuri3, valori3);
		pharmaciesDAO.deletePharmacies(primaryKeys3);
		//print queries
		ResultSet rs3 = pharmaciesDAO.showPharmacies();
		rs3 = pharmaciesDAO.returnRowPharmacies("pharmacies", 1);
		rs3 = pharmaciesDAO.returnRowAfterIdPharmacies("pharmacies", "idpharmacy", 1);
		printQuery(rs3);
		
		//disconnect from database		
		jb.disconnect();
	}

}
