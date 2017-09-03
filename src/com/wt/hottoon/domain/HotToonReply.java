package com.wt.hottoon.domain;

import java.util.Date;

public class HotToonReply {
	int no;
	String id;
	int repNo;
	String content;
	Date regDate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRepNo() {
		return repNo;
	}
	public void setRepNo(int repNo) {
		this.repNo = repNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
