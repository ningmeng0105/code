<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 引入标签库 -->
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<link href="res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>
<!-- 引入jQuery -->
<!-- script type="text/javascript" language="javascript" src="js/jquery-1.11.0.min.js"/-->
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
	//用户名：数字+字母，结束之前不能全部都是数字，3-16
	var CHKLOGINNAME="^(?![0-9]+$)[a-zA-Z0-9]{3,16}$";
	//密码：数字+字母，结束之前不能全部都是数字或字母，6-16
	var CHKPASSWORD="^(?![0-9]+$)(?![a-z]+$)[a-zA-Z0-9]{6,16}$";
	//邮箱xxxx@xx.com,可以包含_  企业邮箱qwert@zhongxing.com.cn
	var CHKEMAIL="^[a-zA-Z0-9]+@[a-z0-9]{2,5}(\\.[a-z]{2,3}){1,2}$";
	//真实姓名
	var CHKREALNAME="^([\u4e00-\u9fa5]{2,5}|[a-zA-Z]{3,16})$";
	

	function upload(){
		
		//ajax请求 局部提交
		//设置参数
		var args={
				//url绝对路径
				url:$("#path").val()+"/upload/common.do",
				//返回类型
				dataType:"text",
				//提交方式
				type:"post",
				success:function(result){
					//设置图片属性 回显
					$("#img").attr("src",$("#path").val()+"/upload/"+result);
					//将路径设置到隐藏域中
					$("#picurl").val(result);
				}//成功执行 data是返回值
		};
		//局部表单提交
		$("#jvForm").ajaxSubmit(args);
	}
	

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
<!-- 获得相应的绝对路径 -->
<input type="hidden" id="path" value="${pageContext.request.contextPath }" />

	<div id="">
		<img src="../images/logo4.png"/>
	</div>
<div class="box-positon">
	<div class="rpos">当前位置: 用户管理 - 添加</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='userlist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>

<div class="body-box" style="float:right">
	<form name="fm" id="jvForm" action="useradd.do" method="post" enctype="multipart/form-data">
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody id="tab_1">
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						登录名:</td><td width="80%" class="pn-fcontent">
						<input type="text" value="" class="required" name="loginname" id="loginname" maxlength="10" onblur="chkloginname()"/>
						<span id="resultName"></span>
					</td>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						密码:</td><td width="80%" class="pn-fcontent">
						<input type="password" id="password" class="required" name="password" maxlength="10" onblur="chkpassword()"/>
						<span id="resultPwd"></span>
					</td>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						确认密码:</td><td width="80%" class="pn-fcontent">
						<input type="password" id="repwd" class="required" name="repwd" maxlength="10" onblur="chkRepwd()"/>
						<span id="resultRePwd"></span>
					</td>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						真实姓名:</td><td width="80%" class="pn-fcontent">
						<input type="text" id="realname" class="required" name="realname" maxlength="10" onblur="chkrealname()"/>
						<span id="resultReName"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						性别:</td><td width="80%" class="pn-fcontent">
						<input type="radio" value="男" name="sex"  checked/>男
						<input type="radio" value="女"  name="sex" />女
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						出生日期:</td><td width="80%" class="pn-fcontent">
							<!--引时间控件-->
						<input type="text"  name="birthday" maxlength="80"   class="Wdate" onclick="WdatePicker()" />
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						email:</td><td width="80%" class="pn-fcontent">
						<input type="text" id="email" class="required" name="email" maxlength="64" onblur="chkemail()"/>
						<span id="resultEmail"></span>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						部门:</td><td width="80%" class="pn-fcontent">
						<select id="dept1" name="dept1">
							<c:forEach items="${depts1 }" var="dept1">
								<option value="${dept1.id }" name="id">${dept1.name }</option>
							</c:forEach>
						</select>
						<select id="dept2" name="dept.id">
							<c:forEach items="${depts2 }" var="dept2">
								<option value="${dept2.id }" name="id">${dept2.name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						头像:</td><td width="80%" class="pn-fcontent">
						<input type="file" name="file" onchange="upload()"/>
						<img id="img" width="150px" height="150px" />
						<input type="hidden" name="picurl" id="picurl" />
					</td>
				</tr>
				
				
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
						<input type="submit" class="submit" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>