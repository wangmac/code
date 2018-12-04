package com.zs.pms.po;

import java.io.Serializable;

public class TRolePermission implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3368751694113465188L;
	private int id;//角色权限id
	private int rid;//角色id
	private int pid;//权限id
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
}
