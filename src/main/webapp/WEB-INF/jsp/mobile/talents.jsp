<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>人才信息 - 南康江厦人才网</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<!--隐藏手机默认菜单-->
<meta name="apple-touch-fullscreen" content="yes" />
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<link href="<%=basePath%>static/mobile/css/df.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	//平台、设备和操作系统
	var system = {
		win : false,
		mac : false,
		xll : false
	};
	//检测平台
	var p = navigator.platform;
	system.win = p.indexOf("Win") == 0;
	system.mac = p.indexOf("Mac") == 0;
	system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);
	//跳转语句
	if (system.win || system.mac || system.xll) {
		//window.location.href = "/Error.html";
	} else {
		//window.location.href = "http://wx.nkjxrc.com/";
	}
</script>
<script src='<%=basePath%>static/ace/js/jquery.js'></script>
<script type="text/javascript">

	function nextPage(currentPage){
		$('.mobileCondition').val($("input[name=mobileCondition]").val())
		$('.currentPage').val(currentPage);
		$('#PageSS').submit();
	}


</script>
</head>

<body>
	<a name="TOP"></a>
	<div class="Top">
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			bgcolor="#EA4B35">
			<tr>
				<td align="left"><a href="/"><img src="images/Index_01.jpg"
						height="50" border="0" />
				</a>
				</td>
				<td width="50"><a href="/WebUserLogin.do?CID=1"><img
						src="images/Index_04.jpg" height="50" border="0" />
				</a>
				</td>
				<td width="2"><img src="images/Index_05.jpg" height="50" />
				</td>
				<td width="50"><a href="/"><img src="images/Index_06.jpg"
						height="50" border="0" />
				</a>
				</td>
			</tr>
		</table>
	</div>

	<div>
		<%@ include file="common/menu.jsp"%>
	</div>

	<div class="Box">
		<div class="BoxContent">
			<form action="<%=basePath%>/talents_mobile/list" method="post" name="TopSS" id="TopSS">
				<div class="SearchK">
					<input name="keywords" type="text" id="K" class="FormTest1"
						placeholder="人才搜索" />
				</div>
				<div class="clear6"></div>
				<div>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>

							<td width="50%"><div class="Left3">
									<input name="InSS" type="submit" class="Submit1" id="InSS"
										value="提交搜索" />
								</div>
							</td>
						</tr>
					</table>
				</div>
			</form>
			<div class="clear10 x"></div>
			<div class="clear10"></div>
			<div class="Title1">人才信息</div>
			<div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">

					<c:choose>
						<c:when test="${not empty varList}">
							<c:forEach items="${varList}" var="var" varStatus="vs">
								<tr
										onClick="window.location.href='<%=basePath%>talents_mobile/detail?TALENTS_ID=${var.TALENTS_ID}';return false">
									<td class="show5 x">${var.JOB_INTENSION}<br />
										<span class="Hui99 FontSize12">${var.SEX==0?'男':'女'} / ${var.WORKING_TIME}</span>
									</td>
									<td width="40" class="show5 x"><span class="Hui99 FontSize14"><fmt:formatDate  value="${var.CREATE_DATE}" pattern="MM-dd"/></span>
									</td>
									<td width="10" class="show5 x"><img src="Images/ICON2.png"
																		width="10" height="10" />
									</td>
								</tr>

							</c:forEach>

						</c:when>
						<c:otherwise>
							<tr class="main_info">
								<td colspan="100" class="center" >没有相关数据</td>
							</tr>
						</c:otherwise>
					</c:choose>



				</table>
			</div>
			<div class="clear20"></div>
			<form action="<%=basePath%>/talents_mobile/list" method="post" name="PageSS" id="PageSS">
				<input type="hidden" name="currentPage" class="currentPage" value="1" />
				<input type="hidden" name="mobileCondition" class="mobileCondition" value="1" />
				<div class="Pagediv">
					<ul class="Pageul">
						<c:if test="${page.currentPage != 1}">
						<li class="Pageli"><a href="javascript:void(0)" onclick="nextPage(${page.currentPage}-1)"  class="APage">上一页</a>
							</c:if>

							<c:forEach   var= "temp"   begin= "1"   step= "1"   end= "${page.totalPage}">
						<li class="${page.currentPage == temp?'PageTest':'Pageli'}">
							<c:choose>
								<c:when test="${page.currentPage != temp}">
									<a href="javascript:void(0)" onclick="nextPage(${temp})"  class="APage">${temp}</a>
								</c:when>
								<c:otherwise>
									${temp}
								</c:otherwise>
							</c:choose>
						</li>
						</c:forEach>

						<c:if test="${page.currentPage != page.totalPage}">
							<li class="Pageli"><a href="javascript:void(0)" onclick="nextPage(${page.currentPage}+1)"  class="APage">下一页</a>
							</li>
						</c:if>

					</ul>
					<span class="clear"></span>
				</div>
			</form>
			<div class="clear20"></div>
		</div>
	</div>

	<div class="clear20"></div>
	<div class="Title2">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td><a href="/" class="FontSize14">首页</a> | <a
					href="/WebUserReg.do" class="FontSize14">注册</a> | <a
					href="/WebUserLogin.do" class="FontSize14">登录</a>
				</td>
				<td width="5" bgcolor="#FFFFFF"></td>
				<td width="30"><a href="#TOP"><img src="Images/ICON3.png"
						width="30" height="30" border="0" />
				</a>
				</td>
				<td width="5" bgcolor="#FFFFFF"></td>
			</tr>
		</table>
	</div>
	<div class="Foot">
		<p style="text-indent:2em;" align="center">
			<span></span> 南康江厦人才网-服务热线：0797-6638464，<span
				style="line-height:1.5;">联系人：15083585585（微信同号）</span><span
				style="line-height:1.5;">13879707758（</span><span
				style="line-height:1.5;">微信同号）<span>如忘记密码请来电修改。</span>
			</span>
		</p>
		<p style="text-indent:2em;" align="center">
			<br />
		</p>
		<p style="text-indent:2em;" align="right">
			<span> </span>
		</p>
		<p style="text-indent:2em;">
			<span> </span>
		</p>
		<p style="text-indent:2em;">
			<span> </span>
		</p>
		<br />
		<script language="javascript" type="text/javascript"
			src="http://js.users.51.la/18193696.js"></script>
	</div>
</body>
</html>