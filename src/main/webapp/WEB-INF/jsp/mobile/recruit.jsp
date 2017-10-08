<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>招聘信息 - 南康德方人才网</title>
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
		//alert($(".mobileC").val())
		$('.mobileCondition').val($(".mobileC").val())

		$('.currentPage').val(currentPage);
		$('#PageSS').submit();
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
			<form action="<%=basePath%>recruit_mobile/list" method="post" name="TopSS" id="TopSS">
				<div class="SearchK">
					<input name="mobileCondition" type="text" id="mobileC" class="FormTest1 mobileC" value="${mobileCondition}" placeholder="可搜索手机 厂名 工种和地址"
						<%--value="可搜索手机 厂名 工种和地址"
						onFocus="if(this.value=='可搜索手机 厂名 工种和地址')this.value='';"--%> />
				</div>
				<div class="clear6"></div>
				<div>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<!-- <td width="50%"><div class="Right3"><a href="/JobAdd.do?PID=3" class="Submit2">发布信息</a></div></td> -->
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
						<c:forEach items="${hotData}" var="hot">
							<li><a href="<%=basePath%>recruit_mobile/list?mobileCondition=${hot.HOTNAME}" class="AIndexBox">${hot.HOTNAME}</a>
							</li>
						</c:forEach>

						<%--<li><a href="<%=basePath%>recruit_mobile/list?mobileCondition=法规" class="AIndexBox">法规</a>
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
			<div class="clear10"></div>
			<div class="Title1">招聘信息</div>
			<div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">

					<!-- 开始循环 -->
					<c:choose>
						<c:when test="${not empty varList}">
							<c:forEach items="${varList}" var="var" varStatus="vs">

								<c:forEach items="${var.recInfo}" var="recInfo">
									<tr
											onClick="window.location.href='<%=basePath%>recruit_mobile/detail?id=${var.RECRUIT_ID}&infoId=${recInfo.RECRUITINFO_ID}&mobileCondition='+document.getElementById('mobileC').value+'&currentPage='+document.getElementById('currentPage').value;return false">
										<td class="show5 x"><%--<a href="/JobShow.do?ID=141329&K=&P=1">--%>${recInfo.RECRUIT_POSITION}
											<span class="Hui99">/</span>${recInfo.RECRUIT_CNT} <span class="Hui99">/</span>
												${recInfo.POSITION_REQUIRE}<%--</a>--%><br />
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




					<%--<tr
						onClick="window.location.href='/JobShow.do?ID=141328';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141328&K=&P=1">熟手喷漆（喷面）
								<span class="Hui99">/</span> 1组2-3名 <span class="Hui99">/</span>
						</a><br />
						<span class="Hui99 FontSize12">陶朱木业</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141327';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141327&K=&P=1">熟手刷油/头遍油
								<span class="Hui99">/</span> 1组 <span class="Hui99">/</span>
								夫妻优先</a><br />
						<span class="Hui99 FontSize12">陶朱木业</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141326';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141326&K=&P=1">熟手橡木床底油
								<span class="Hui99">/</span> 4名 <span class="Hui99">/</span>
								夫妻优先</a><br />
						<span class="Hui99 FontSize12">陶朱木业</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141325';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141325&K=&P=1">熟手衣柜底油
								<span class="Hui99">/</span> 6名 <span class="Hui99">/</span>
								夫妻优先</a><br />
						<span class="Hui99 FontSize12">陶朱木业</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141314';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141314&K=&P=1">喷漆
								<span class="Hui99">/</span> 2名 <span class="Hui99">/</span>
								保底10000元</a><br />
						<span class="Hui99 FontSize12">卓艺餐台椅厂</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141313';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141313&K=&P=1">煮饭阿姨
								<span class="Hui99">/</span> 1名 <span class="Hui99">/</span> </a><br />
						<span class="Hui99 FontSize12">布艺沙发</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141312';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141312&K=&P=1">扪布
								<span class="Hui99">/</span> 1名 <span class="Hui99">/</span> </a><br />
						<span class="Hui99 FontSize12">布艺沙发</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141311';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141311&K=&P=1">钉架
								<span class="Hui99">/</span> 1名 <span class="Hui99">/</span> </a><br />
						<span class="Hui99 FontSize12">布艺沙发</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141310';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141310&K=&P=1">扪皮扪布
								<span class="Hui99">/</span> 2名 <span class="Hui99">/</span> </a><br />
						<span class="Hui99 FontSize12">南康伊利莱软体床</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141309';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141309&K=&P=1">裁布裁皮
								<span class="Hui99">/</span> 1名 <span class="Hui99">/</span> </a><br />
						<span class="Hui99 FontSize12">南康伊利莱软体床</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141308';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141308&K=&P=1">司机
								<span class="Hui99">/</span> 1名 <span class="Hui99">/</span>
								要求2年以上驾龄、工资面议。</a><br />
						<span class="Hui99 FontSize12">诚招</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141304';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141304&K=&P=1">车布
								<span class="Hui99">/</span> 2名 <span class="Hui99">/</span> </a><br />
						<span class="Hui99 FontSize12">布艺沙发</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141303';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141303&K=&P=1">车皮车布、裁布抄更
								<span class="Hui99">/</span> <span class="Hui99">/</span> </a><br />
						<span class="Hui99 FontSize12">水芙蓉沙发</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141301';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141301&K=&P=1">熟手底油师傅
								<span class="Hui99">/</span> 夫妻也可 <span class="Hui99">/</span> </a><br />
						<span class="Hui99 FontSize12">锦荣地柜厂</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141300';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141300&K=&P=1">打包装师傅
								<span class="Hui99">/</span> <span class="Hui99">/</span> </a><br />
						<span class="Hui99 FontSize12">锦荣地柜厂</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141297';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141297&K=&P=1">打磨
								<span class="Hui99">/</span> 多名 <span class="Hui99">/</span> </a><br />
						<span class="Hui99 FontSize12">橡木普通款</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141296';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141296&K=&P=1">安装
								<span class="Hui99">/</span> 2名 <span class="Hui99">/</span>
								专业安装餐椅、货源充足、价格面议</a><br />
						<span class="Hui99 FontSize12">橡木餐椅</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141134';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141134&K=&P=1">开棉打底
								<span class="Hui99">/</span> 1名 <span class="Hui99">/</span> </a><br />
						<span class="Hui99 FontSize12">办公/布艺沙发</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/JobShow.do?ID=141133';return false">
						<td class="show5 x"><a href="/JobShow.do?ID=141133&K=&P=1">扪皮/扪布
								<span class="Hui99">/</span> 2名 <span class="Hui99">/</span> </a><br />
						<span class="Hui99 FontSize12">南康伊利莱软体床</span>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-25</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>--%>
				</table>
			</div>
			<div class="clear20"></div>
			<form action="<%=basePath%>recruit_mobile/list" method="post" name="PageSS" id="PageSS">
				<input type="hidden" name="currentPage" id="currentPage" class="currentPage" value="${page.currentPage}" />
				<input type="hidden" name="mobileCondition" class="mobileCondition" value="1" />
				<div class="Pagediv">
					<ul class="Pageul">
						<c:if test="${page.currentPage != 1}">
							<li class="Pageli"><a href="javascript:void(0)" onclick="nextPage(${page.currentPage}-1)"  class="APage">上一页</a>
						</c:if>

						<c:forEach   var= "temp"   begin= "${page.currentPage >2?page.currentPage-2:1}"   step= "1"   end= "${page.currentPage <page.totalPage -2?page.currentPage+2:page.totalPage}">
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
	<%@include file="common/foot.jsp"%>
</body>
</html>