package models;

public class PharmaciesModel {
	String name;
	int est_year;

//	default constructor
	public PharmaciesModel() {
		name = "";
	} 
	
	public PharmaciesModel(String name, int est_year) {
		this.name = name;
		this.est_year = est_year;
	}
	
	public String getName() {
		return name;
	}
	
	public int getEst_Year() {
		return est_year;
	}
	
}
