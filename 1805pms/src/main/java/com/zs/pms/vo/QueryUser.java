package com.zs.pms.vo;

import java.io.Serializable;

public class QueryUser extends QueryPage {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7586244054485448310L;
    private String loginname;
    private String password;
    private int isenabled;
    private String sex;
    private String chkCode;
    private String rem;
    private String realname;
	public String getRealname() {
	return realname;
}
public void setRealname(String realname) {
	this.realname = realname;
}
	public String getChkCode() {
		return chkCode;
	}
	public void setChkCode(String chkCode) {
		this.chkCode = chkCode;
	}
	public String getRem() {
		return rem;
	}
	public void setRem(String rem) {
		this.rem = rem;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getIsenabled() {
		return isenabled;
	}
	public void setIsenabled(int isenabled) {
		this.isenabled = isenabled;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
