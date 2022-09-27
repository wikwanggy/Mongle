package org.Mongle.model;

import java.util.ArrayList;

public class shopVO {
	// 상품 번호
	private int bno;
	// 상품 이름
	private String w_name;
	// 상품 가격
	private int w_price;
	// 상품 작성일자
	private String w_regdata;
	// 상품 수량
	private int w_Quantity;
	// 썸네일 파일 업로드 관련
	private String filem;
	// SAttachFileVo(파일업로드 관련 model)
	private ArrayList<SAttachFileVO> attach;

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getW_name() {
		return w_name;
	}

	public void setW_name(String w_name) {
		this.w_name = w_name;
	}

	public int getW_price() {
		return w_price;
	}

	public void setW_price(int w_price) {
		this.w_price = w_price;
	}

	public String getW_regdata() {
		return w_regdata;
	}

	public void setW_regdata(String w_regdata) {
		this.w_regdata = w_regdata;
	}

	public int getW_Quantity() {
		return w_Quantity;
	}

	public void setW_Quantity(int w_Quantity) {
		this.w_Quantity = w_Quantity;
	}

	public ArrayList<SAttachFileVO> getAttach() {
		return attach;
	}

	public String getFilem() {
		return filem;
	}

	public void setFilem(String filem) {
		this.filem = filem;
	}

	public void setAttach(ArrayList<SAttachFileVO> attach) {
		this.attach = attach;
	}

	@Override
	public String toString() {
		return "shopVO [bno=" + bno + ", w_name=" + w_name + ", w_price=" + w_price + ", w_regdata=" + w_regdata
				+ ", w_Quantity=" + w_Quantity + ", filem=" + filem + ", attach=" + attach + "]";
	}

}
