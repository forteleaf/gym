package com.gym.app.dto;

import java.sql.Date;

public class IfcommDto {
	private int icnum;
	private int ifnum;
	private String id;
	private String comments;
	private int icref;
	private int iclev;
	private int icstep;
	private Date regdate;
	public IfcommDto() {}
	public IfcommDto(int icnum, int ifnum, String id, String comments, int icref, int iclev, int icstep, Date regdate) {
		super();
		this.icnum = icnum;
		this.ifnum = ifnum;
		this.id = id;
		this.comments = comments;
		this.icref = icref;
		this.iclev = iclev;
		this.icstep = icstep;
		this.regdate = regdate;
	}
	public int getIcnum() {
		return icnum;
	}
	public void setIcnum(int icnum) {
		this.icnum = icnum;
	}
	public int getIfnum() {
		return ifnum;
	}
	public void setIfnum(int ifnum) {
		this.ifnum = ifnum;
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
	public int getIcref() {
		return icref;
	}
	public void setIcref(int icref) {
		this.icref = icref;
	}
	public int getIclev() {
		return iclev;
	}
	public void setIclev(int iclev) {
		this.iclev = iclev;
	}
	public int getIcstep() {
		return icstep;
	}
	public void setIcstep(int icstep) {
		this.icstep = icstep;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
