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
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>
<!-- 引入jQuery -->
<script type="text/javascript" language="javascript" src="js/jquery-1.11.0.min.js"></script>
<!-- 引入日期控件 -->
<script type="text/javascript" language="javascript" src="../js/DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="../res/css/style.css" />
<title>user-add</title>
<script type="text/javascript">
function upload() {
	
	//ajax请求局部提交
	//设置参数
	var args={
		//url绝对路径
		url:$("#path").val()+"/upload/common.do",
		//返回类型
		dataType:"text",
		//提交方式
		type:"post",
		success:function(result){
			
			// 设置图片的属性
			$("#img").attr("src",$("#path").val()+"/upload/"+result);
			//将路径设置到隐藏域中
			$("#pic").val(result);
		}
	};
	//表单局部提交
	$("#jvForm").ajaxSubmit(args);
}

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
/* function chkloginname(){
	//获取用户名的元素对象
	//var lgele=document.getElementById("loginname");
	//获取用户名对象的属性值
	 var loginname=$("#loginname").val();
	
	//定义匹配用户名的正则表达式
	var reg=new RegExp(CHKLOGINNAME);
	//获取span标签的元素对象，如果符合正则在span标签中显示绿色对勾，反之显示红色错误语句
	//var spanele=document.getElementById("resultName");
	//判断是否匹配
	if(reg.test(loginname)){//正确
		
		if(chkExistLoginname(loginname)){
		
			return true;
		}else{
			
			return false;
		}
	}else{
		$("#resultName").html("用户名必须包含数字和字母，并且不能低于六位");
		$("#resultName").css("color","red");
		$("#loginname").val("");
		$("#loginname").focus();
		return false;
	}
} */
/* //验证用户名的唯一性
function chkExistLoginname(loginname) {
	var flag=false;
	$.ajax({
		//请求路径
		url:'chkuser.do',
		//请求方式
		type:'post',
		// 请求参数
		data:'type=1&loginname='+loginname,
		//是否异步
		async:false,
		//预期服务器返回的数据类型
		dataType:'text',
		//响应成功调用回调函数
		success:function(a){
			if(a=='true'){//没有重复
				$("#resultName").html("✔");
				$("#resultName").css("color","green");
				flag=true;
			}else{
				$("#resultName").html("此用户名已存在");
				$("#resultName").css("color","red");
				flag=false;
			}
		},
		error:function(){
			alert('请求数据失败。。。');
		}
	});
	return flag;
}
 */
