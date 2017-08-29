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
<title>南康人才,南康江厦人才网,江厦人才网，江厦信息部 - 南康江厦人才网</title>
<meta name="keywords" content="南康人才,南康江厦人才网,江厦人才网，江厦信息部" />
<meta name="description"
	content="南康江厦人才网是南康江厦人力资源服务有限公司旗下的大型门户网站。服务于广大南康人才及南康家具企业。" />
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
		<!-- <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="25%"><a href="index.html" class="ATopNav2">首页</a>
				</td>
				<td width="25%"><a href="recruit.html" class="ATopNav">招聘</a>
				</td>
				<td width="25%"><a href="rental.html" class="ATopNav">租赁</a>
				</td>
				<td width="25%"><a href="talents.html" class="ATopNav">人才</a>
				</td>
			</tr>
		</table> -->
		<%@ include file="common/menu.jsp" %>
	</div>

	<div class="Box">
		<div class="BoxContent">
			<form action="/Searchfor.do" method="post" name="TopSS" id="TopSS">
				<div class="SearchK">
					<script type="text/javascript" src="/Js/jquery-1.4.1.min.js"></script>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="100">
								<div id="SearchClass">
									<cite>搜索类型</cite>
									<ul>
										<li><a href="javascript:;" selectid="1">招聘信息</a>
										</li>
										<li><a href="javascript:;" selectid="2">租赁信息</a>
										</li>
										<li><a href="javascript:;" selectid="3">人才信息</a>
										</li>
									</ul>
								</div> <input name="C" type="hidden" id="C" value="1" /></td>
							<td><input name="K" type="text" id="K" class="FormTest1"
								value="请输入您想搜索的内容"
								onFocus="if(this.value=='请输入您想搜索的内容')this.value='';" />
							</td>
						</tr>
					</table>
					<script type="text/javascript" src="/Js/Search.js"></script>
				</div>
				<div class="clear6"></div>
				<div>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="50%"><div class="Right3">
									<a href="/InfoAdd.do?PID=2" class="Submit2">发布信息</a>
								</div>
							</td>
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
			<div class="WXIndex">
				<div class="IndexBox">
					<div class="Title11">
						<h3>热门职位</h3>
						<span class="h3Eng">Hot jobs</span>
						<div class="clear0"></div>
					</div>
					<ul>
						<li><a href="/JobList.do?K=喷漆" class="AIndexBox">喷漆</a>
						</li>
						<li><a href="/JobList.do?K=喷底" class="AIndexBox">喷底</a>
						</li>
						<li><a href="/JobList.do?K=木工" class="AIndexBox">木工</a>
						</li>
						<li><a href="/JobList.do?K=机械" class="AIndexBox">机械</a>
						</li>
						<li><a href="/JobList.do?K=底油" class="AIndexBox">底油</a>
						</li>
						<li><a href="/JobList.do?K=文员" class="AIndexBox">文员</a>
						</li>
						<li><a href="/JobList.do?K=锣刨" class="AIndexBox">锣刨</a>
						</li>
						<li><a href="/JobList.do?K=出榫" class="AIndexBox">出榫</a>
						</li>
						<li><a href="/JobList.do?K=扪皮" class="AIndexBox">扪皮</a>
						</li>
						<li><a href="/JobList.do?K=钉架" class="AIndexBox">钉架</a>
						</li>
						<li><a href="/JobList.do?K=车皮" class="AIndexBox">车皮</a>
						</li>
						<li><a href="/JobList.do?K=司机" class="AIndexBox">司机</a>
						</li>
						<li><a href="/JobList.do?K=安装" class="AIndexBox">安装</a>
						</li>
						<li><a href="/JobList.do?K=厂长" class="AIndexBox">厂长</a>
						</li>
						<li><a href="/JobList.do?K=打磨" class="AIndexBox">打磨</a>
						</li>
					</ul>
					<div class="clear0"></div>
				</div>
			</div>
			<div class="clear6"></div>
			<%--<div>
				<a href="http://"><img
					src="http://www.nkjxrc.com//UploadEditor/image/20160415/20160415134441904190.png"
					width="100%" />
				</a>
			</div>
			<div class="clear6"></div>
			<div>
				<a href="http://"><img
					src="http://www.nkjxrc.com//UploadEditor/image/20170619/20170619120497839783.png"
					width="100%" />
				</a>
			</div>
			<div class="clear6"></div>
			<div>
				<a href="http://"><img
					src="http://www.nkjxrc.com//UploadEditor/image/20170710/20170710074216741674.png"
					width="100%" />
				</a>
			</div>
			<div class="clear6"></div>
			<div>
				<a href="http://"><img
					src="http://www.nkjxrc.com//UploadEditor/image/20170706/20170706122199519951.jpg"
					width="100%" />
				</a>
			</div>--%>
			<div class="clear6"></div>
			<div class="Title1">推荐招聘</div>
			<div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr
						onClick="window.location.href='/JobShow.do?ID=140813';return false">
						<td class="show5 x">普工 <span class="Hui99">/</span> 1名<br />
						<span class="Hui99 FontSize12">雕花厂</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-18</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=140812';return false">
						<td class="show5 x">打花磨学徒 <span class="Hui99">/</span> 1名<br />
						<span class="Hui99 FontSize12">雕花厂</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-18</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=140811';return false">
						<td class="show5 x">电脑雕花操机学徒 <span class="Hui99">/</span> 1名<br />
						<span class="Hui99 FontSize12">雕花厂</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-18</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=140809';return false">
						<td class="show5 x">熟手木工 <span class="Hui99">/</span> 2名<br />
						<span class="Hui99 FontSize12">诚招</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-18</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=139939';return false">
						<td class="show5 x">另招：文员 <span class="Hui99">/</span> 2名<br />
						<span class="Hui99 FontSize12">诚招</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-09</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
				</table>
			</div>
			<div class="clear10"></div>
			<div class="Title1">推荐租赁</div>
			<div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3121';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x">三期2栋前排12号靠中间过道三分之一出租。……</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-07</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3118';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x">有框架三层半厂房出租或转让，面积800平米，适合做……</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-05</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3113';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x">位于龙岭家具产业园，三楼、有货梯、面积2750平米……</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-04</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3112';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x">位于新消防队对面进200米（朱边路口）厂房面积55……</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-04</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3092';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x">位于323国道新四眼桥附近，面积1900平米，另有……</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">06-19</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
				</table>
			</div>
			<div class="clear10"></div>
			<div class="Title1">推荐人才</div>
			<div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr
						onClick="window.location.href='/ResumeShow.do?ID=9189';return false">
						<td class="show5 x">出榫打眼2人<br />
						<span class="Hui99 FontSize12">男 / 28 / 2年</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-11</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/ResumeShow.do?ID=9182';return false">
						<td class="show5 x">打齿、四面刨<br />
						<span class="Hui99 FontSize12">男 / 40 / 7年</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-08</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/ResumeShow.do?ID=9177';return false">
						<td class="show5 x">橡木床底油<br />
						<span class="Hui99 FontSize12">男 / 38 / 6年</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-06</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/ResumeShow.do?ID=9143';return false">
						<td class="show5 x">雕花学徒，排钻学徒<br />
						<span class="Hui99 FontSize12">男 / 21 / 3年</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">06-18</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/ResumeShow.do?ID=9140';return false">
						<td class="show5 x">夫妻找在南康家具厂上班工作，打包或其它什么工种学徒都可<br />
						<span class="Hui99 FontSize12">男 / 30多 / 3年</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">06-18</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
				</table>
			</div>
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