package com.vongether.board.model;

public class ReplyVO {
	private int rNo;
	private int bNo;
	private String mId;
	private String rContent;
	private String rRegdate;
	
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getrRegdate() {
		return rRegdate;
	}
	public void setrRegdate(String rRegdate) {
		this.rRegdate = rRegdate;
	}
}
