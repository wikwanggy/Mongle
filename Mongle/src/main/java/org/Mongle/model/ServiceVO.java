package org.Mongle.model;

import java.util.ArrayList;
	
public class ServiceVO {
	//가상번호(rownum)
	private int rownum;
	//게시판번호(bno)
	private int bno;
	//제목(title)
	private String title;
	//내용(content)
	private String content;
	//작성일자(regdate)
	private String regdate;
	//조회수(cnt)
	private int cnt;
	//아이디(id)
	private String id;
	//게시판 분류(BGNO)
	private int bgno;
	//이름(name)
	private String name;
	//ServiceFileListVO(파일 업로드 관련 model)
	private ArrayList<ServiceFileListVO> svfile;
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getBgno() {
		return bgno;
	}
	public void setBgno(int bgno) {
		this.bgno = bgno;
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
	public ArrayList<ServiceFileListVO> getSvfile() {
		return svfile;
	}
	public void setSvfile(ArrayList<ServiceFileListVO> svfile) {
		this.svfile = svfile;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "ServiceVO [rownum=" + rownum + ", bno=" + bno + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + ", cnt=" + cnt + ", id=" + id + ", bgno=" + bgno + ", name=" + name
				+ ", svfile=" + svfile + "]";
	}
	
	

}
