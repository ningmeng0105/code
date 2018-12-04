<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 引入标签库 -->
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<link href="res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- 引时间控件 -->
<script type="text/javascript" src="js/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="res/fckeditor/fckeditor.js"></script>
<script src="res/common/js/jquery.js" type="text/javascript"></script>
<script src="res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="res/common/js/lecheng.js" type="text/javascript"></script>
<script src="res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="res/css/style.css" />


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>user-add</title>
<!-- 添加表单验证 -->
<script type="text/javascript">
	//用户名：数字+字母，结束之前不能全部都是数字，6-16
	var CHKLOGINNAME="^(?![0-9]+$)[a-zA-Z0-9]{3,16}$";
	//密码：数字+字母，结束之前不能全部都是数字或字母，6-16
	var CHKPASSWORD="^(?![0-9]+$)(?![a-z]+$)[a-zA-Z0-9]{6,16}$";
	//邮箱xxxx@xx.com,可以包含_  企业邮箱qwert@zhongxing.com.cn
	var CHKEMAIL="^[a-zA-Z0-9]+@[a-z0-9]{2,5}(\\.[a-z]{2,3}){1,2}$";
	//真实姓名
	var CHKREALNAME="^([\u4e00-\u9fa5]{2,5}|[a-zA-Z]{3,16})$";

	

	$(function(){
		//下拉框change事件
		$("#dept1").change(function(){
			//清空第二个下拉框
			$("#dept2").empty();
			//调用jQuery的提交方法
			//Ajax异步提交
			$.post("getdep.do",//提交的URL
					{pid:this.value},//提交的数据
					function(result){
						if(result !=  null){
							$(result).each(function(){
								//添加数据到第二个下拉框中
								$("#dept2").append("<option value="+this.id+">"+this.name+"</option>");
							});
						}

						
					},//成功后回调的方法
					"json"//返回类型
					);
		});
	});
	
	
</script>
<style type="">
.h2_ch a:hover, .h2_ch a.here {
    color: #FFF;
    font-weight: bold;
    background-position: 0px -32px;
}
.h2_ch a {
    float: left;
    height: 32px;
    margin-right: -1px;
    padding: 0px 16px;
    line-height: 32px;
    font-size: 14px;
    font-weight: normal;
    border: 1px solid #C5C5C5;
    background: url('res/lecheng/img/admin/bg_ch.gif') repeat-x scroll 0% 0% transparent;
}
a {
    color: #06C;
    text-decoration: none;
}
</style>

</head>
<body>
	<div id="">
		<img src="../images/logo4.png"/>
	</div>
<div class="box-positon">
	<div class="rpos">当前位置: 用户管理 - 修改</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='userlist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>

<div class="body-box" style="float:right">
	<form id="jvForm" action="userupdate.do?id=${user.id }" method="post" >
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody id="tab_1">
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						用户名:</td><td width="80%" class="pn-fcontent">
						<input type="text" value="${user.loginname }" class="required" name="loginname"  id="loginname" maxlength="10" onblur="chkloginname()"/>
						<span id="resultName"></span>
					</td>
					</td>
				</tr>
			
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						真实姓名:</td><td width="80%" class="pn-fcontent">
						<input type="text" id="realname" class="required" value="${user.realname }" name="realname" maxlength="10" onblur="chkrealname()"/>
						<span id="resultReName"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						性别:</td><td width="80%" class="pn-fcontent">
						<c:if test="${user.sex=='男' }">
							<input type="radio"  value="男" name="sex"  checked="checked"/>男
							<input type="radio" value="女"  name="sex" />女
						</c:if>
						<c:if test="${user.sex=='女' }">
						<input type="radio" value="男"  name="sex"  "/>男
							<input type="radio" value="女"  name="sex" checked="checked"/>女
						</c:if>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						出生日期:</td><td width="80%" class="pn-fcontent">
							<!--引时间控件-->
						<input type="text"  name="birthday" maxlength="80"  value="${user.birthdayTxt }" class="Wdate" onclick="WdatePicker()" />
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						email:</td><td width="80%" class="pn-fcontent">
						<input type="text" id="email" value="${user.email }" class="required" name="email" maxlength="64" onblur="chkemail()"/>
						<span id="resultEmail"></span>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						部门:</td><td width="80%" class="pn-fcontent">
						<select id="dept1" name="dept1">
							<c:forEach items="${depts1 }" var="dept1">
							<c:if test="${user.dept.pid==dept1.id }">
								<option value="${dept1.id }" name="id" selected="selected">${dept1.name }</option>
							</c:if>
							<c:if test="${user.dept.pid!=dept1.id }">
								<option value="${dept1.id }" name="id" >${dept1.name }</option>
							</c:if>
							</c:forEach>
						</select>
						<select id="dept2" name="dept.id">
							<c:forEach items="${depts2 }" var="dept2">
							<c:if test="${user.dept.id==dept2.id }">
								<option value="${dept2.id }" name="id" selected="selected">${dept2.name }</option>
							</c:if>
							<c:if test="${user.dept.id!=dept2.id }">
								<option value="${dept2.id }" name="id" >${dept2.name }</option>
							</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否可用:</td><td width="80%" class="pn-fcontent">
						<c:if test="${user.isenabled==1 }">
							<input type="radio" value="1" name="isenabled"   checked="checked"/>可用
							<input type="radio" value="-1" name="isenabled" /> 不可用
						</c:if>
						<c:if test="${user.isenabled==-1 }">
							<input type="radio" value="1" name="isenabled"  />可用
							<input type="radio" value="-1" name="isenabled"  checked="checked"/> 不可用
						</c:if>
					</td>
				</tr>
				<input type="hidden" name="id" value="${user.id }"/>
			</tbody>
			<tbody id="tab_2" style="display: none">
				<tr>
					<td >
						<textarea rows="10" cols="10" id="productdesc" name="description"></textarea>
					</td>
				</tr>
			</tbody>
			<tbody id="tab_3" style="display: none">
				<tr>
					<td >
						<textarea rows="15" cols="136" id="productList" name="packageList"></textarea>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="pn-fbutton" colspan="2">
						<input type="submit" onclick="if(!confirm('您确定修改吗？')) {return false;}" class="submit" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>