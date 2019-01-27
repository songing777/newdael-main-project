package com.vongether.intro.model;

import java.sql.Date;

public class VisitCountVO {
  private int visitId; // 기본키
  private String visitIp; // 접속자 아이피
  private Date visitTime; // 접속자 접속시간
  public int getVisitId() {
    return visitId;
  }
  public void setVisitId(int visitId) {
    this.visitId = visitId;
  }
  public String getVisitIp() {
    return visitIp;
  }
  public void setVisitIp(String visitIp) {
    this.visitIp = visitIp;
  }
  public Date getVisitTime() {
    return visitTime;
  }
  public void setVisitTime(Date visitTime) {
    this.visitTime = visitTime;
  }

}
