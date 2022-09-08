package org.Mongle.model;

public class ReviewVo {
	private int bno;
	private String tradename;
	private String user_review;
	private String writer;
	private String id;
	private String regdate;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTradename() {
		return tradename;
	}
	public void setTradename(String tradename) {
		this.tradename = tradename;
	}
	public String getUser_review() {
		return user_review;
	}
	public void setUser_review(String user_review) {
		this.user_review = user_review;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "ReviewVo [bno=" + bno + ", tradename=" + tradename + ", user_review=" + user_review + ", writer="
				+ writer + ", id=" + id + ", regdate=" + regdate + "]";
	}
	
}
