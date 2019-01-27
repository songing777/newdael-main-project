package com.vongether.volunteer.model;

import java.sql.Date;

public class VolunteerAppVo {
	private int appNo;
	private String appName;
	private String appPlace;
	private String appBegintm;	
	private String appEndtm;
	private String mId;
	

	public String getAppBegintm() {
		return appBegintm;
	}
	public void setAppBegintm(String appBegintm) {
		this.appBegintm = appBegintm;
	}
	public String getAppEndtm() {
		return appEndtm;
	}
	public void setAppEndtm(String appEndtm) {
		this.appEndtm = appEndtm;
	}
	public int getAppNo() {
		return appNo;
	}
	public void setAppNo(int appNo) {
		this.appNo = appNo;
	}
	public String getAppName() {
		return appName;
	}
	public void setAppName(String appName) {
		this.appName = appName;
	}
	public String getAppPlace() {
		return appPlace;
	}
	public void setAppPlace(String appPlace) {
		this.appPlace = appPlace;
	}


	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	
	
}
