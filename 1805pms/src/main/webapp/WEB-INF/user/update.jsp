<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
<script type="text/javascript" src="res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>
<!-- 引入时间控件 -->
<script type="text/javascript" language="javascript" src="../js/DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="res/css/style.css" />
<script type="text/javascript"  >
<!-- 添加表单验证 -->
//用户名：数字+字母，结束之前不能全部都是数字，6-16
var CHKLOGINNAME="^(?![0-9]+$)[a-zA-Z0-9]{6,16}$";
//密码:数字+字母，结束之前不能全部都是数字和字母，6-16
var CHKPASSWORD="^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,16}$";
//出生日期     yyyy-MM-dd  月份1-12     日期1-31
var CHKDATE="^[0-9]{4}-0?[1-9]|1[0-2]-0?[1-9]|[1-2][0-9]|3[0-1]$";
//邮箱xxxxxx@xxx.com,可以包含_      企业邮箱qwe@huewei.com.cn
var CHKEMAIL="^[a-zA-Z0-9_]+@[a-z0-9]{2,5}(\\.[a-z]{2,3}){1,2}$";
//真实姓名 两位及其以上的汉字
var CHKREALNAME="^[\u4e00-\u9fa5]{2,}$";
//验证用户名
function chkloginname(){
	//获取用户名的元素对象
	var lgele=document.getElementById("loginname");
	//获取用户名对象的属性值
	 var loginname=lgele.value;
	//定义匹配用户名的正则表达式
	var reg=new RegExp(CHKLOGINNAME);
	//获取span标签的元素对象，如果符合正则在span标签中显示绿色对勾，反之显示红色错误语句
	var spanele=document.getElementById("resultName");
	//判断是否匹配
	if (reg.test(loginname)) {//符合正则
		spanele.innerHTML="✔";
		spanele.style.color="green";
		return true;
	}else{
		spanele.innerHTML="用户名必须包含数字和字母，并且不能低于六位";
		spanele.style.color="red";
		//清空文本框
		lgEle.value="";
		//重新聚焦
		lgEle.focus();
		return false;
	}
}

//验证真实姓名
function chkrealname(){
	var realnameele=document.getElementById("realname");
	var realname=realnameele.value;
	var reg=new RegExp(CHKREALNAME);
	var spanele=document.getElementById("resultRealname");
	if (reg.test(realname)) {
		spanele.innerHTML="✔";
		spanele.style.colro="green"
		return true;
	}else {
		spanele.innerHTML="真实姓名必须为两个及其以上的汉字";
		spanele.style.color="red";
		//清空文本框
		realname.value="";
		//重新聚焦
		realname.focus();
		return false;
	}
}
//验证邮箱
function chkemail() {
	var emailele=document.getElementById("email");
	var email=emailele.value;
	var reg=new RegExp(CHKEMAIL);
	var spanele=document.getElementById("resultemail");
	if (reg.test(email)) {
		spanele.innerHTML="✔"
			spanele.style.color="green";
		return true;
	}else  {
		spanele.innerHTML="邮箱的格式为xxxxxx@xxx.com"
		spanele.style.color="red";
		//清空文本框
		email.value="";
		//重新聚焦
		email.focus();
		return false;
	}
	
}


</script>
<title>user-update</title>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 用户管理 - 修改</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='list.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form id="jvForm" action="update.do?id=${user.id }" method="post">
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody>
				<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired"></span> <span class="pn-frequired">${msg}</span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 用户名:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							class="required" name="loginname" id="loginname" maxlength="100"
							value="${user.loginname }" onclick="chkloginname()"/>
							<span id="resultName"></span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 真实姓名:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							class="required" name="realname"  id="realname" maxlength="100" onclick="chkrealname()"
							value="${user.relname }" />
							<span id="resultRealname"></span></td></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">性别:</td>
						<td width="80%" class="pn-fcontent"><c:if
								test="${user.sex=='男' }">
								<input type="radio" name="sex" value="男" checked="checked" />男
							<input type="radio" name="sex" value="女" />女
						</c:if> <c:if test="${user.sex=='女' }">
								<input type="radio" name="sex" value="男" />男
							<input type="radio" name="sex" value="女" checked="checked" />女
						</c:if></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">出生日期:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							class="Wdate" name="birthday" maxlength="80" onclick="WdatePicker()"
							value="${user.birthdayTxt }" /></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">部门:</td>
						<td width="80%" class="pn-fcontent">
							<select id="dep1" name="dep1">
								<c:forEach items="${LIST}" var="dep1">
								<!-- 被修改的用户的pid等于 一级部门的id-->
									<c:if test="${user.dept.pid==dep1.id}">
										<option value="${dep1.id}" >${dep1.name}</option>
									</c:if>
									<!-- 不相等 -->
									<c:if test="${user.dept.pid!=dep1.id}">
										<option value="${dep1.id}" >${dep1.name}</option>
									</c:if>
								</c:forEach>
					      </select>
					 	 <select id="dep2" name="dept.id">
							 <c:forEach items="${LIST2}" var="dep2">
						    	<c:if test="${user.dept.id==dep2.id}">
									<option value="${dep2.id}" >${dep2.name}</option>
								</c:if>
							<c:if test="${user.dept.id!=dep2.id}">
								<option value="${dep2.id}" >${dep2.name}</option>
							</c:if>
							</c:forEach>
					 
					 </select>
							</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">是否可用:</td>
						<td width="80%" class="pn-fcontent"><c:if
								test="${user.isenabled==1 }">
								<input type="radio" class="required" name="enabled"
									maxlength="80" value="1" checked="checked" />可用
							<input type="radio" class="required" name="enabled"
									maxlength="80" value="2" />不可用
									
									
														<!-- 0 -->
						</c:if> <c:if test="${user.isenabled!=1 }">
								<input type="radio" class="required" name="enabled"
									maxlength="80" value="1" />可用
							<input type="radio" class="required" name="enabled"
									maxlength="80" value="2" checked="checked" />不可用
						</c:if></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">邮箱:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							class="required" name="email" id="email" maxlength="80"
							value="${user.email }" onclick="chkemail()"/>
							<span id="resultemail"></span></td>
					</tr>
				<input type="hidden" name="isenabled" value="${user.isenabled} "/>
				<input type="hidden" name="id" value="${user.id} "/>
			</tbody>
			<tbody>
				<tr>
					<td class="pn-fbutton" colspan="2">
						<input type="submit" class="submit" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>