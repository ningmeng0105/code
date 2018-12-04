<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 引入c标签库 -->
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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

<link rel="stylesheet" href="res/css/style.css" />


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户列表</title>
<meta charset="UTF-8">

</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 用户管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onclick="javascript:window.location.href='toadd.do'"/>
	</form>
</div>
<div class="body-box">
<form method="post" style="padding-top:5px;">
<input type="hidden" value="1" name="pageNo"/>
登录名: <input type="text" value="${QUERY.kword }" name="kword" />
<select onchange="changePageNo()" name="isenabled">
	<c:if test="${QUERY.isenabled==0 }">
		<option   value="0" selected="selected">请选择</option>
		<option  value="1">有效</option>
		<option   value="-1">无效</option>
	</c:if>
	<c:if test="${QUERY.isenabled==1 }">
		<option   value="0" >请选择</option>
		<option  value="1" selected="selected">有效</option>
		<option   value="-1">无效</option>
	</c:if>
	<c:if test="${QUERY.isenabled==-1 }">
		<option   value="0">请选择</option>
		<option  value="1">有效</option>
		<option   value="-1" selected="selected">无效</option>
	</c:if>
	</select>
	<input type="submit" class="query" value="查询" onclick="this.form.action='userlist.do';"/>
</form>

<form method="post" id="tableForm" action="userdeletes.do">

<table cellspacing="1" cellpadding="0" width="100%" border="0" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" /></th>
			<th>用户编码</th>
			<th>登录名</th>
			<th>真实姓名</th>
			<th>头像</th>
			<th>性别</th>
			<th>出生日期</th>
			<th>电子邮箱</th>
			<th>部门名称</th>
			<th>是否可用</th>
			<th>操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
		<c:forEach items="${users }" var="user">
			<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
			<td><input type="checkbox" name="ids" value="${user.id }"/></td>
			<td align="center">${user.id }</td>
			<td align="center">${user.loginname }</td>
			<td align="center">${user.realname }</td>
			<td align="center"><img src="upload/${user.picurl }" height="50px" width="50px" /></td>
			<td align="center">${user.sex }</td>
			<td align="center">${user.birthdayTxt }</td>
			<td align="center">${user.email }</td>
			<td align="center">${user.dept.name }</td>
			<td align="center">${user.enabletxt }</td>
			<td align="center">
			 <a href="userget.do?id=${user.id }" class="pn-opt">修改</a> | <a href="userdelete.do?id=${user.id }" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a>
			</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="page pb15">
<div style="float:left;">
	<input class="del-button" type="submit" value="删除" onclick="if(!confirm('您确定删除吗？')) {return false;}"/>
</div>
	<span class="r inb_a page_b" style="font-size: 15px;">
			<!-- 当前页/尾页 -->
			[${currentPage }/${pageCount }]
			<a href="userlist.do?currentpage=1&loginname=${QUERY.loginname }&isenabled=${QUERY.isenabled}" ><font size=2>首页</font></a>
			<c:if test="${currentPage-1>0}">
				<a href="userlist.do?currentpage=${currentPage-1 }&loginname=${QUERY.loginname }&kword=${QUERY.kword }&isenabled=${QUERY.isenabled}" ><font size=2>上一页</font></a>
			</c:if>
			<c:if test="${currentPage+1<=pageCount }">
				<a href="userlist.do?currentpage=${currentPage+1 }&loginname=${QUERY.loginname }&kword=${QUERY.kword }&isenabled=${QUERY.isenabled}" ><font size=2>下一页</font></a>
			</c:if>
			<a href="userlist.do?currentpage=${pageCount }&loginname=${QUERY.loginname }&kword=${QUERY.kword }&isenabled=${QUERY.isenabled}" ><font size=2>尾页</font></a>
		
			共<var>${pageCount } </var>页 
			到第<input type='text' id='gopage'  size='3' />页<input type='button' id='skip' class='hand btn60x20' value='转到' onclick="javascript:window.location.href = 'userlist.do?&currentpage=' + $('#gopage').val()+'&loginname=${QUERY.loginname }&kword=${QUERY.kword }&isenabled=${QUERY.isenabled}'  "/>
			
	</span>
</div>

</form>
</div>
</body>
</html>