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
<title>user-update</title>
<!-- 添加表单验证 -->
<script type="text/javascript">
	//栏目名：包含2位以上汉字
	var CHKCHANNELNAME="^[a-zA-Z0-9\u4e00-\u9fa5]{2,}$";
	
	//验证栏目名
	function chkcname(){
		//获取栏目名
		var cnEle=document.getElementById("cname");
		var cname=cnEle.value;
		//定义匹配栏目名的正则表达式
		var reg=new RegExp(CHKCHANNELNAME);
		//获取栏目名是否输入成功的元素对象
		var spanEle=document.getElementById("resultCName");
		if(reg.test(cname)){//表示输入正确
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			return true;
		}else{//输入失败
			spanEle.innerHTML="栏目名必须包含2位以上汉字";
			spanEle.style.color="red";
			//清空文本框
			cnEle.value="";
			//重新聚焦
			cnEle.focus();
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
	<div class="rpos">当前位置: 栏目管理 - 修改</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='channellist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>

<div class="body-box" style="float:right">
	<form id="jvForm" action="channelupdate.do?id=${channel.id }" method="post">
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody id="tab_1">
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						栏目名:</td><td width="80%" class="pn-fcontent">
						<input type="text" id="cname" value="${channel.cname }"class="required" name="cname" maxlength="10" onblur="chkcname()"/>
						<span id="resultCName"></span>
					</td>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						上级栏目:</td><td width="80%" class="pn-fcontent">
						<select name="pid">
							<c:forEach items="${channels }" var="chl">
								<!-- 显示所属栏目 -->
								<c:if test="${channel.pid==chl.id }">
									<option value="${chl.id }" name="pid" selected="selected">${chl.cname }</option>
								</c:if>
								<!-- 显示其他栏目 -->
								<c:if test="${channel.pid!=chl.id }">
									<option value="${chl.id }" name="pid">${chl.cname }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否叶子:</td><td width="80%" class="pn-fcontent">
						<input type="radio" value="1" name="isleaf" checked="checked" />是
						<input type="radio" value="0" name="isleaf" />否
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						顺序:</td><td width="80%" class="pn-fcontent">
						<c:if test="${channel.sort ==1 }">
							<input type="radio"  value="1" name="sort"  checked="checked"/>1
							<input type="radio" value="2"  name="sort" />2
							<input type="radio" value="3"  name="sort" />3
							<input type="radio" value="4"  name="sort" />4
						</c:if>
						<c:if test="${channel.sort ==2 }">
							<input type="radio" value="1"  name="sort"/>1
							<input type="radio" value="2"  name="sort" checked="checked"/>2
							<input type="radio" value="3"  name="sort" />3
							<input type="radio" value="4"  name="sort" />4
						</c:if>
						<c:if test="${channel.sort ==3 }">
							<input type="radio"  value="1" name="sort" />1
							<input type="radio" value="2"  name="sort" />2
							<input type="radio" value="3"  name="sort"  checked="checked"/>3
							<input type="radio" value="4"  name="sort" />4
						</c:if>
						<c:if test="${channel.sort ==4 }">
							<input type="radio"  value="1" name="sort" />1
							<input type="radio" value="2"  name="sort" />2
							<input type="radio" value="3"  name="sort" />3
							<input type="radio" value="4"  name="sort" checked="checked"/>4
						</c:if>
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