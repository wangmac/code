package com.zs.pms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDept;
import com.zs.pms.po.TUser;
import com.zs.pms.service.DeptService;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;
@Controller
public class UserController {
	@Autowired
	UserService us;
	@Autowired
	DeptService ds;
@RequestMapping("/user/list.do")
public String list(QueryUser query,String page,ModelMap map){
	
	try {
		//判断page是否为空
		if (page==null||"".equals(page)) {
			page="1";//默认第一页
		}
		//会带分页查询到的数据
		map.addAttribute("users", us.queryByPage(query, Integer.parseInt(page)));
		//回带总页数
		map.addAttribute("PAGECOUNT", us.queryPageCount(query));
		//回带当前页数
		map.addAttribute("PAGE",page);
		//查询条件回带
		map.addAttribute("QUERY", query);
	} catch (NumberFormatException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (AppException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return"user/list";
	
}
@RequestMapping("/user/toadd.do")
public String add(ModelMap map){
	 // 查出上级部门
	List<TDept> list1= ds.queryByPid(0);
	//回带
	map.addAttribute("LIST", list1);
	List<TDept> list2=ds.queryByPid(list1.get(0).getId());
	map.addAttribute("LIST2", list2);
	return "user/add";
}
//获得二级下拉菜单
@RequestMapping("/user/getdep.do")
@ResponseBody
public List<TDept> geTDept(int pid){
	 List<TDept> list=ds.queryByPid(pid);
return list;
}
//添加用户
@RequestMapping("/user/add.do")	
public String add(TUser user,ModelMap map,HttpSession session){
	try {
		TUser cuser =(TUser) session.getAttribute("userBean");
		user.setCreator(cuser.getId());
		user.setIsenabled(1);
		
		us.insert(user);
		return "redirect:list.do";
	} catch (AppException e) {
		// TODO Auto-generated catch block
		map.addAttribute("msg", e.getErrMsg());
		return this.add(map);
	}
}
//删除单个
@RequestMapping("/user/delete.do")	
public String delete(int id){
	us.delete(id);
	return  "redirect:list.do";
}
//删除多条
@RequestMapping("/user/deletes.do")	
public String deletes(int[] ids){
	us.deleteByids(ids);
	return  "redirect:list.do";
}
//获得信息用于修改
@RequestMapping("/user/get.do")	
public String get(int id,ModelMap map){
TUser user=	us.queryById(id);
map.addAttribute("user", user);
// 查出上级部门
	List<TDept> list1= ds.queryByPid(0);
	//回带
	map.addAttribute("LIST", list1);
	List<TDept> list2=ds.queryByPid(list1.get(0).getId());
	map.addAttribute("LIST2", list2);
	return "user/update";
}
//修改
@RequestMapping("/user/update.do")	
public String update(TUser user,ModelMap map,HttpSession session){
	TUser cuser= (TUser) session.getAttribute("userBean");
	user.setUpdator(cuser.getId());
	int u=user.getUpdator();
	try {
		us.update(user);
		return  "redirect:list.do";
	} catch (AppException e) {
		// TODO Auto-generated catch block
		map.addAttribute("msg", e.getErrMsg());
		return get(user.getId(), map);
	}
}
}
