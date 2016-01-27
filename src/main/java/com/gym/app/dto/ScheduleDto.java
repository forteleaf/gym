package com.gym.app.dto;

public class ScheduleDto {
	private int snum;
	private String id; // 회원 아이디
	private String iid; // 강사 아이디
	private long startdate; 
	private long enddate;
	private int attendance; // 출석
	private String color;
	
	public ScheduleDto(){}
	public ScheduleDto(int snum, String id, String iid, long startdate, long enddate, int attendance, String color) {
		super();
		this.snum = snum;
		this.id = id;
		this.iid = iid;
		this.startdate = startdate;
		this.enddate = enddate;
		this.attendance = attendance;
		this.color=color;
	}
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIid() {
		return iid;
	}
	public void setIid(String iid) {
		this.iid = iid;
	}
	public long getStartdate() {
		return startdate;
	}
	public void setStartdate(long startdate) {
		this.startdate = startdate;
	}
	public long getEnddate() {
		return enddate;
	}
	public void setEnddate(long enddate) {
		this.enddate = enddate;
	}
	public int getAttendance() {
		return attendance;
	}
	public void setAttendance(int attendance) {
		this.attendance = attendance;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
}
