package com.gym.app.dto;

import java.sql.Date;

public class EpcommDto {
	private int ecnum;
	private int epnum;
	private String id;
	private String comments;
	private int ecref;
	private int eclev;
	private int ecstep;
	private Date regdate;
	public EpcommDto() {}
	public EpcommDto(int ecnum, int epnum, String id, String comments, int ecref, int eclev, int ecstep, Date regdate) {
		super();
		this.ecnum = ecnum;
		this.epnum = epnum;
		this.id = id;
		this.comments = comments;
		this.ecref = ecref;
		this.eclev = eclev;
		this.ecstep = ecstep;
		this.regdate = regdate;
	}
	public int getEcnum() {
		return ecnum;
	}
	public void setEcnum(int ecnum) {
		this.ecnum = ecnum;
	}
	public int getEpnum() {
		return epnum;
	}
	public void setEpnum(int epnum) {
		this.epnum = epnum;
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
	public int getEcref() {
		return ecref;
	}
	public void setEcref(int ecref) {
		this.ecref = ecref;
	}
	public int getEclev() {
		return eclev;
	}
	public void setEclev(int eclev) {
		this.eclev = eclev;
	}
	public int getEcstep() {
		return ecstep;
	}
	public void setEcstep(int ecstep) {
		this.ecstep = ecstep;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
}
