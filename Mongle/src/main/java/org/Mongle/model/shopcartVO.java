package org.Mongle.model;

public class shopcartVO {
	private int cartbno; // 장바구니번호
	private int prodbno; // 상품번호
	private int quantity; // 수량
	private String indate; // 날짜
	private String id; // 회원 아이디
	private int result; // 배송유무
	private String filem; 	// 썸네일 파일 업로드 관련
	public int getCartbno() {
		return cartbno;
	}
	public void setCartbno(int cartbno) {
		this.cartbno = cartbno;
	}
	public int getProdbno() {
		return prodbno;
	}
	public void setProdbno(int prodbno) {
		this.prodbno = prodbno;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getid() {
		return id;
	}
	public void setid(String cartid) {
		this.id = cartid;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public String getFilem() {
		return filem;
	}
	public void setFilem(String filem) {
		this.filem = filem;
	}
	@Override
	public String toString() {
		return "cartVO [cartbno=" + cartbno + ", prodbno=" + prodbno + ", quantity=" + quantity + ", indate=" + indate
				+ ", id=" + id + ", result=" + result + "]";
	}
	
}
