package org.Mongle.model;

public class shopCategoryVO {
	private String c_type1;
	private String c_type2;
	private int bno;
	public String getC_type1() {
		return c_type1;
	}
	public void setC_type1(String c_type1) {
		this.c_type1 = c_type1;
	}
	public String getC_type2() {
		return c_type2;
	}
	public void setC_type2(String c_type2) {
		this.c_type2 = c_type2;
	}
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		return "shopCategoryVO [c_type1=" + c_type1 + ", c_type2=" + c_type2 + ", bno=" + bno + "]";
	}
	
}
