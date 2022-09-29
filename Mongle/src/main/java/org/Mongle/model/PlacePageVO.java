package org.Mongle.model;

public class PlacePageVO {

	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private PlaceCriteriaVO pcri;
	private int total;

	public PlacePageVO(PlaceCriteriaVO pcri, int total) {
		this.pcri = pcri;
		this.total = total;
		this.endPage = (int) (Math.ceil(pcri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		int realEnd = (int) (Math.ceil((total * 1.0) / pcri.getAmount()));
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;

	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public PlaceCriteriaVO getPcri() {
		return pcri;
	}

	public void setPcri(PlaceCriteriaVO pcri) {
		this.pcri = pcri;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "PlacePageVO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", pcri=" + pcri + ", total=" + total + "]";
	}

}
