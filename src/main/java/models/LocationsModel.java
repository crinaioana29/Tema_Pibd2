package models;

public class LocationsModel {
	String county, city;

//	default constructor
	public LocationsModel() {
		county = "";
		city = "";
	} 
	
	public LocationsModel(String county, String city) {
		this.county = county;
		this.city = city;
	}
	
	public String getCounty() {
		return county;
	}
	
	public String getCity() {
		return city;
	}
	
}
