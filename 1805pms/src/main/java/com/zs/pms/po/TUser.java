package com.zs.pms.po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.zs.pms.util.DateUtil;

public class TUser implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5293214558214995122L;
	private int id;
	private String loginname;
	private String password;
	private String sex;
	private Date birthday;
	private String email;
	private String relname;
	private int creator;
	private Date creatime;
	private int updator;
	private Date updatime;
	private String pic;
	private int isenabled;
	private String isenabledtxt;
	private String birthdayTxt;

	public String getBirthdayTxt() {
		if (birthday != null) {
			return DateUtil.getDateToStr(birthday, "yyyy-MM-dd");
		}
		return birthdayTxt;
	}

	public void setBirthdayTxt(String birthdayTxt) {
		this.birthdayTxt = birthdayTxt;
	}

	public String getIsenabledtxt() {
		if (isenabled == 1) {
			return "可用";
		} else {
			return "不可用";
		}

	}

	public void setIsenabledtxt(String isenabledtxt) {
		this.isenabledtxt = isenabledtxt;
	}

	// 一对多关联权限表
	private List<TPermission> permissions;
	private TDept dept;// 一对一关联部门表
	private List<TPermission> menu = new ArrayList<>();

	public List<TPermission> getMenu() {
		// 清空
		menu.clear();
		for (TPermission per1 : permissions) {
			// 一级菜单
			if (per1.getPid() == 0) {
				// 清空
				per1.getChildren().clear();
				// 再次全部循环，找出二级菜单的pid==一级菜单id的菜单
				for (TPermission per2 : permissions) {
					if (per1.getId() == per2.getPid()) {
						// 找到二级菜单放入一级菜单下
						// per1为Tpermission对象，getChildren是给childre设置属性（它是一个集合）
						per1.getChildren().add(per2);
					}
				}
				// 将装载好的一级菜单放入菜单中
				menu.add(per1);
			}

		}

		return menu;
	}

	public List<TPermission> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<TPermission> permissions) {
		this.permissions = permissions;
	}

	// private int dept;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public TDept getDept() {
		return dept;
	}

	public void setDept(TDept dept) {
		this.dept = dept;
	}

	public String getRelname() {
		return relname;
	}

	public void setRelname(String realname) {
		this.relname = realname;
	}

	public int getCreator() {
		return creator;
	}

	public void setCreator(int creator) {
		this.creator = creator;
	}

	public Date getCreatime() {
		return creatime;
	}

	public void setCreatime(Date creatime) {
		this.creatime = creatime;
	}

	public int getUpdator() {
		return updator;
	}

	public void setUpdator(int updator) {
		this.updator = updator;
	}

	public Date getUpdatime() {
		return updatime;
	}

	public void setUpdatime(Date updatime) {
		this.updatime = updatime;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public int getIsenabled() {
		return isenabled;
	}

	public void setIsenabled(int isenabled) {
		this.isenabled = isenabled;
	}

}
