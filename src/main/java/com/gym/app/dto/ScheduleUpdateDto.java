package com.gym.app.dto;

public class ScheduleUpdateDto {
	private long startdate;
	private long enddate;
	private String iid;
	private long formerdate;
	public ScheduleUpdateDto(){}
	public ScheduleUpdateDto(long startdate, long enddate, String iid, long formerdate) {
		super();
		this.startdate = startdate;
		this.enddate = enddate;
		this.iid = iid;
		this.formerdate = formerdate;
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
	public String getIid() {
		return iid;
	}
	public void setIid(String iid) {
		this.iid = iid;
	}
	public long getFormerDate() {
		return formerdate;
	}
	public void setFormerDate(long formerdate) {
		this.formerdate = formerdate;
	}
	
}
