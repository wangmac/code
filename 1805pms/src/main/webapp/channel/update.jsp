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
<script type="text/javascript" src="res/fckeditor/fckeditor.js"></script>
<script src="res/common/js/jquery.js" type="text/javascript"></script>
<script src="res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="res/common/js/lecheng.js" type="text/javascript"></script>
<script src="res/lecheng/js/admin.js" type="text/javascript"></script>
<!--添加正则-->
<script type="text/javascript">

//定义标题的正则表示式 大于三个的汉字
var CHKTITLE="^[\u4e00-\u9fa5]{3,}$";
//定义内容的正则表达式 大于五个的汉字
var CHKCONTENT="^[\u4e00-\u9fa5]{5,}$";
//定义等级的正则表达式只能是1或2；
var CHKLEV="^[1]|[2]$";
//验证标题的正则
function chktitle() {
	var titleele=document.getElementById("title");
	var title=titleele.value;
	var reg=new RegExp(CHKTITLE);
	var spanele=document.getElementById("resulttitle");
	if (reg.test(title)) {
		spanele.innerHTML="✔";
		spanele.style.color="green";
		return true;
	}else {
		spanele.innerHTML="标题名称必须为超过三个（包含三个）的汉字";
		spanele.style.color="red";
		//清空文本框
		title.value="";
		//重新聚焦
		title.focus();
		return false;
	}
}


</script>
<link rel="stylesheet" href="res/css/style.css" />
<title>channel-update</title>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 频道管理 - 修改</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='channellist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form id="jvForm" action="channelupdate.do?id=${channel.id }" method="post">
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
						频道名称:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="cname" maxlength="100" id="title" onclick="chktitle()" value="${channel.cname } "/>
						<span id="resulttitle"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						上级频道:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="pid" maxlength="100" value="${channel.pid }"/>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						等级:</td><td width="80%" class="pn-fcontent">
						<c:if test="${channel.level=='1' }">
						<input type="radio" name="lev" value="1" checked="checked"/>一级
						<input type="radio" name="lev" value="2"/>二级
						</c:if>
						<c:if test="${channel.level=='2' }">
						<input type="radio" name="lev" value="1" />一级
						<input type="radio" name="lev" value="2" checked="checked"/>二级
						</c:if>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否叶子:</td><td width="80%" class="pn-fcontent">
						<c:if test="${channel.leaf=='1' }">
						<input type="radio" name="isleaf" value="1" checked="checked"/>是
						<input type="radio" name="isleaf" value="2"/>否
						</c:if>
						<c:if test="${channel.leaf=='2' }">
						<input type="radio" name="isleaf" value="1" />是
						<input type="radio" name="isleaf" value="2" checked="checked"/>否
						</c:if>
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