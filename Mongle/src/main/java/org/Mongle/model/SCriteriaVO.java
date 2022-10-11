package org.Mongle.model;

public class SCriteriaVO {
	private int pageNum; // 페이지번호
	private int amount; // 한 페이지당 게시물 갯수
	private String keyword; // 키워드를 통해 검색
	private String w_type; // 키워드 기준
	private String type;

	// 생성자
	public SCriteriaVO() {
		this(1, 9);
	}

	public SCriteriaVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
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

	public String getw_Type() {
		return w_type;
	}

	public void setType(String w_type) {
		this.w_type = w_type;
	}

	public String getW_type() {
		return w_type;
	}

	public void setW_type(String w_type) {
		this.w_type = w_type;
	}

	public String getType() {
		return type;
	}

	@Override
	public String toString() {
		return "SCriteriaVO [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", w_type=" + w_type
				+ "]";
	}

}
