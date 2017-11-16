package com.optimalroute.app.objects;

import org.springframework.stereotype.Component;

@Component("address")
public class Address {
	private int id;
	private String city;
	private String street;
	private String houseNumber;
	private String apartmentNumber;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getHouseNumber() {
		return houseNumber;
	}

	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}

	public String getApartmentNumber() {
		return apartmentNumber;
	}

	public void setApartmentNumber(String apartmentNumber) {
		this.apartmentNumber = apartmentNumber;
	}

	@Override
	public String toString() {
		return city + " " + street + " " + houseNumber + "/" + apartmentNumber;
	}

}
