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
			<div class="Title3">${pd.NAME}的基本信息</div>
			<div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="65" class="show5 x"><span class="Hui99">姓名</span>
						</td>
						<td class="show5 x">${pd.NAME}</td>
					</tr>
					<tr>
						<td class="show5 x"><span class="Hui99">性别</span>
						</td>
						<td class="show5 x">${pd.SEX==0?'男':'女'}</td>
					</tr>
					<%--<tr>
						<td class="show5 x"><span class="Hui99">年龄</span>
						</td>
						<td class="show5 x">20</td>
					</tr>--%>
					<tr>
						<td class="show5 x"><span class="Hui99">联系电话</span>
						</td>
						<td class="show5 x">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td align="left">${pd.CONTACT_PHONE}</td>
									<td align="right"><a href="tel:13247051309"><img
											src="<%=basePath%>static/mobile/image/phone.jpg" />
									</a>
									</td>
								</tr>
							</table></td>
					</tr>
					<!--
<tr><td class="show5 x"><span class="Hui99">联系电话</span></td><td class="show5 x">
<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr>
<td align="left">13247051309</td>
<td align="right"><a href="tel:13247051309"><img src="/Images/TEL.jpg" /></a></td>
</tr></table>
</td></tr>-->
					<tr>
						<td class="show5 x"><span class="Hui99">期望薪资</span>
						</td>
						<td class="show5 x">${pd.EXPECTED_SALARY}</td>
					</tr>
					<tr>
						<td class="show5 x"><span class="Hui99">工作时间</span>
						</td>
						<td class="show5 x">${pd.WORKING_TIME}</td>
					</tr>
					<tr>
						<td class="show5 x"><span class="Hui99">求职工种</span>
						</td>
						<td class="show5 x">${pd.JOB_INTENSION}</td>
					</tr>

					<tr>
						<td class="show5">&nbsp;</td>
						<td class="show5"><a href="<%=basePath%>talents_mobile/list"
							class="Submit3">返回列表</a>
						</td>
					</tr>
				</table>
			</div>
			<div class="clear10"></div>
			<div class="AboutText2">
				<h3>推荐信息</h3>
				<span class="Hui99">[1]</span> <span class="Hui99">男&nbsp;&nbsp;28岁&nbsp;&nbsp;2年</span><br />
				<a href="/ResumeShow.do?ID=9189&CID=" class="F14"><span
					class="Hui99">期望薪资：</span>面议<br />
				<span class="Hui99">求职工种：</span>出榫打眼2人</a><br /> <span class="Hui99">[2]</span>
				<span class="Hui99">男&nbsp;&nbsp;40岁&nbsp;&nbsp;7年</span><br />
				<a href="/ResumeShow.do?ID=9182&CID=" class="F14"><span
					class="Hui99">期望薪资：</span>面议<br />
				<span class="Hui99">求职工种：</span>打齿、四面刨</a><br /> <span class="Hui99">[3]</span>
				<span class="Hui99">男&nbsp;&nbsp;38岁&nbsp;&nbsp;6年</span><br />
				<a href="/ResumeShow.do?ID=9177&CID=" class="F14"><span
					class="Hui99">期望薪资：</span>5000以上<br />
				<span class="Hui99">求职工种：</span>橡木床底油</a><br /> <span class="Hui99">[4]</span>
				<span class="Hui99">男&nbsp;&nbsp;21岁&nbsp;&nbsp;3年</span><br />
				<a href="/ResumeShow.do?ID=9143&CID=" class="F14"><span
					class="Hui99">期望薪资：</span>2000-3000<br />
				<span class="Hui99">求职工种：</span>雕花学徒，排钻学徒，出榫打眼学徒，等。</a><br /> <span
					class="Hui99">[5]</span> <span class="Hui99">男&nbsp;&nbsp;17岁&nbsp;&nbsp;</span><br />
				<a href="/ResumeShow.do?ID=9141&CID=" class="F14"><span
					class="Hui99">期望薪资：</span>3000<br />
				<span class="Hui99">求职工种：</span>暑假工</a><br />
			</div>
		</div>
	</div>

	<div class="clear20"></div>
	<%@include file="common/foot.jsp"%>
</body>
</html>