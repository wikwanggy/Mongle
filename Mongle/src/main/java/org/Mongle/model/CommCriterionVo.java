package org.Mongle.model;

public class CommCriterionVo {
	private int pageNum; //페이지번호
	private int amount; //한 페이지당 게시물 갯수
	private String keyword; //키워드를 통해 검색
	private String type; //키워드 기준
	
	public CommCriterionVo() {
		this(1,10);
	}
	public CommCriterionVo(int pageNum,int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
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
		return "CriterionVo [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", type=" + type
				+ "]";
	}
	
	
}
