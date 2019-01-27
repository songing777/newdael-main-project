package com.vongether.volunteer.model;

public class VolunteerSimpleVo {
	int v_no;//프로그램 코드
	int v_appcount;//신청 인원
	int v_apptotal;//모집 인원
	String v_state;//모집 상태
	public int getV_no() {
		return v_no;
	}
	public void setV_no(int v_no) {
		this.v_no = v_no;
	}
	public int getV_appcount() {
		return v_appcount;
	}
	public void setV_appcount(int v_appcount) {
		this.v_appcount = v_appcount;
	}
	public int getV_apptotal() {
		return v_apptotal;
	}
	public void setV_apptotal(int v_apptotal) {
		this.v_apptotal = v_apptotal;
	}
	public String getV_state() {
		return v_state;
	}
	public void setV_state(String v_state) {
		this.v_state = v_state;
	}
	@Override
	public String toString() {
		return "VolunteerSimpleVo [v_no=" + v_no + ", v_appcount=" + v_appcount + ", v_apptotal=" + v_apptotal
				+ ", v_state=" + v_state + "]";
	}
	
	
}
