<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>南康德方人才网</title>
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
</head>

<body>
	<a name="TOP"></a>
	<%@include file="common/top.jsp"%>

	<div>
		<%@ include file="common/menu.jsp"%>
	</div>

	<div class="Box">
		<div class="BoxContent">
			<div class="Title3">厂房招租</div>
			<div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="65" class="show5 x"><span class="Hui99">信息类型</span>
						</td>
						<td class="show5 x">${pd.INFO_TITLE}</td>
					</tr>
					<tr>
						<td class="show5 x"><span class="Hui99">联 系 人</span>
						</td>
						<td class="show5 x"></td>
					</tr>
					<tr>
						<td class="show5 x"><span class="Hui99">联系电话</span>
						</td>
						<td class="show5 x">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td align="left">${pd.CONTACT_PHONE}</td>
									<td align="right"><a href="tel:13970120170"><img
											src="<%=basePath%>static/mobile/image/phone.jpg" />
									</a>
									</td>
								</tr>
							</table></td>
					</tr>
					<!--
<tr><td class="show5 x"><span class="Hui99">联系电话</span></td><td class="show5 x">
<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr>
<td align="left">13970120170</td>
<td align="right"><a href="tel:13970120170"><img src="/Images/TEL.jpg" /></a></td>
</tr></table>
</td></tr>-->
					<tr>
						<td class="show5 x"><span class="Hui99">信息内容</span>
						</td>
						<td class="show5 x">${pd.INFO_CONTENT}</td>
					</tr>
					<tr>
						<td class="show5 x"><span class="Hui99">发布日期</span>
						</td>
						<td class="show5 x">${pd.PUBLISH_TIME}</td>
					</tr>
					<tr>
						<td class="show5 x"><span class="Hui99">截止日期</span>
						</td>
						<td class="show5 x">${pd.DEADLINE_TIME}</td>
					</tr>
					<tr>
						<td class="show5">&nbsp;</td>
						<td class="show5"><a href="<%=basePath%>rental_mobile/list"
							class="Submit3">返回列表</a>
						</td>
					</tr>
				</table>
			</div>
			<div class="clear10"></div>
			<div class="AboutText2">
				<h3>相关信息</h3>
				<span class="Hui99">[1]</span> <a href="/LeaseList.do?ID=3143&K=&P="
					class="F14">位于龙岭西区岭子上有框架厂房2-4楼招租，面积1700平方米……</a>&nbsp;&nbsp;<span
					class="Hui99">[07-24]</span><br /> <span class="Hui99">[2]</span>
				<a href="/LeaseList.do?ID=3141&K=&P=" class="F14">位于赣南大道旁厂房面积2000平米左右招租，可喷漆、价格面议……</a>&nbsp;&nbsp;<span
					class="Hui99">[07-24]</span><br /> <span class="Hui99">[3]</span>
				<a href="/LeaseList.do?ID=3140&K=&P=" class="F14">位于潭东桥兰，有厂房出租，面积500平方，交通便利，水电齐全……</a>&nbsp;&nbsp;<span
					class="Hui99">[07-23]</span><br /> <span class="Hui99">[4]</span>
				<a href="/LeaseList.do?ID=3139&K=&P=" class="F14">
					位于龙岭镇政府后面1公里处，框架楼房带钢架棚招租。 框……</a>&nbsp;&nbsp;<span class="Hui99">[07-23]</span><br />
				<span class="Hui99">[5]</span> <a href="/LeaseList.do?ID=3138&K=&P="
					class="F14">位于潭口石禾村，厂房出租，钢架棚面积450平方米，框架厂房4……</a>&nbsp;&nbsp;<span
					class="Hui99">[07-21]</span><br />
			</div>
		</div>
	</div>

	<div class="clear20"></div>
	<%@include file="common/foot.jsp"%>
</body>
</html>