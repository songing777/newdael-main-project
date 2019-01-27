package com.vongether.volunteer.model;

public class VolunteerVO {
	private int actBeginTm;//봉사시작시간
	private int actEndTm;
	private int progrmBgnde;//봉사기간(시작일)
	private int progrmEndde;//봉사기간(종료일)
	private int noticeBgnde;//모집기간(시작일)
	private int noticeEndde;//모집기간(종료일)	
	private String srvcClCode;//봉사분야
	private String adultPosblAt;//봉사자유형(성인가능여부)
	private String yngbgsPosblAt;//봉사자유형(청소년가능여부)
	private String familyPosblAt;//봉사자유형(가족가능여부)
	private String pbsvntPosblAt;//봉사자유형(공무원가능여부)
	private String grpPosblAt;//봉사자유형(단체가능여부)
	private String mnnstNm;//모집기관(주관기관명)
	private String nanmmbyNm;//등록기관(나눔주체명)
	private String actPlace;//봉사장소
	private String nanmmbyNmAdmn;//담당자명
	private String telno;//전화번호
	private String fxnum;//FAX번호
	private String postAdres;//우편번호_주소
	private String email;//이메일
	private String progrmCn;//내용
	private int progrmRegistNo;//프로그램등록번호
	private String progrmSj;//봉사제목
	private int progrmSttusSe;//모집상태
	private int rcritNmpr;//모집인원(총인원)
	private int sidoCd;//시도코드
	private int gugunCd;//시군구코드	
	
	private int appTotal;//신청인원수
	
	private int totalCount;
	
	@Override
	public String toString() {
		return "VolunteerVO [actBeginTm=" + actBeginTm + ", actEndTm=" + actEndTm + ", progrmBgnde=" + progrmBgnde
				+ ", progrmEndde=" + progrmEndde + ", noticeBgnde=" + noticeBgnde + ", noticeEndde=" + noticeEndde
				+ ", srvcClCode=" + srvcClCode + ", adultPosblAt=" + adultPosblAt + ", yngbgsPosblAt=" + yngbgsPosblAt
				+ ", familyPosblAt=" + familyPosblAt + ", pbsvntPosblAt=" + pbsvntPosblAt + ", grpPosblAt=" + grpPosblAt
				+ ", mnnstNm=" + mnnstNm + ", nanmmbyNm=" + nanmmbyNm + ", actPlace=" + actPlace + ", nanmmbyNmAdmn="
				+ nanmmbyNmAdmn + ", telno=" + telno + ", fxnum=" + fxnum + ", postAdres=" + postAdres + ", email="
				+ email + ", progrmCn=" + progrmCn + ", progrmRegistNo=" + progrmRegistNo + ", progrmSj=" + progrmSj
				+ ", progrmSttusSe=" + progrmSttusSe + ", rcritNmpr=" + rcritNmpr + ", sidoCd=" + sidoCd + ", gugunCd="
				+ gugunCd + ", appTotal=" + appTotal + "]";
	}

	public int getActBeginTm() {
		return actBeginTm;
	}

	public void setActBeginTm(int actBeginTm) {
		this.actBeginTm = actBeginTm;
	}

	public int getActEndTm() {
		return actEndTm;
	}

	public void setActEndTm(int actEndTm) {
		this.actEndTm = actEndTm;
	}

	public int getProgrmBgnde() {
		return progrmBgnde;
	}

	public void setProgrmBgnde(int progrmBgnde) {
		this.progrmBgnde = progrmBgnde;
	}

	public int getProgrmEndde() {
		return progrmEndde;
	}

	public void setProgrmEndde(int progrmEndde) {
		this.progrmEndde = progrmEndde;
	}

	public int getNoticeBgnde() {
		return noticeBgnde;
	}

	public void setNoticeBgnde(int noticeBgnde) {
		this.noticeBgnde = noticeBgnde;
	}

	public int getNoticeEndde() {
		return noticeEndde;
	}

