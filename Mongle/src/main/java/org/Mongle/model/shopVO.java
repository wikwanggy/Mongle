package org.Mongle.model;

import java.util.ArrayList;

public class shopVO {
	// 상품 번호
	private int product_id;
	// 상품 가격
	private int product_price;
	// 상품 색상
	private String product_color;
	// 상품 크기
	private String product_size;
	// 상품 종류
	private String product_type;
	// 9. 상품 수량
	private int product_Quantity;
	// 13. goodsVo(파일업로드 관련 model)
	private ArrayList<goodsVO> attach;

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_color() {
		return product_color;
	}

	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}

	public String getProduct_size() {
		return product_size;
	}

	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}

	public String getProduct_type() {
		return product_type;
	}

	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}

	public int getProduct_Quantity() {
		return product_Quantity;
	}

	public void setProduct_Quantity(int product_Quantity) {
		this.product_Quantity = product_Quantity;
	}

	public ArrayList<goodsVO> getAttach() {
		return attach;
	}

	public void setAttach(ArrayList<goodsVO> attach) {
		this.attach = attach;
	}

	@Override
	public String toString() {
		return "shopVO [product_id=" + product_id + ", product_price=" + product_price + ", product_color="
				+ product_color + ", product_size=" + product_size + ", product_type=" + product_type
				+ ", product_Quantity=" + product_Quantity + ", attach=" + attach + "]";
	}

}
