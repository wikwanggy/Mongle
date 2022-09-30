package org.Mongle.model;

import java.util.List;

public class CommReplyPageVo {
	List<CommReplyupVo> list;
	CommPageVo page;
	
	public List<CommReplyupVo> getList() {
		return list;
	}
	public void setList(List<CommReplyupVo> list) {
		this.list = list;
	}
	public CommPageVo getPage() {
		return page;
	}
	public void setPage(CommPageVo page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "CommReplyPageVo [list=" + list + ", page=" + page + "]";
	}
	
	
}
