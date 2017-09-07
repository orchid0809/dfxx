<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>德方人才,南康德方人才网,德方人才网，德方信息部 - 南康德方人才网</title>
<meta name="keywords" content="德方人才,南康德方人才网,德方人才网，德方信息部" />
<meta name="description"
	content="南康德方人才网是南康德方人力资源服务有限公司旗下的大型门户网站。服务于广大南康人才及南康家具企业。" />
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
			<%--<form action="/Searchfor.do" method="post" name="TopSS" id="TopSS">
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

							<td width="50%"><div class="Left3">
									<input name="InSS" type="submit" class="Submit1" id="InSS"
										value="提交搜索" />
								</div>
							</td>
						</tr>
					</table>
				</div>
			</form>--%>
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
						<c:forEach items="${hotData}" var="hot">
							<li><a href="<%=basePath%>recruit_mobile/list?mobileCondition=${hot.HOTNAME}" class="AIndexBox">${hot.HOTNAME}</a>
							</li>
						</c:forEach>
						<%--<li><a href="/JobList.do?K=喷漆" class="AIndexBox">喷漆</a>
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
						</li>--%>
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
					<c:choose>
						<c:when test="${not empty varList}">
							<c:forEach items="${varList}" var="var" varStatus="vs">

								<c:forEach items="${var.recInfo}" var="recInfo">
									<tr
											onClick="window.location.href='<%=basePath%>recruit_mobile/detail?id=${var.RECRUIT_ID}&infoId=${recInfo.RECRUITINFO_ID}';return false">
										<td class="show5 x"><a href="/JobShow.do?ID=141329&K=&P=1">${recInfo.RECRUIT_POSITION}
											<span class="Hui99">/</span>${recInfo.RECRUIT_CNT} <span class="Hui99">/</span>
												${recInfo.POSITION_REQUIRE}</a><br />
											<span class="Hui99 FontSize12">${var.ENTERPRISE_NAME}</span>
										</td>
										<td width="40" class="show5 x"><span class="Hui99 FontSize14">${var.PUBLISH_TIME}</span>
										</td>
										<td width="10" class="show5 x"><img src="<%=basePath%>static/mobile/image/detail.png"
																			width="10" height="10" />
										</td>
									</tr>

								</c:forEach>

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
			<div class="clear10"></div>
			<div class="Title1">推荐租赁</div>
			<div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<c:choose>
						<c:when test="${not empty rentals}">
							<c:forEach items="${rentals}" var="var" varStatus="vs">
								<tr
										onClick="window.location.href='<%=basePath%>rental_mobile/detail?RENTAL_ID=${var.RENTAL_ID}';return false">
									<td width="40" class="show5 x"><span
											class="Hong74 FontSize14">${var.TYPE == 0? "出租":"出售"}</span>
									</td>
									<td class="show5 x" style="text-overflow:ellipsis"><a href="/LeaseShow.do?ID=3144&K=&P=1">
										<c:if test="${fn:length(var.INFO_CONTENT) > 32}">
											${fn:substring(var.INFO_CONTENT, 0, 32)}......
										</c:if>
										<c:if test="${fn:length(var.INFO_CONTENT) <= 32}">
											${var.INFO_CONTENT}
										</c:if>

									</a>
									</td>
									<td width="40" class="show5 x"><span class="Hui99 FontSize14">${var.PUBLISH_TIME}</span>
									</td>
									<td width="10" class="show5 x"><img src="<%=basePath%>static/mobile/image/default.png"
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
			<div class="clear10"></div>
			<div class="Title1">推荐人才</div>
			<div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<c:choose>
						<c:when test="${not empty talents}">
							<c:forEach items="${talents}" var="var" varStatus="vs">
								<tr
										onClick="window.location.href='<%=basePath%>talents_mobile/detail?TALENTS_ID=${var.TALENTS_ID}';return false">
									<td class="show5 x">${var.JOB_INTENSION}<br />
										<span class="Hui99 FontSize12">${var.SEX==0?'男':'女'} / ${var.WORKING_TIME}</span>
									</td>
									<td width="40" class="show5 x"><span class="Hui99 FontSize14"><fmt:formatDate  value="${var.CREATE_DATE}" pattern="MM-dd"/></span>
									</td>
									<td width="10" class="show5 x"><img src="<%=basePath%>static/mobile/image/default.png"
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
		</div>
	</div>

	<div class="clear20"></div>
	<%@include file="common/foot.jsp"%>
</body>
</html>