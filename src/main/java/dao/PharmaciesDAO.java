package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import models.PharmaciesModel;

public class PharmaciesDAO {
	String error;
	Connection con;
	
	public PharmaciesDAO(Connection con) {
		this.con = con;
	}
	
	public void addPharmacies(PharmaciesModel pharmacy) throws SQLException, Exception {
		if(con != null) {
			try {
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into pharmacies(name, est_year) values('" + pharmacy.getName() + 
						"', '" + pharmacy.getEst_Year() + "');");
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
				show = con.prepareStatement("SELECT * FROM pharmacies");
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
			valori) throws SQLException, Exception {
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

