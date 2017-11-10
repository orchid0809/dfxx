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
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>Title</title>
  <%-- <link rel="stylesheet" href="/static/ace/css/bootstrap.css" />--%>
    <script src='<%=basePath%>static/ace/js/jquery.js'></script>
    <script>
        $(function(){
           /* alert($('.main_content span').css("font-size"))
            $('.main_content span').css({'font-size':'88px'})*/
        })

    </script>
</head>
<body >
<%--style="background-image: url(http://create.b0.upaiyun.com/logo_2!bac);background-size:cover; width:1850px ;height:1300px"--%>
<div >
    <div id="PrintHTML" style="opacity:0.3;-moz-opacity: 0.3; border:0px solid black;height:100%;width:100%;">
        <div style="border:0px solid black;padding-top:40px">
            <table style="width: 100%">
                <tr>
                    <td  style="height: 25px; text-align: left; font-weight: bold; font-family:华文行楷; font-size: 40px;color:white";><%--德方信息部--%></td>
                    <td  style="height: 25px; text-align: center; font-weight: bold; font-size: 30px;color:white"><%--德方人力资源服务有限公司发布  招工热线/微信：15079762080--%></td>
                   <%-- <td  style="height: 25px; text-align: right; font-weight: bold; font-size: 25px;color:white">有效期：${pd.PUBLISH_TIME}~${pd.DEADLINE_TIME}</td>--%>
                    <td  style="height: 25px; text-align: right; font-weight: bold; font-size: 26px;color:white">
                        <fmt:parseDate value="${pd.PUBLISH_TIME}" pattern="yyyy-MM-dd" var="startDate"/>
                        <fmt:parseDate value="${pd.DEADLINE_TIME}" pattern="yyyy-MM-dd" var="endDate"/>
                        有效期：
                        <fmt:formatDate value="${startDate}" pattern="MM-dd" />
                        ~
                        <fmt:formatDate value="${endDate}" pattern="MM-dd" />
                    </td>
                </tr>
            </table>
        </div>

        <%--<div style="border:0px solid black;margin-top:50px">
             <table style="width: 100%; border:0px solid black;border-collapse: collapse; table-layout: fixed; margin-top: 5px;" id="">
                 <tr style="border:0px solid black">
                     <td style="text-align:center;font-size: 110px;border:0px solid black">
                         ${pd.INFO_TITLE}
                     </td>
                 </tr>
             </table>
         </div>--%>

        <div style="border:0px solid red;font-size: 110px;width:100%;margin-top:29px; text-align: center;height: 5%; display: table;
        ">
            <div  style="display:table-cell;
            vertical-align:middle;
            text-align: center; /*设置文本水平居中*/
            width:100%;border: 0px solid red">

                ${pd.INFO_TITLE}

            </div>


        </div>


      <%-- <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    带有 title 的面板标题
                </h3>
            </div>
            <div class="panel-body"  style="height:70%;font-size: 10px">
                <button type="button" class="btn btn-info">信息按钮</button>


            </div>
        </div>--%>

        <div style="border:0px solid white;font-size: 80px;width:100%; text-align: center;height: 72%; display: table;
        ">
                <div class="main_content" style="display:table-cell;
            vertical-align:middle;
            text-align: center; /*设置文本水平居中*/
            width:100%;border: 0px solid red;height: 100%; padding-left:20px">
                   ${pd.INFO_CONTENT}

                </div>


         </div>

        <div style="border:0px solid black;margin-bottom:0px;">
            <table style="width: 100%;">
                <tr>
                    <td style="width: 25%;line-height:50px; font-size: 85px; text-align: center; border: 0px solid black;" >
                        ${pd.CONTACT_PHONE}
                    </td>
                </tr>
            </table>

        </div>



    </div>


</div>

</body>
</html>
