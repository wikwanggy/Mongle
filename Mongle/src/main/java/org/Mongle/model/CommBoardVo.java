package org.Mongle.model;

import java.util.ArrayList;

public class CommBoardVo {
	// 게시판 번호(bno)
	private int bno;
	// 제목(title)
	private String title;
	// 내용(content)
	private String content;
	// 작성일자(regdate)
	private String regdate;
	// 조회수(cnt)
	private int cnt;
	// 아이디 (id)
	private String id;
	// 작성자
	private String writer;
	private ArrayList<CommUVo> attach;
	private int next;
	private int last;
	private String nexttitle;
	private String lasttitle;
	private int count;
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	public String getNexttitle() {
		return nexttitle;
	}
	public void setNexttitle(String nexttitle) {
		this.nexttitle = nexttitle;
	}
	public String getLasttitle() {
		return lasttitle;
	}
	public void setLasttitle(String lasttitle) {
		this.lasttitle = lasttitle;
	}
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
	
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public ArrayList<CommUVo> getAttach() {
		return attach;
	}
	public void setAttach(ArrayList<CommUVo> attach) {
		this.attach = attach;
	}
	@Override
	public String toString() {
		return "CommBoardVo [bno=" + bno + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", cnt=" + cnt + ", id=" + id + ", writer=" + writer + ", attach=" + attach + ", next=" + next
				+ ", last=" + last + ", nexttitle=" + nexttitle + ", lasttitle=" + lasttitle + ", count=" + count + "]";
	}
	

}
