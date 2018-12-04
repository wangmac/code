package com.zs.pms.po;

import java.io.Serializable;

public class TUserRole implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3757325721243899060L;
    private int id;//用户角色id
    private int usid;//用户id
    private int rid;//角色id
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUsid() {
		return usid;
	}
	public void setUsid(int usid) {
		this.usid = usid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
}
