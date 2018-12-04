package com.zs.pms.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

@Controller
public class FrameController {
@Autowired
UserService us;
//去login页面
@RequestMapping("/tologin.do")
public String tologin(){
	return"login";
}

/**
 * 
 * @param query 从页面上带回
 * @param code
 * @param map
 * @param session
 * @param resp
 * @return
 */
@RequestMapping("/login.do")
public String LoginController(QueryUser query,String code,ModelMap map,HttpSession session,HttpServletResponse resp){
	//创建查询对象
			try {
				//获取图片的验证码
				String ocode=(String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
				//判断
				if (!ocode.equals(code)) {
					
					//验证失败
					map.addAttribute("msg", "验证码有误，请重新输入");
					//重定向到登录页	
					//return "redirect:login.jsp";
					//转发
					return "login";
				}
				//调用登录方法判断是否登录成功
				TUser chkLogin = us.chkLogin(query);
				//chkLogin为TUser类型的po对象具有其属性
				//登陆成功把 登录信息放到session中
				session.setAttribute("userBean", chkLogin);
				// 判断是否记住密码 --要判空否则会报错
				if (query.getRem() != null && query.getRem().equals("1")) {
					// 创建cookie 记住账号密码
					Cookie cookie1 = new Cookie("loginname", query.getLoginname());
					Cookie cookie2 = new Cookie("password", query.getPassword());
					// 设置cookie的有效时长
					cookie1.setMaxAge(60);
					cookie2.setMaxAge(60);
					// 将cookie响应给浏览器
					resp.addCookie(cookie1);
					resp.addCookie(cookie2);
				}
//				// 转发主页面
				return "main";
					

			} catch (AppException e) {
				// TODO Auto-generated catch block
				// 登录失败提示
				map.addAttribute("msg", e.getErrMsg()) ;
				//重定向到登录页
				//return "redirect:login.jsp";
				//转发
				return "login";
			}
			
		}
//跳转到left页面
@RequestMapping("/toleft.do")
public String toleft(){
	return"left";
}
//跳转到top页面
@RequestMapping("/totop.do")
public String totop(){
	return"top";
}
//跳转到right页面
@RequestMapping("/toright.do")
public String toright(){
	return"right";
}
}

