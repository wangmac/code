<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="res/common/js/jquery.js" type="text/javascript"></script>
<script src="res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="res/common/js/lecheng.js" type="text/javascript"></script>
<script src="res/lecheng/js/admin.js" type="text/javascript"></script>
<!-- 引入jquery -->
<script type="text/javascript" language="javascript" src="js/jquery-1.11.0.min.js"></script>
<!-- 引入时间控件 -->
<script type="text/javascript" language="javascript" src="js/DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
<!-- 添加表单验证 -->
//标题：三位及其以上的汉字
var CHKTITLE="^[\u4e00-\u9fa5]{3,}$";
//内容:五位及其以上的汉字
var CHKCONTENT="^[\u4e00-\u9fa5]{5,}$";
//作者 两位及其以上的汉字
var CHKAUTHOR="^[\u4e00-\u9fa5]{2,}$";
//验证标题
function chktitle(){
	//获取用户名的元素对象
	var titleele=document.getElementById("title");
	//获取用户名对象的属性值
	 var title=titleele.value;
	//定义匹配用户名的正则表达式
	var reg=new RegExp(CHKTITLE);
	//获取span标签的元素对象，如果符合正则在span标签中显示绿色对勾，反之显示红色错误语句
	var spanele=document.getElementById("resulttitle");
	//判断是否匹配
	if (reg.test(title)) {//符合正则
		spanele.innerHTML="✔";
		spanele.style.color="green";
		return true;
	}else{
		spanele.innerHTML="标题须为三位及其以上的汉字";
		spanele.style.color="red";
		//清空文本框
		titleele.value="";
		//重新聚焦
		titleele.focus();
		return false;
	}
}
//验证内容
function chkcontent(){
	var contentele=document.getElementById("content");
	var content=contentele.value;
	var reg=new RegExp(CHKCONTENT);
	var spanele=document.getElementById("resultcontent");
	
	if (reg.test(content)) {
		spanele.innerHTML="✔";
		spanele.style.color="green";
		return true;
	}else {
		spanele.innerHTML="内容须为二位及其以上的汉字";
		spanele.style.color="red";
		//清空文本框
		contentele.value="";
		//重新聚焦
		contentele.focus();
		return false;
	}
}
//验证作者
function chkauthor(){
	//获取用户名的元素对象
	var authorele=document.getElementById("author");
	//获取用户名对象的属性值
	 var author=authorele.value;
	//定义匹配用户名的正则表达式
	var reg=new RegExp(CHKAUTHOR);
	//获取span标签的元素对象，如果符合正则在span标签中显示绿色对勾，反之显示红色错误语句
	var spanele=document.getElementById("resultauthor");
	//判断是否匹配
	if (reg.test(author)) {//符合正则
		spanele.innerHTML="✔";
		spanele.style.color="green";
		return true;
	}else{
		spanele.innerHTML="作者须为三位及其以上的汉字";
		spanele.style.color="red";
		//清空文本框
		authorele.value="";
		//重新聚焦
		authorele.focus();
		return false;
	}
}

</script>
<link rel="stylesheet" href="res/css/style.css" />
<title>article-add</title>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 文章管理 - 添加</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='articlelist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form id="jvForm" action="articleadd.do" method="post">
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired"></span>
						<span class="pn-frequired">${msg}</span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						标题:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="title" maxlength="100" id="title" onclick="chktitle()"/>
						<span id="resulttitle"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						内容:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="content" maxlength="100" id="content" onclick="chkcontent()"/>
						<span id="resultcontent"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						作者:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="author" maxlength="100" id="author" onclick="chkauthor"/>
						<span id="resultauthor"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						创建时间:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="Wdate"  name="ctime" maxlength="100" onclick="WdatePicker()"/>
						<span style="color:red">${pwdMsg }</span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						频道:</td><td width="80%" class="pn-fcontent">
						<select name="channel">
							<c:forEach items="${channels }" var="channel">
								<option value="${channel.id }">${channel.cname }</option>
							</c:forEach>				
						</select>
						</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						是否推荐:</td><td width="80%" class="pn-fcontent">
						<input type="radio" name="isremod" value="1" checked="checked"/>推荐
						<input type="radio" name="isremod" value="0"/>非推荐
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						是否热点:</td><td width="80%" class="pn-fcontent">
						<input type="radio" name="ishot" value="1" checked="checked"/>热点
						<input type="radio" name="ishot" value="0"/>非热点
					</td>
				</tr>
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