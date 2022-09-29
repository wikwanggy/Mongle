package org.Mongle.model;

public class PlaceLikeVO {
	private int likeno;
	private String id;
	private int bno;
	private int likecheck;
	
	
	public int getLikeno() {
		return likeno;
	}
	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getLikecheck() {
		return likecheck;
	}
	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	}
	@Override
	public String toString() {
		return "PlaceLikeVO [likeno=" + likeno + ", id=" + id + ", bno=" + bno + ", likecheck=" + likecheck + "]";
	}
}
