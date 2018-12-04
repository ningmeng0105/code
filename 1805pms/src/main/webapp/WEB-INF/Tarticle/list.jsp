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
<title>文章列表</title>
<meta charset="UTF-8">

</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 文章管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onclick="javascript:window.location.href='channel.do'"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">
<form method="post" style="padding-top:5px;">
<input type="hidden" value="1" name="pageNo"/>
请输入要查询的标题: <input type="text"  value="" name="kword"/>
	<input type="submit" class="query" value="查询" onclick="this.form.action='articlelist.do';"/>
</form>

<form method="post" id="tableForm" action="articledelete.do">

<table cellspacing="1" cellpadding="0" width="100%" border="0" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" /></th>
			<th>文章ID</th>
			<th>标题</th>
			<th>内容</th>
			<th>作者</th>
			<th>创建日期</th>
			<th>所属栏目</th>
			<th>是否推荐</th>
			<th>是否热点</th>
			<th>操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
		<c:forEach items="${articles }" var="article">
			<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
			<td><input type="checkbox" name="ids" value="${article.id }"/></td>
			<td align="center">${article.id }</td>
			<td align="center">${article.tittle }</td>
			<td align="center">${article.content }</td>
			<td align="center">${article.author }</td>
			<td align="center">${article.crtime }</td>
			<td align="center">${article.channel }</td>
			<td align="center">${article.isremandTXT }</td>
			<td align="center">${article.ishotTXT }</td>
			<td align="center">
			 <a href="articleget.do?id=${article.id }" class="pn-opt">修改</a> | <a href="articledelete.do?id=${article.id }" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a>
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
			[${requestScope.currentPage }/${requestScope.pageCount }]
			<a href="articlelist.do?currentPage=1&kword=${tittle }" ><font size=2>首页</font></a>
			<c:if test="${requestScope.currentPage-1>0}">
				<a href="articlelist.do?currentPage=${requestScope.currentPage-1 }&kword=${tittle }" ><font size=2>上一页</font></a>
			</c:if>
			<c:if test="${requestScope.currentPage+1<=requestScope.pageCount }">
				<a href="articlelist.do?currentPage=${requestScope.currentPage+1 }&kword=${tittle }" ><font size=2>下一页</font></a>
			</c:if>
			<a href="articlelist.do?currentPage=${requestScope.pageCount }&kword=${tittle }" ><font size=2>尾页</font></a>
		
			共<var>${requestScope.pageCount } </var>页 
			到第<input type='text' id='gopage'  size='3' />页<input type='button' id='skip' class='hand btn60x20' value='转到' onclick="javascript:window.location.href = 'articlelist.do?&currentPage=' + $('#gopage').val()+'&kword=${tittle }' "/>
			
	</span>
</div>
</form>
</div>
</body>
</html>