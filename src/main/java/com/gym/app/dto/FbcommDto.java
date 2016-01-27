package com.gym.app.dto;

import java.sql.Date;

public class FbcommDto {
	private int fcnum;
	private int fbnum;
	private String id;
	private String comments;
	private int fcref;
	private int fclev;
	private int fcstep;
	private Date regdate;
	public FbcommDto() {}
	public FbcommDto(int fcnum, int fbnum, String id, String comments, int fcref, int fclev, int fcstep, Date regdate) {
		super();
		this.fcnum = fcnum;
		this.fbnum = fbnum;
		this.id = id;
		this.comments = comments;
		this.fcref = fcref;
		this.fclev = fclev;
		this.fcstep = fcstep;
		this.regdate = regdate;
	}
	public int getFcnum() {
		return fcnum;
	}
	public void setFcnum(int fcnum) {
		this.fcnum = fcnum;
	}
	public int getFbnum() {
		return fbnum;
	}
	public void setFbnum(int fbnum) {
		this.fbnum = fbnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getFcref() {
		return fcref;
	}
	public void setFcref(int fcref) {
		this.fcref = fcref;
	}
	public int getFclev() {
		return fclev;
	}
	public void setFclev(int fclev) {
		this.fclev = fclev;
	}
	public int getFcstep() {
		return fcstep;
	}
	public void setFcstep(int fcstep) {
		this.fcstep = fcstep;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
