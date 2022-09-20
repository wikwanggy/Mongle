package org.Mongle.model;

public class ServiceFileListVO {
		
	//파일저장된 경로
	private String uploadPath;
	//업로드 파일명
	private String fileName;
	//uuid 정보
	private String uuid;
	//업로드된 파일이 이미지 파일인지 분류용 정보
	private boolean image;
	//게시판 번호
	private int bno;
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public boolean isImage() {
		return image;
	}
	public void setImage(boolean image) {
		this.image = image;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		return "ServicefilelistVO [uploadPath=" + uploadPath + ", fileName=" + fileName + ", uuid=" + uuid + ", image="
				+ image + ", bno=" + bno + "]";
	}
}
