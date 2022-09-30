package org.Mongle.model;

public class CommUVo {
	private String uploadPath;
	//2. 업로드된 파일 명
	private String filename;
	//3. UUID
	private String uuid;
	//4. 업로드된 파일의 이미지 파일 여부
	private boolean image;
	private int bno;
	
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
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
		return "CommUVo [uploadPath=" + uploadPath + ", filename=" + filename + ", uuid=" + uuid + ", image=" + image
				+ ", bno=" + bno + "]";
	}
}
