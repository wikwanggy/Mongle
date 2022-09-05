package org.Mongle.model;

public class goodsVO {
	// 상품 번호
	private int product_id;
	// 상품 이름
	private String product_name;
	// 상품 설명 사진( 사진 파일 여부 확인 )
	private boolean product_image;
	// 파일 저장 경로
	private String product_upload;
	// 사진 파일정보
	private String product_uid;

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public boolean isProduct_image() {
		return product_image;
	}

	public void setProduct_image(boolean product_image) {
		this.product_image = product_image;
	}

	public String getProduct_upload() {
		return product_upload;
	}

	public void setProduct_upload(String product_upload) {
		this.product_upload = product_upload;
	}

	public String getProduct_uid() {
		return product_uid;
	}

	public void setProduct_uid(String product_uid) {
		this.product_uid = product_uid;
	}

	@Override
	public String toString() {
		return "goodsVO [product_id=" + product_id + ", product_name=" + product_name + ", product_image="
				+ product_image + ", product_upload=" + product_upload + ", product_uid=" + product_uid + "]";
	}


}
