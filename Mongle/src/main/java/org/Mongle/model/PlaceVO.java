package org.Mongle.model;

public class PlaceVO {
	// 게시판 번호(bno)
	private int bno;
	// 지역
	private String loc;
	// 제목(title)
	private String title;
	// 내용(content)
	private String content;
	// 작성일자(regdate)
	private String date;
	// 조회수(cnt)
	private int cnt;
	// 아이디 (id)
	private String id;
	// 이름
	private String name;
	// 추천수
	private int rec;
	//카테고리
	private String ctgr;
	
	
	
	public String getCtgr() {
		return ctgr;
	}
	public void setCtgr(String ctgr) {
		this.ctgr = ctgr;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRec() {
		return rec;
	}
	public void setRec(int rec) {
		this.rec = rec;
	}
	@Override
	public String toString() {
		return "BoardVo [bno=" + bno + ", title=" + title + ", content=" + content + ", date=" + date + ", cnt="
				+ cnt + ", id=" + id + "]";
	}
}
