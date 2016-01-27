package com.gym.app.dto;

import java.sql.Date;

public class MsgDto {
	private int msgnum;
	private String id;
	private String recv_id;
	private String content;
	private Date send_date;
	private char status;
	
	public MsgDto(){}
	
	public MsgDto(int msgnum, String id, String recv_id, String content, Date send_date, char status) {
		super();
		this.msgnum = msgnum;
		this.id = id;
		this.recv_id = recv_id;
		this.content = content;
		this.send_date = send_date;
		this.status = status;
	}


	public int getMsgnum() {
		return msgnum;
	}

	public void setMsgnum(int msgnum) {
		this.msgnum = msgnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRecv_id() {
		return recv_id;
	}

	public void setRecv_id(String recv_id) {
		this.recv_id = recv_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getSend_date() {
		return send_date;
	}

	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}
	
			
}
