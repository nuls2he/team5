package com.wt.user.domain;

public class User {
	private String id;
	private String nick;
	private String pwd;
	private String email;
	private String hintQ;
	private String hintA;
	private String name;
	private String call;
	private String addHead;
	private String addTail;
	private String chekAD;
	private String adminYN;
	public String getAddHead() {
		return addHead;
	}
	public void setAddHead(String addHead) {
		this.addHead = addHead;
	}
	public String getAddTail() {
		return addTail;
	}
	public void setAddTail(String addTail) {
		this.addTail = addTail;
	}

	public String getChekAD() {
		return chekAD;
	}
	public void setChekAD(String chekAD) {
		this.chekAD = chekAD;
	}
	public String isAdminYN() {
		return adminYN;
	}
	public void setAdminYN(String adminYN) {
		this.adminYN = adminYN;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHintQ() {
		return hintQ;
	}
	public void setHintQ(String hintQ) {
		this.hintQ = hintQ;
	}
	public String getHintA() {
		return hintA;
	}
	public void setHintA(String hintA) {
		this.hintA = hintA;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCall() {
		return call;
	}
	public void setCall(String call) {
		this.call = call;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	private String addr;
}
