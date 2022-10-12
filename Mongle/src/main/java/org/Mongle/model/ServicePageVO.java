package org.Mongle.model;



public class ServicePageVO {
	private int pageNum; 	//페이지번호
	private int amount; 	//한 페이지당 게시물 갯수
	private String keyword; //키워드를 통해 검색.
	private String type; 	//키워드 기준
	private int bgno;
	
	
	
	/*public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("");
				queryParam("pageNum",this.pageNum);
				queryParam("amount",this.getAmount());
				queryParam("type",this.getType());
				queryParam("keyword",getKeyword());
		return builder.toUriString();
	}
	
	private void queryParam(String string, String type2) {
		// TODO Auto-generated method stub
		
	}

	private void queryParam(String string, int amount2) {
		// TODO Auto-generated method stub
		
	}*/

	public int getBgno() {
		return bgno;
	}
	public void setBgno(int bgno) {
		this.bgno = bgno;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	//생성자
	public ServicePageVO() {
		this(1,10);
	}
	public ServicePageVO(int pageNum,int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}
	
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "ServicePageVO [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", type=" + type
				+ ", bgno=" + bgno + "]";
	}

	
}
