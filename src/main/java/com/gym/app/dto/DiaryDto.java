package com.gym.app.dto;

import java.sql.Date;

public class DiaryDto {
	int d_num;
	String id;
	String exername;
	Date d_date;
	String diary;
	long startd;
	long endd;
	String d_title;
	int weight;
	
	public DiaryDto() {}

	public DiaryDto(int d_num, String id, String exername, Date d_date, String diary, long startd, long endd,
			String d_title, int weight) {
		super();
		this.d_num = d_num;
		this.id = id;
		this.exername = exername;
		this.d_date = d_date;
		this.diary = diary;
		this.startd = startd;
		this.endd = endd;
		this.d_title = d_title;
		this.weight = weight;
	}

	public int getD_num() {
		return d_num;
	}

	public void setD_num(int d_num) {
		this.d_num = d_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getExername() {
		return exername;
	}

	public void setExername(String exername) {
		this.exername = exername;
	}

	public Date getD_date() {
		return d_date;
	}

	public void setD_date(Date d_date) {
		this.d_date = d_date;
	}

	public String getDiary() {
		return diary;
	}

	public void setDiary(String diary) {
		this.diary = diary;
	}

	public long getStartd() {
		return startd;
	}

	public void setStartd(long startd) {
		this.startd = startd;
	}

	public long getEndd() {
		return endd;
	}

	public void setEndd(long endd) {
		this.endd = endd;
	}

	public String getD_title() {
		return d_title;
	}

	public void setD_title(String d_title) {
		this.d_title = d_title;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}
	
	
	
}