/* //验证密码
function chkpassword(){
	var passwordele=document.getElementById("password");
	var password=passwordele.value;
	var reg=new RegExp(CHKPASSWORD);
	var spanele=document.getElementById("resultPassword");
	
	if (reg.test(password)) {
		spanele.innerHTML="✔";
		spanele.style.color="green";
		return true;
	}else {
		spanele.innerHTML="密码必须包含数字和字母，并且不能低于六位，结束前不能全是字母和数字";
		spanele.style.color="red";
		//清空文本框
		passwordele.value="";
		//重新聚焦
		passwordele.focus();
		return false;
	}
} */
/* //验证确认密码
function chkrempwd(){
	var passwordele=document.getElementById("password");
	var password=passwordele.value;
	var rempwdele=document.getElementById("repwd");
	var rempwd=rempwdele.value;
	var spanele=document.getElementById("resultrepwd");
	
	if (password==rempwd) {
		spanele.innerHTML="✔";
		spanele.style.color="green";
		return true;
	}else {
		spanele.innerHTML="两次输入密码不一致";
		spanele.style.color="red";
		//清空文本框
		rempwdele.value="";
		//重新聚焦
		rempwdele.focus();
		return false;
	}
} */
/* //验证真实姓名
function chkrealname(){
	var realnameele=document.getElementById("realname");
	var realname=realnameele.value;
	var reg=new RegExp(CHKREALNAME);
	var spanele=document.getElementById("resultRealname");
	if (reg.test(realname)) {
		spanele.innerHTML="✔";
		spanele.style.color="green";
		return true;
	}else {
		spanele.innerHTML="真实姓名必须为两个及其以上的汉字";
		spanele.style.color="red";
		//清空文本框
		realnameele.value="";
		//重新聚焦
		realnameele.focus();
		return false;
	}
} */
/* //验证邮箱
function chkemail() {
	var emailele=document.getElementById("email");
	var email=emailele.value;
	var reg=new RegExp(CHKEMAIL);
	//var spanele=document.getElementById("resultemail");
	if (reg.test(email)) {
		if (chkExistEmail(email)) {
			return true;
		}else{
			return false;
		}
	}else  {
		$("#resultEml").html("邮箱的格式为xxxxxx@xxx.com");
		$("#resultEml").css("color","red");
		$("#email").val("");
		$("#email").focus();
		return false;
	}
	
} */
/* //检查邮箱是否唯一
function chkExistEmail(email){
	var flag=false;
	$.ajax({
		//请求路径
		url:'chkuser.do',
		//请求方式
		type:'post',
		//请求参数
		data:'type=2&email='+email,
		//是否异步
		async:false,
		//预期服务器返回的数据类型
		dataType:'text',
		//响应成功调用回调函数
		success:function(flag){
			if(flag=='true'){//没有重复
				$("#resultEml").html("✔");
				$("#resultEml").css("color","green");
				flag=true;
			}else{
				$("#resultEml").html("此邮箱已存在");
				$("#resultEml").css("color","red");
				flag=false;
			}
		},
		error:function(){
			alert('请求数据失败。。。');
		}
	});
	return flag;
} */
//文档就绪事件
$(function() {
	//下拉框change事件
	$("#dep1").change(function() {
		//alert($("#dep1").val())
		//清空第二个下拉框
		$("#dep2").empty();
		$.post(
			"getdep.do",//提交的url
			{pid:this.value},//提交的数据json格式
			function(data) {
				//alert(result);
				if(data!=null){
					$(data).each(
						function() {
							//添加数据到第二个下拉框中
							$("#dep2").append("<option value="+this.id+">"+this.name+"</option>");
						}	
					);
				}

			},//成功回调的函数
			"json"//返回类型
			
		);

		
		
		
	});
});

</script>
</head>
<body>
<!-- 获得应用的绝对路径 -->
<input type="hidden" id="path" value="${pageContext.request.contextPath}"/>

<div class="box-positon">
	<div class="rpos">当前位置: 用户管理 - 添加</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='userlist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form id="jvForm" action="add.do" method="post" enctype="multipart/form-data">
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
						用户名:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="loginname" id="loginname" maxlength="100" onblur="chkloginname()"/>
						<span id="resultName"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						密码:</td><td width="80%"  class="pn-fcontent">
						<input type="text" class="required" id="password" name="password" maxlength="100"onblur="chkpassword()"/>
						<span id="resultPassword"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						确认密码:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="repwd" id="repwd" maxlength="100" onblur="chkrempwd()"/>
						<span id="resultrepwd"></span>
						<%-- <span style="color:red">${pwdMsg }</span> --%>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						真实姓名:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="relname" id="relname" maxlength="100" onblur="chkrealname()"/>
						<span id="resultRealname"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						性别:</td><td width="80%" class="pn-fcontent">
						<input type="radio" name="sex" value="男" checked="checked"/>男
						<input type="radio" name="sex" value="女"/>女
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						出生日期:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="Wdate" name="birthday" maxlength="80" onclick="WdatePicker()"/>
						<span id="resultBirthday"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						部门:</td><td width="80%" class="pn-fcontent">
					<select id="dep1" name="dep1">
							<c:forEach items="${LIST}" var="dep1">
								<option value="${dep1.id}" >${dep1.name}</option>
							</c:forEach>
					 </select>
					 <select id="dep2" name="dept.id">
						 <c:forEach items="${LIST2}" var="dep2">
							<option value="${dep2.id}">${dep2.name}</option>	
						</c:forEach>
					 
					 </select>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						邮箱:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="email" id="email" maxlength="80" onblur="chkemail()"/>
						<span id="resultEml"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						头像:</td><td width="80%" class="pn-fcontent">
						<input type="file"  name="file" onchange="upload()"/>
						<img id="img" width="150px" height="150px"/>
						<!-- 提交图片路径 -->
						<input type="hidden" name="pic" id="pic" />
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