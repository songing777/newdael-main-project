package com.vongether.member.model;

import java.sql.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.vongether.common.util.Aria;

// 실제 데이터를 담게 될 클래스에 어노테이션으로 유효성 체크
public class MemberVO {

    @NotNull(message = "아이디를 입력해주세요")
    private String mId;

    @NotNull(message = "이름를 입력해주세요")
    private String mName;

    @NotNull(message = "성별을 입력해주세요")
    private String mGender;

    @NotNull(message = "생년월일을 선택해주세요")
    private Date mBirth;

    @NotNull(message = "비밀번호를 입력해주세요")
    private String mPwd;

    @NotNull(message = "우편번호를 선택해주세요")
    private int mPostcode;

    @NotNull(message = "주소를 선택해주세요")
    private String mAddr1;

    @NotNull(message = "상세주소를 입력해주세요")
    private String mAddr2;

    @NotNull(message = "등급이 들어갑니다")
    private String mRole;

    private String mAuthCode;

    public String getmAuthCode() {
	return mAuthCode;
    }

    public void setmAuthCode(String mAuthCode) {
	this.mAuthCode = mAuthCode;
    }

    public String getmId() {
	return mId;
    }

    public void setmId(String mId) {
	this.mId = mId;
    }

    public String getmName() {
	return mName;
    }

    public void setmName(String mName) {
	this.mName = mName;
    }

    public String getmGender() {
	return mGender;
    }

    public void setmGender(String mGender) {
	this.mGender = mGender;
    }

    public Date getmBirth() {
	return mBirth;
    }

    public void setmBirth(Date mBirth) {
	this.mBirth = mBirth;
    }

    public String getmPwd() {
	return mPwd;
    }

    // 가입 폼의 입력시 ARIA 암호화 적용되어 DB에 저장
    public void setmPwd(String mPwd) {
	String key = "AriaTestKey";
	Aria aria = new Aria(key);
	this.mPwd = aria.Encrypt(mPwd);
    }

    public int getmPostcode() {
	return mPostcode;
    }

    public void setmPostcode(int mPostcode) {
	this.mPostcode = mPostcode;
    }

    public String getmAddr1() {
	return mAddr1;
    }

    public void setmAddr1(String mAddr1) {
	this.mAddr1 = mAddr1;
    }

    public String getmAddr2() {
	return mAddr2;
    }

    public void setmAddr2(String mAddr2) {
	this.mAddr2 = mAddr2;
    }

    public String getmRole() {
	return mRole;
    }

    public void setmRole(String mRole) {
	this.mRole = mRole;
    }

    @Override
    public String toString() {
	return "MemberVO [mId=" + mId + ", mName=" + mName + ", mGender=" + mGender + ", mBirth=" + mBirth + ", mPwd="
		+ mPwd + ", mPostcode=" + mPostcode + ", mAddr1=" + mAddr1 + ", mAddr2=" + mAddr2 + ", mRole=" + mRole
		+ ", mAuthCode=" + mAuthCode + "]";
    }

}
