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

<script type="text/javascript">
//定义标题的正则表示式 大于三个的汉字
var CHKCNAME="^[\u4e00-\u9fa5]{3,}$";
//定义等级的正则表达式只能是1或2；
var CHKLEV="^[1]|[2]$";
//验证标题的正则
function chkcname() {
	var cnameele=document.getElementById("cname");
	var cname=cnameele.value;
	var reg=new RegExp(CHKCNAME);
	var spanele=document.getElementById("resultcname");
	
	if (reg.test(cname)) {
		spanele.innerHTML="✔";
		spanele.style.color="green";
		return true;
	}else {
		spanele.innerHTML="标题名称必须为超过三个（包含三个）的汉字";
		spanele.style.color="red";
		//清空文本框
		cname.value="";
		//重新聚焦
		cname.focus();
		return false;
	}
}

//验证等级的正则
function chklev() {
	var levele=document.getElementById("lev");
	var lev=levele.value;
	var reg=new RegExp(CHKLEV);
	var spanele=document.getElementById("resultlev");
	if (reg.test(lev)) {
		spanele.innerHTML="✔";
		spanele.style.color="green";
		return true;
	}else {
		spanele.innerHTML="等级只能填写1或2";
		spanele.style.color="red";
		//清空文本框
		lev.value="";
		//重新聚焦
		lev.focus();
		return false;
	}
}



</script>
<link rel="stylesheet" href="res/css/style.css" />
<title>fastreport-add</title>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 频道管理 - 添加</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='channellist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form id="jvForm" action="channeladd.do" method="post">
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
						频道名:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="cname" maxlength="100" id="cname" onclick="chkcname()"/>
						<span id="resultcname"></span>
					</td>
				</tr>
				<!-- <tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						内容:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="content" maxlength="100" id="content" onclick="chkcontent()"/>
						<span id="resultcontent"></span>
					</td>
				</tr> -->
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						上级频道:</td><td width="80%" class="pn-fcontent">
						<select name="pid">
							<c:forEach items="${channels}" var="channel">
								<option value="${channel.id}" name="id">${channel.cname}</option>
							</c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						等级:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="lev" maxlength="100" id="lev" onclick="chklev()"/>
						<span id="resultlev"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						是否推荐:</td><td width="80%" class="pn-fcontent">
						<input type="radio" name="isleaf" value="1" checked="checked"/>推荐
						<input type="radio" name="isleaf" value="0"/>非推荐
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