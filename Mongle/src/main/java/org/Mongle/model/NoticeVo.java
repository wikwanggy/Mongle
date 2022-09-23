package org.Mongle.model;

import java.util.ArrayList;

public class NoticeVo {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String id;
	private String regdate;
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
	@Override
	public String toString() {
		return "NoticeVo [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", id="
				+ id + ", regdate=" + regdate + "]";
	}
}
