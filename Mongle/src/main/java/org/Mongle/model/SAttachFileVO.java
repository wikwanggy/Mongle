package org.Mongle.model;

public class SAttachFileVO {
	// 1.파일이 저장되어 있는 경로
	private String p_upload; // 2022\\08\\24
	// 2.업로드된 파일명
	private String p_name; // hodori.jpg
	// 3.uuid 정보
	private String p_uid; // 6f507fba-d94f-4f56-8ef4-0c72f9e4df7a_hodori
	// 4.업로드된 파일이 이미지 파일인지 아닌지 대한 정보
	private boolean p_image;
	// 5.게시판 번호
	private int bno;
	
	public String getP_upload() {
		return p_upload;
	}
	public void setP_upload(String p_upload) {
		this.p_upload = p_upload;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_uid() {
		return p_uid;
	}
	public void setP_uid(String p_uid) {
		this.p_uid = p_uid;
	}
	public boolean isP_image() {
		return p_image;
	}
	public void setP_image(boolean p_image) {
		this.p_image = p_image;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		return "SAttachFileVO [p_upload=" + p_upload + ", p_name=" + p_name + ", p_uid=" + p_uid + ", p_image="
				+ p_image + ", bno=" + bno + "]";
	}
	
	
}
