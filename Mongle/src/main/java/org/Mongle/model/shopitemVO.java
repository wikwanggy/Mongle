package org.Mongle.model;

public class shopitemVO {
	// 상품문의 번호
	private int rno;
	// 상품번호
	private int bno;
	// 회원아이디
	private String s_id;
	// 질문 제목
	private String s_title;
	// 상품 질문
	private String s_question;
	// 상품 답변
	private String s_answer;
	// 답변 완료상태
	private int s_Confirm;
	// 작성일자
	private String s_time;

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getS_question() {
		return s_question;
	}

	public void setS_question(String s_question) {
		this.s_question = s_question;
	}

	public String getS_title() {
		return s_title;
	}

	public void setS_title(String s_title) {
		this.s_title = s_title;
	}

	public String getS_answer() {
		return s_answer;
	}

	public void setS_answer(String s_answer) {
		this.s_answer = s_answer;
	}

	public String getS_time() {
		return s_time;
	}

	public void setS_time(String s_time) {
		this.s_time = s_time;
	}

	public int getS_Confirm() {
		return s_Confirm;
	}

	public void setS_Confirm(int s_Confirm) {
		this.s_Confirm = s_Confirm;
	}

	@Override
	public String toString() {
		return "shopitemVO [rno=" + rno + ", bno=" + bno + ", s_id=" + s_id + ", s_title=" + s_title + ", s_question="
				+ s_question + ", s_answer=" + s_answer + ", s_Confirm=" + s_Confirm + ", s_time=" + s_time + "]";
	}

}
