<%--
  Created by IntelliJ IDEA.
  User: orchid0809
  Date: 2017/3/15
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="PrintHTML" style="opacity:0.3;-moz-opacity: 0.3; border:1px solid black;height:100%;width:100%;">
    <div style="border:0px solid black;margin-top:20px">
        <table style="width: 100%">
            <tr>
                <td  style="height: 25px; text-align: left; font-weight: bold; font-family:华文行楷; font-size: 40px;color:white";>德方信息部</td>
                <td  style="height: 25px; text-align: center; font-weight: bold; font-size: 30px;color:white">德方人力资源服务有限公司发布  招工热线/微信：15079762080</td>
                <td  style="height: 25px; text-align: right; font-weight: bold; font-size: 25px;color:white">有效期：${pd.PUBLISH_TIME}~${pd.DEADLINE_TIME}</td>
            </tr>
        </table>
    </div>

    <div style="border:0px solid black;margin-top:50px">
        <table style="width: 100%; border:0px solid black;border-collapse: collapse; table-layout: fixed;" id="">
            <tr style="border:0px solid black">
                <td style="text-align:center;font-size: 110px;border:0px solid black">
                    ${pd.ENTERPRISE_NAME}
                </td>
            </tr>
        </table>
    </div>

    <div style="border:0px solid black">
        <table style="width: 100%; border:0px solid black;border-collapse: collapse; table-layout: fixed; margin-top: 5px;;height:65%" id="Print_OsaledInformation">

            <tbody>
            <tr>
                <td style="font-size: 200px; text-align: center; border: 0px solid black;">

                    <c:if test="${pageDatas != null}">
                        <c:if test="${fn:length(pageDatas) > 2}">
                            <c:forEach items="${pageDatas}" var="var" varStatus="vs">
                                ${var.RECRUIT_POSITION}:${var.RECRUIT_CNT} <c:if test='${fn:trim(var.POSITION_REQUIRE) == ""} '>:</c:if> <span style="font-size:60px">${var.POSITION_REQUIRE}</span> <br>

                            </c:forEach>

                        </c:if>

                        <c:if test="${fn:length(pageDatas) <= 2}">
                            <c:forEach items="${pageDatas}" var="var" varStatus="vs">

                                <c:if test='${empty fn:trim(var.POSITION_REQUIRE)} '>fff</c:if>
                                ${var.RECRUIT_POSITION}:${var.RECRUIT_CNT}<br> <span style="font-size:60px">${var.POSITION_REQUIRE}</span> <br>

                            </c:forEach>
                        </c:if>
                    </c:if>


                </td>

            </tr>
            </tbody>

        </table>
    </div>

    <div style="border:0px solid black;margin-left:20px">
        <table style="width: 100%;">
            <tr>
                <td style="width: 25%;line-height:30px; font-size:70px; text-align: left; border: 0px solid black;" >
                    电话： ${pd.CONTACT_PHONE}
                </td>
            </tr>
        </table>
    </div>

    <div style="margin-left: 20px;margin-top:30px">

        <table style="width: 100%;">
            <tr >
                <td style="width: 15%; line-height:30px;font-size: 70px; text-align: left; border: 0px solid black;">
                    地址：${pd.ENTERPRISE_ADDRESS}
                </td>
            </tr>
        </table>
    </div>



</div>
</body>
</html>
