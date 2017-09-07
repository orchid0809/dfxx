<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>租赁信息 - 南康德方人才网</title>
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
	<%@include file="common/top.jsp"%>

	<div>
		<%@ include file="common/menu.jsp"%>
	</div>

	<div class="Box">
		<div class="BoxContent">
			<form action="<%=basePath%>/rental_mobile/list" method="post" name="TopSS" id="TopSS">
				<div class="SearchK">
					<input name="keywords" type="text" id="K" class="FormTest1"
						placeholder="租赁信息查询" />
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
			<div class="Title1">租赁信息</div>
			<div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">

					<c:choose>
						<c:when test="${not empty varList}">
							<c:forEach items="${varList}" var="var" varStatus="vs">
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
									<td width="10" class="show5 x"><img src="<%=basePath%>static/mobile/image/detail.png"
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

					<%--<tr
						onClick="window.location.href='/LeaseShow.do?ID=3143';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3143&K=&P=1">位于龙岭西区岭子上有框架厂房2-4楼招租，面积……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-24</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3141';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3141&K=&P=1">位于赣南大道旁厂房面积2000平米左右招租，可……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-24</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3140';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3140&K=&P=1">位于潭东桥兰，有厂房出租，面积500平方，交通……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-23</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3139';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3139&K=&P=1">
								位于龙岭镇政府后面1公里处，框架楼房带钢架……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-23</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3138';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3138&K=&P=1">位于潭口石禾村，厂房出租，钢架棚面积450平方……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-21</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3137';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3137&K=&P=1">位于和平大厦后面有沙发招租或转让，包设备一起，……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-21</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3136';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3136&K=&P=1">位于赣南大道旁有厂房招租，可喷漆、价格面议。……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-21</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3135';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3135&K=&P=1">位于东山公园正大门对面(和平大厦后面)离家具城……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-20</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3134';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3134&K=&P=1">位于龙岭黎边(赣南大道600米)，面积约为18……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-20</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3133';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3133&K=&P=1">位于龙岭西区有套房招租，两房一厅，一厨一卫，价……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-20</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3132';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3132&K=&P=1">因本人另有主业，现将经营中的软体沙发厂转让或招……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-20</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3131';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3131&K=&P=1">位于龙岭王村框架厂房招租，面积1000平方米，……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-20</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3130';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3130&K=&P=1">位于龙岭板材城有大型修理厂招租，面积2000平……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-17</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3129';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3129&K=&P=1">位于工业一路潘峰宾馆旁边，标准厂房3楼-4楼面……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-15</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3128';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3128&K=&P=1">店面（仓库、）招租
								位于潭东毅德城105国道……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-13</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3127';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3127&K=&P=1">因本人另有主业，现将经营中的软体沙发厂转让或招……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-11</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3124';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3124&K=&P=1">本人有一幢房屋出售，地面平方120平米，建好楼……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-10</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3123';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3123&K=&P=1">位于官坑村蓝天加油站后面、离105国道即南康高……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-09</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>
					<tr
						onClick="window.location.href='/LeaseShow.do?ID=3122';return false">
						<td width="40" class="show5 x"><span
							class="Hong74 FontSize14">[出租]</span>
						</td>
						<td class="show5 x"><a href="/LeaseShow.do?ID=3122&K=&P=1">位于城市一号后面底层楼房100平米做仓库（可送……</a>
						</td>
						<td width="40" class="show5 x"><span class="Hui99 FontSize14">07-09</span>
						</td>
						<td width="10" class="show5 x"><img src="Images/ICON2.png"
							width="10" height="10" />
						</td>
					</tr>--%>
				</table>
			</div>
			<div class="clear20"></div>
			<form action="<%=basePath%>/rental_mobile/list" method="post" name="PageSS" id="PageSS">
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
	<%@include file="common/foot.jsp"%>
</body>
</html>