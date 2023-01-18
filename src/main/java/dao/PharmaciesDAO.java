package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import models.EmployeesModel;
import models.LocationsModel;
import models.PharmaciesModel;

public class PharmaciesDAO {
	String error;
	Connection con;
	
	public PharmaciesDAO(Connection con) {
		this.con = con;
	}
	
	public void addPharmacies(PharmaciesModel pharmacy,LocationsModel locations, EmployeesModel employees) 
			throws SQLException, Exception {
		if(con != null) {
			try {
				Statement stmt,stmt_2,stmt_3;
				PreparedStatement last_id;
				ResultSet rs=null;
				stmt = con.createStatement();
				stmt_2=con.createStatement();
				stmt_3=con.createStatement();
				stmt.executeUpdate("insert into pharmacies(name, est_year) values('" + pharmacy.getName() + 
						"', '" + pharmacy.getEst_Year() + "');");
				last_id=con.prepareStatement("select idpharmacy from pharmacies order by idpharmacy desc limit 1;");
				ResultSet res=last_id.executeQuery();
				Long id_pharmacy=0L;
				if(res.next())
					id_pharmacy=res.getLong(1);
				stmt_2.executeUpdate("insert into employees(idpharmacy,surname,first_name,date_of_birth,empl_year) values('"+id_pharmacy+ 
				"', '" + employees.getSurname()+ 
				"', '" +employees.getFirst_Name()+ 
				"', '" +employees.getDateOfBirth()+ 
				"', '" +employees.getEmplYear()+ "');");
				stmt_3.executeUpdate("insert into locations(city,county,idpharmacy) values('"+locations.getCity()+ 
						"', '" + locations.getCounty()+ 
						"', '" +id_pharmacy+ "');");
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		} else {
			error = "ExceptieSQL: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	}
	
	public void deletePharmacies(String[] primaryKeys) throws Exception {
		if(con != null) {
			try {
				long aux;
				PreparedStatement delete;
				delete = con.prepareStatement("DELETE FROM pharmacies WHERE idpharmacy =?;");
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
	
	public ResultSet showPharmacies() throws Exception {
		ResultSet rs = null;
		if(con != null) {
			try {
				PreparedStatement show;
				show = con.prepareStatement("SELECT * FROM pharmacies p inner join locations l "
						+ "on l.idpharmacy=p.idpharmacy inner join employees e on e.idpharmacy=p.idpharmacy;");
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
	
	public void modifyPharmacies(String pharmacies, String idpharmacy, long ID, String[] campuri, String[]
			valori,LocationsModel locations, EmployeesModel employees) throws SQLException, Exception {
			String update = "update " + pharmacies + " set ";
			String temp = "";
			if (con != null) {
			try {
			for (int i = 0; i < campuri.length; i++) {
			if (i != (campuri.length - 1)) {
			temp = temp + campuri[i] + "='" + valori[i] + "', ";
			} 
			else {
			temp = temp + campuri[i] + "='" + valori[i] + "' where " + idpharmacy + 
					" = '" + ID + "';";
			}
			}
			update = update + temp;
			// creaza un "prepared SQL statement"
			Statement stmt;
			stmt = con.createStatement();
			stmt.executeUpdate(update);
			PreparedStatement ps;
			ps=con.prepareStatement("update employees set surname=?, first_name=?,date_of_birth=?,empl_year=? where idpharmacy=?");
			ps.setString(1, employees.getSurname());
			ps.setString(2, employees.getFirst_Name());
			ps.setDate(3, employees.getDateOfBirth());
			ps.setDate(4, employees.getEmplYear());

			ps.setLong(5, ID);
			ps.execute();
			ps=con.prepareStatement("update locations set city=?, county=? where idpharmacy=?");
			ps.setString(1, locations.getCity());
			ps.setString(2, locations.getCounty());
			ps.setLong(3, ID);
			ps.execute();
			} catch (SQLException sqle) {
			sqle.printStackTrace();
			throw new SQLException(error);
			}
			} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
			}
			} // end of modifyPharmacies()
	
    public ResultSet returnRowPharmacies(String pharmacies, long ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
        	// Executa interogarea
            String queryString = ("SELECT * FROM " + pharmacies + " where idpharmacy=" + ID + ";");
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
    } // end of returnRowPharmacies()
    
    public ResultSet returnRowAfterIdPharmacies(String pharmacies, String idpharmacy, long ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
        	// Executa interogarea
            String queryString = ("SELECT * FROM " + pharmacies + " where " + idpharmacy + "=" + ID + ";");
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
    } // end of returnRowAfterIdPharmacies()
}

