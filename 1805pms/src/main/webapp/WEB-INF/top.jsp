<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<link href="images/skin.css" rel="stylesheet" type="text/css" />
    
	
</head>
<body leftmargin="0" topmargin="0">
	<table width="100%" height="64" border="0" cellpadding="0"
		cellspacing="0" class="admin_topbg" >
		<tr>
			<td width="50%" height="64" valign="top"><img src="images/logo4.png"
				width="176" height="54" ></td>
			<td width="50%" valign="center"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="26%" height="20" ><font color="white"><b>${userBean.realname }</b>，您好，现在是</font></td>
						<td  width="42%" height="20">	
						<div style="color: white;"  id="time" >			
   						 <script>
       						 document.getElementById('time').innerHTML = new Date().toLocaleString()+ ' 星期' + '日一二三四五六'.charAt(new Date().getDay());
       						 setInterval("document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
       					</script>
   						 </div>
						</td>
						<td width="36%" height="20" ><font color="white">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;感谢登录使用！</font></td>
						<td width="42%"><img
								src="images/out.gif" alt="安全退出" width="46" height="20"
								border="0" onclick="javascript:window.history.back()"></td>
						<td width="4%">&nbsp;</td>
					</tr>
					<tr>
						<td height="19" colspan="3">&nbsp;</td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>