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
    <style>
        ul,li{
            margin: 0px;
            padding: 0px;
        }
    </style>
</head>
<body>
<div id="PrintHTML" style="opacity:0.3;-moz-opacity: 0.3; border:0px solid black;height:100%;width:100%;">
    <div style="border:0px solid black;padding-top:53px">
        <table style="width: 100%">
            <tr>
               <%-- <td  style="height: 25px; text-align: left; font-weight: bold; font-family:华文行楷; font-size: 40px;color:white";>&lt;%&ndash;德方信息部&ndash;%&gt;</td>
                <td  style="height: 25px; text-align: center; font-weight: bold; font-size: 30px;color:white">&lt;%&ndash;德方人力资源服务有限公司发布  招工热线/微信：15079762080&ndash;%&gt;</td>--%>
                <td  style="height: 25px; text-align: right; font-weight: bold; font-size: 23px;color:white">
                    <fmt:parseDate value="${pd.PUBLISH_TIME}" pattern="yyyy-MM-dd" var="startDate"/>
                    <fmt:parseDate value="${pd.DEADLINE_TIME}" pattern="yyyy-MM-dd" var="endDate"/>
                    到期时间：
                   <%-- <fmt:formatDate value="${startDate}" pattern="MM-dd" />
                    ~--%>
                    <fmt:formatDate value="${endDate}" pattern="MM-dd" />
                </td>
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
        <table style="width: 100%; border:0px solid black;border-collapse: collapse; table-layout: fixed; margin-top: 5px;;height:60%" id="Print_OsaledInformation">

            <tbody>
            <tr>
                <td style="font-size: 200px; text-align: center; border: 0px solid black;">

                    <c:if test="${pageDatas != null}">
                        <c:if test="${fn:length(pageDatas) == 3}">

                            <c:forEach items="${pageDatas}" var="var" varStatus="vs">
                                <span style="font-size:180px">
                                      ${var.RECRUIT_POSITION}:${var.RECRUIT_CNT}
                                </span>
                               <c:if test='${fn:trim(var.POSITION_REQUIRE) == ""} '>:</c:if> <span style="font-size:60px">${var.POSITION_REQUIRE}</span> <br>

                            </c:forEach>

                        </c:if>

                        <c:if test="${fn:length(pageDatas) == 4}">

                            <c:forEach items="${pageDatas}" var="var" varStatus="vs">
                                <span style="font-size:141px">
                                      ${var.RECRUIT_POSITION}:${var.RECRUIT_CNT}
                                </span>
                                <c:if test='${fn:trim(var.POSITION_REQUIRE) == ""} '>:</c:if> <span style="font-size:60px">${var.POSITION_REQUIRE}</span> <br>

                            </c:forEach>

                        </c:if>

                        <c:if test="${fn:length(pageDatas) == 5}">

                            <c:forEach items="${pageDatas}" var="var" varStatus="vs">
                                <span style="font-size:110px">
                                      ${var.RECRUIT_POSITION}:${var.RECRUIT_CNT}
                                </span>
                                <c:if test='${fn:trim(var.POSITION_REQUIRE) == ""} '>:</c:if> <span style="font-size:60px">${var.POSITION_REQUIRE}</span> <br>

                            </c:forEach>

                        </c:if>

                        <c:if test="${fn:length(pageDatas) > 5}">

                            <c:forEach items="${pageDatas}" var="var" varStatus="vs">
                                <span style="font-size:95px">
                                      ${var.RECRUIT_POSITION}:${var.RECRUIT_CNT}
                                </span>
                                <c:if test='${fn:trim(var.POSITION_REQUIRE) == ""} '>:</c:if> <span style="font-size:60px">${var.POSITION_REQUIRE}</span> <br>

                            </c:forEach>

                        </c:if>

                        <c:if test="${fn:length(pageDatas) <= 2}">
                            <c:forEach items="${pageDatas}" var="var" varStatus="vs">

                                <c:if test='${empty fn:trim(var.POSITION_REQUIRE)} '>fff</c:if>
                                ${var.RECRUIT_POSITION}:${var.RECRUIT_CNT}<br> <span style="font-size:60px">&nbsp;${var.POSITION_REQUIRE}</span> <br>

                            </c:forEach>
                        </c:if>
                    </c:if>


                </td>

            </tr>
            </tbody>

        </table>
    </div>

    <div style="border:0px solid black;margin-left:20px;">
        <ul style="list-style-type:none; font-size:70px;">
            <li>
                电话： ${pd.CONTACT_PHONE}
            </li>
            <li>
                地址：${pd.ENTERPRISE_ADDRESS}
            </li>
        </ul>
    </div>

    <%--<div style="border:1px solid black;margin-left:20px;margin-bottom: 0px;">
        <table style="width: 100%;">
            <tr>
                <td style="width: 25%;line-height:25px; font-size:70px; text-align: left; border: 0px solid black;" >
                    电话： ${pd.CONTACT_PHONE}
                </td>
            </tr>
        </table>
    </div>

    <div style="margin-left: 20px;margin-top:25px">

        <table style="width: 100%;">
            <tr >
                <td style="width: 15%; line-height:30px;font-size: 70px; text-align: left; border: 0px solid black;">
                    地址：${pd.ENTERPRISE_ADDRESS}
                </td>
            </tr>
        </table>
    </div>--%>



</div>
</body>
</html>
