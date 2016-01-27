package com.gym.app.dto;

import java.sql.Date;

public class QnacommDto {
	private int qcnum;
	private int qnanum;
	private String id;
	private String comments;
	private int qcref;
	private int qclev;
	private int qcstep;
	private Date regdate;
	public QnacommDto() {}
	public QnacommDto(int qcnum, int qnanum, String id, String comments, int qcref, int qclev, int qcstep,Date regdate) {
		super();
		this.qcnum = qcnum;
		this.qnanum = qnanum;
		this.id = id;
		this.comments = comments;
		this.qcref = qcref;
		this.qclev = qclev;
		this.qcstep = qcstep;
		this.regdate=regdate;
	}
	public int getQcnum() {
		return qcnum;
	}
	public void setQcnum(int qcnum) {
		this.qcnum = qcnum;
	}
	public int getQnanum() {
		return qnanum;
	}
	public void setQnanum(int qnanum) {
		this.qnanum = qnanum;
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
	
	public int getQcref() {
		return qcref;
	}
	public void setQcref(int qcref) {
		this.qcref = qcref;
	}
	public int getQclev() {
		return qclev;
	}
	public void setQclev(int qclev) {
		this.qclev = qclev;
	}
	public int getQcstep() {
		return qcstep;
	}
	public void setQcstep(int qcstep) {
		this.qcstep = qcstep;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
