package org.Mongle.model;

public class CommReplyupVo {
	private int comm_rno;
	private String comm_reply;
	private String comm_id;
	private String comm_replydate;
	private int bno;
	
	public int getComm_rno() {
		return comm_rno;
	}
	public void setComm_rno(int comm_rno) {
		this.comm_rno = comm_rno;
	}
	public String getComm_reply() {
		return comm_reply;
	}
	public void setComm_reply(String comm_reply) {
		this.comm_reply = comm_reply;
	}
	public String getComm_id() {
		return comm_id;
	}
	public void setComm_id(String comm_id) {
		this.comm_id = comm_id;
	}
	public String getComm_replydate() {
		return comm_replydate;
	}
	public void setComm_replydate(String comm_replydate) {
		this.comm_replydate = comm_replydate;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		return "CommReplyupVo [comm_rno=" + comm_rno + ", comm_reply=" + comm_reply + ", comm_id=" + comm_id
				+ ", comm_replydate=" + comm_replydate + ", bno=" + bno + "]";
	}
	
}
