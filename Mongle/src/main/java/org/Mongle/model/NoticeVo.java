package org.Mongle.model;

public class NoticeVo {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String id;
	private String regdate;
	private int notice;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public int getNotice() {
		return notice;
	}
	public void setNotice(int notice) {
		this.notice = notice;
	}
	@Override
	public String toString() {
		return "NoticeVo [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", id="
				+ id + ", regdate=" + regdate + ", notice=" + notice + "]";
	}
}