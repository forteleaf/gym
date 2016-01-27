package com.gym.app.dto;

import java.sql.Date;

public class LockerDto {
	private int lnum;
	private String id;
	private int sex;
	private int rent;
	private String rentstart;
	private String rentend;
	
	public LockerDto() {}

	public LockerDto(int lnum, String id, int sex, int rent, String rentstart, String rentend) {
		super();
		this.lnum = lnum;
		this.id = id;
		this.sex = sex;
		this.rent = rent;
		this.rentstart = rentstart;
		this.rentend = rentend;
	}

	public int getLnum() {
		return lnum;
	}

	public void setLnum(int lnum) {
		this.lnum = lnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public int getRent() {
		return rent;
	}

	public void setRent(int rent) {
		this.rent = rent;
	}

	public String getRentstart() {
		return rentstart;
	}

	public void setRentstart(String rentstart) {
		this.rentstart = rentstart;
	}

	public String getRentend() {
		return rentend;
	}

	public void setRentend(String rentend) {
		this.rentend = rentend;
	}
	
}
