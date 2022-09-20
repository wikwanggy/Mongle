package org.Mongle.model;

public class ZAttachFileVO {
	// 1.파일이 저장되어 있는 경로
	private String z_upload; // 2022\\08\\24
	// 2.업로드된 파일명
	private String z_name; // hodori.jpg
	// 3.uuid 정보
	private String z_uid; // 6f507fba-d94f-4f56-8ef4-0c72f9e4df7a_hodori
	// 4.업로드된 파일이 이미지 파일인지 아닌지 대한 정보
	private boolean z_image;
	// 5.게시판 번호
	private int bno;
	public String getZ_upload() {
		return z_upload;
	}
	public void setZ_upload(String z_upload) {
		this.z_upload = z_upload;
	}
	public String getZ_name() {
		return z_name;
	}
	public void setZ_name(String z_name) {
		this.z_name = z_name;
	}
	public String getZ_uid() {
		return z_uid;
	}
	public void setZ_uid(String z_uid) {
		this.z_uid = z_uid;
	}
	public boolean isZ_image() {
		return z_image;
	}
	public void setZ_image(boolean z_image) {
		this.z_image = z_image;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		return "ZAttachFileVO [z_upload=" + z_upload + ", z_name=" + z_name + ", z_uid=" + z_uid + ", z_image="
				+ z_image + ", bno=" + bno + "]";
	}
	
	
}