	public void setNoticeEndde(int noticeEndde) {
		this.noticeEndde = noticeEndde;
	}

	public String getSrvcClCode() {
		return srvcClCode;
	}

	public void setSrvcClCode(String srvcClCode) {
		this.srvcClCode = srvcClCode;
	}

	public String getAdultPosblAt() {
		return adultPosblAt;
	}

	public void setAdultPosblAt(String adultPosblAt) {
		this.adultPosblAt = adultPosblAt;
	}

	public String getYngbgsPosblAt() {
		return yngbgsPosblAt;
	}

	public void setYngbgsPosblAt(String yngbgsPosblAt) {
		this.yngbgsPosblAt = yngbgsPosblAt;
	}

	public String getFamilyPosblAt() {
		return familyPosblAt;
	}

	public void setFamilyPosblAt(String familyPosblAt) {
		this.familyPosblAt = familyPosblAt;
	}

	public String getPbsvntPosblAt() {
		return pbsvntPosblAt;
	}

	public void setPbsvntPosblAt(String pbsvntPosblAt) {
		this.pbsvntPosblAt = pbsvntPosblAt;
	}

	public String getGrpPosblAt() {
		return grpPosblAt;
	}

	public void setGrpPosblAt(String grpPosblAt) {
		this.grpPosblAt = grpPosblAt;
	}

	public String getMnnstNm() {
		return mnnstNm;
	}

	public void setMnnstNm(String mnnstNm) {
		this.mnnstNm = mnnstNm;
	}

	public String getNanmmbyNm() {
		return nanmmbyNm;
	}

	public void setNanmmbyNm(String nanmmbyNm) {
		this.nanmmbyNm = nanmmbyNm;
	}

	public String getActPlace() {
		return actPlace;
	}

	public void setActPlace(String actPlace) {
		this.actPlace = actPlace;
	}

	public String getNanmmbyNmAdmn() {
		return nanmmbyNmAdmn;
	}

	public void setNanmmbyNmAdmn(String nanmmbyNmAdmn) {
		this.nanmmbyNmAdmn = nanmmbyNmAdmn;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public String getFxnum() {
		return fxnum;
	}

	public void setFxnum(String fxnum) {
		this.fxnum = fxnum;
	}

	public String getPostAdres() {
		return postAdres;
	}

	public void setPostAdres(String postAdres) {
		this.postAdres = postAdres;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProgrmCn() {
		return progrmCn;
	}

	public void setProgrmCn(String progrmCn) {
		this.progrmCn = progrmCn;
	}

	public int getProgrmRegistNo() {
		return progrmRegistNo;
	}

	public void setProgrmRegistNo(int progrmRegistNo) {
		this.progrmRegistNo = progrmRegistNo;
	}

	public String getProgrmSj() {
		return progrmSj;
	}

	public void setProgrmSj(String progrmSj) {
		this.progrmSj = progrmSj;
	}

	public int getProgrmSttusSe() {
		return progrmSttusSe;
	}

	public void setProgrmSttusSe(int progrmSttusSe) {
		this.progrmSttusSe = progrmSttusSe;
	}

	public int getRcritNmpr() {
		return rcritNmpr;
	}

	public void setRcritNmpr(int rcritNmpr) {
		this.rcritNmpr = rcritNmpr;
	}

	public int getSidoCd() {
		return sidoCd;
	}

	public void setSidoCd(int sidoCd) {
		this.sidoCd = sidoCd;
	}

	public int getGugunCd() {
		return gugunCd;
	}

	public void setGugunCd(int gugunCd) {
		this.gugunCd = gugunCd;
	}

	public int getAppTotal() {
		return appTotal;
	}

	public void setAppTotal(int appTotal) {
		this.appTotal = appTotal;
	}

    public int getTotalCount() {
      return totalCount;
    }
  
    public void setTotalCount(int totalCount) {
      this.totalCount = totalCount;
    }
	
		
}
