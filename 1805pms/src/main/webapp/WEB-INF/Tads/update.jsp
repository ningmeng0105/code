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
<title>ad-update</title>
<!-- 添加表单验证 -->
<script type="text/javascript">
	//标题：包含1位以上汉字、字母或数字
	var CHKTITTLE="^[\\S]+$";
	//内容：不为空
	var CHKCONTENT="^[\\S]+$";
	
	//验证标题
	function chktittle(){
		//获取标题
		var ttEle=document.getElementById("tittle");
		var tittle=ttEle.value;
		//定义匹配标题的正则表达式
		var reg=new RegExp(CHKTITTLE);
		//获取标题是否输入成功的元素对象
		var spanEle=document.getElementById("resultTittle");
		if(reg.test(tittle)){//表示输入正确
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			return true;
		}else{//输入失败
			spanEle.innerHTML="标题不能为空";
			spanEle.style.color="red";
			//清空文本框
			ttEle.value="";
			//重新聚焦
			ttEle.focus();
			return false;
		}
	}
	
	//验证内容
	function chkcontent(){
		//获取内容
		var ctEle=document.getElementById("content");
		var content=ctEle.value;
		//定义匹配内容的正则表达式
		var reg=new RegExp(CHKCONTENT);
		//获取内容是否输入成功的元素对象
		var spanEle=document.getElementById("resultContent");
		if(reg.test(content)){//表示输入正确
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			return true;
		}else{//输入失败
			spanEle.innerHTML="内容不能为空";
			spanEle.style.color="red";
			//清空文本框
			ctEle.value="";
			//重新聚焦
			ctEle.focus();
			return false;
		}
	}
	
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
	<div class="rpos">当前位置: 广告管理 - 修改</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='adslist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>

<div class="body-box" style="float:right">
	<form id="jvForm" action="adupdate.do?id=${ad.id }" method="post" >
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody id="tab_1">
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						标题:</td><td width="80%" class="pn-fcontent">
						<input type="text" id="tittle" value="${ad.tittle }" class="required" name="tittle" maxlength="10" onblur="chktittle()"/>
						<span id="resultTittle"></span>
					</td>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						内容:</td><td width="80%" class="pn-fcontent">
						<textarea id="content" value="${ad.content }" name="content" rows="15" cols="150" onblur="chkcontent()">${ad.content }</textarea><br />
						<span id="resultContent"></span>
						</td>
					</td>
				</tr>
			
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						公告时间:</td><td width="80%" class="pn-fcontent">
							<!--引时间控件-->
						<input type="text" value="${ad.crtime }" name="crtime" maxlength="80"   class="Wdate" onclick="WdatePicker()" readonly="readonly"/>
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