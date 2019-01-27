package com.vongether.board.model;

public class BoardVO {
	private int bNo;		 //글번호
	private String bTitle;	 //글제목
	private String bContent; //글내용
	private int bHitcount;	 //조회수
	private String bRegdate; //작성일
	private String mId;		 //작성자아이디
	private int rCount;		 //댓글수
	private int bNoticeYN;   //공지사항여부
	private int bDelYN;     //삭제여부
	private String bDeldate;//삭제일
	
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public int getbHitcount() {
		return bHitcount;
	}
	public void setbHitcount(int bHitcount) {
		this.bHitcount = bHitcount;
	}
	public String getbRegdate() {
		return bRegdate;
	}
	public void setbRegdate(String bRegdate) {
		this.bRegdate = bRegdate;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getrCount() {
		return rCount;
	}
	public void setrCount(int rCount) {
		this.rCount = rCount;
	}
    public int getbNoticeYN() {
      return bNoticeYN;
    }
    public void setbNoticeYN(int bNoticeYN) {
      this.bNoticeYN = bNoticeYN;
    }
    public int getbDelYN() {
      return bDelYN;
    }
    public void setbDelYN(int bDelYN) {
      this.bDelYN = bDelYN;
    }
    public String getbDeldate() {
      return bDeldate;
    }
    public void setbDeldate(String bDeldate) {
      this.bDeldate = bDeldate;
    }

	
	
}
