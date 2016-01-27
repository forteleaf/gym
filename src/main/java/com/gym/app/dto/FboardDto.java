package com.gym.app.dto;

import java.sql.Date;

public class FboardDto {
	private int fbnum;
	private String id;
	private String title;
	private String content;
	private int hit;
	private Date regdate;
	public FboardDto() {}
	public FboardDto(int fbnum, String id, String title, String content,int hit, Date regdate) {
		super();
		this.fbnum = fbnum;
		this.id = id;
		this.title = title;
		this.content = content;
		this.hit=hit;
		this.regdate = regdate;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
}
