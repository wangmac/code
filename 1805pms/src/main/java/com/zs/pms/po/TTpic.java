package com.zs.pms.po;

import java.io.Serializable;

public class TTpic implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9184826822617192873L;
	private int  id;
	private int   pid;//商品id
	private String   picurl;//图片url
	private int    isdefault;//是否默认
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPicurl() {
		return picurl;
	}
	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}
	public int getIsdefault() {
		return isdefault;
	}
	public void setIsdefault(int isdefault) {
		this.isdefault = isdefault;
	}
	
}
