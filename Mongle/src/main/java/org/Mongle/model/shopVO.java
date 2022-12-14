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
	// 상품 타입
	private String w_type;
	// 카테고리 분류를 위한 번호
	private int wno;
	// 썸네일 파일 업로드 관련
	private String filem;
	// SAttachFileVo(파일업로드 관련 model)
	private ArrayList<SAttachFileVO> attach;
	private String s_type;
	private String type;
	private String id;
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

	public int getWno() {
		return wno;
	}

	public void setWno(int wno) {
		this.wno = wno;
	}

	public String getW_type() {
		return w_type;
	}

	public void setW_type(String w_type) {
		this.w_type = w_type;
	}

	public String getS_type() {
		return s_type;
	}

	public void setS_type(String s_type) {
		this.s_type = s_type;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "shopVO [bno=" + bno + ", w_name=" + w_name + ", w_price=" + w_price + ", w_regdata=" + w_regdata
				+ ", w_Quantity=" + w_Quantity + ", w_type=" + w_type + ", wno=" + wno + ", filem=" + filem
				+ ", attach=" + attach + ", s_type=" + s_type + ", type=" + type + ", id=" + id + "]";
	}

	
}
