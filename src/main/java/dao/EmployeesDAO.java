package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import models.EmployeesModel;

public class EmployeesDAO {
	String error;
	Connection con;
	
	public EmployeesDAO(Connection con) {
		this.con = con;
	}
	
	public void addEmployees(EmployeesModel employee) throws SQLException, Exception {
		if(con != null) {
			try {
			
				Statement stmt;
				stmt = con.createStatement();
				
				stmt.executeUpdate("insert into employees(surname, first_name, date_of_birth, empl_year) values('" + employee.getSurname() + 
						"', '" + employee.getFirst_Name() + "', '" + employee.getDateOfBirth() + "','" + employee.getEmplYear() + "');");
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		} else {
			error = "ExceptieSQL: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	}
	
	public void deleteEmployees(String[] primaryKeys) throws Exception {
		if(con != null) {
			try {
				long aux;
				PreparedStatement delete;
				delete = con.prepareStatement("DELETE FROM employees WHERE idemployee =?;");
				for(int i = 0; i < primaryKeys.length; i++) {
					aux = Long.parseLong(primaryKeys[i]);
					delete.setLong(1, aux);
					delete.execute();
				}
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			error = "ExceptieSQL: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	}
	
	public ResultSet showEmployees() throws Exception {
		ResultSet rs = null;
		if(con != null) {
			try {
				PreparedStatement show;
				show = con.prepareStatement("SELECT * FROM employees");
				rs = show.executeQuery();
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}  else {
			error = "ExceptieSQL: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
		return rs;
	}
	
	public void modifyEmployees(String employees, String idemployee, long ID, String[] campuri, String[]
			valori) throws SQLException, Exception {
			String update = "update " + employees + " set ";
			String temp = "";
			if (con != null) {
			try {
			for (int i = 0; i < campuri.length; i++) {
			if (i != (campuri.length - 1)) {
			temp = temp + campuri[i] + "='" + valori[i] + "', ";
			} else {
			temp = temp + campuri[i] + "='" + valori[i] + "' where " + idemployee + 
					" = '" + ID + "';";
			}
			}
			update = update + temp;
			// creaza un "prepared SQL statement"
			Statement stmt;
			stmt = con.createStatement();
			stmt.executeUpdate(update);
			} catch (SQLException sqle) {
			sqle.printStackTrace();
			throw new SQLException(error);
			}
			} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
			}
			} // end of modifyEmployees()
	

    public ResultSet returnRowEmployees(String employees, long ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
        	// Executa interogarea
            String queryString = ("SELECT * FROM " + employees + " where idemployee=" + ID + ";");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            sqle.printStackTrace();;
            throw new SQLException(error);
        } catch (Exception e) {
            e.printStackTrace();;
            throw new Exception(error);
        }
        return rs;
    } // end of returnRowEmployees()
    
    public ResultSet returnRowAfterIdEmployees(String employees, String idemployee, long ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
        	// Executa interogarea
            String queryString = ("SELECT * FROM " + employees + " where " + idemployee + "=" + ID + ";");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            sqle.printStackTrace();;
            throw new SQLException(error);
        } catch (Exception e) {
            e.printStackTrace();;
            throw new Exception(error);
        }
        return rs;
    } // end of returnRowAfterIdEmployees()
}


