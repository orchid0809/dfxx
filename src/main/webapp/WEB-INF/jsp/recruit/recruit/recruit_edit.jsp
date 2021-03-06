<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="recruit/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="RECRUIT_ID" id="RECRUIT_ID" value="${pd.RECRUIT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<%--<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发布:</td>
								<td><input type="text" name="PUBLISH_NAME" id="PUBLISH_NAME" value="${pd.PUBLISH_NAME}" maxlength="50" placeholder="这里输入发布" title="发布" style="width:98%;"/></td>
							</tr>
							--%><tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">企业名称:</td>
								<td><input type="text" name="ENTERPRISE_NAME" id="ENTERPRISE_NAME" value="${pd.ENTERPRISE_NAME}" maxlength="100" placeholder="这里输入企业名称" title="企业名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系电话:</td>
								<td><input type="text" name="CONTACT_PHONE" id="CONTACT_PHONE" value="${pd.CONTACT_PHONE}" maxlength="130" placeholder="这里输入联系电话" title="联系电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">地址:</td>
								<td><input type="text" name="ENTERPRISE_ADDRESS" id="ENTERPRISE_ADDRESS" value="${pd.ENTERPRISE_ADDRESS}" maxlength="100" placeholder="这里输入地址" title="地址" style="width:98%;"/></td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">招聘信息:</td>
								<td>
									<table id="table_report2" class="table table-striped table-bordered table-hover">
											<tr>
												<td style="width:75px;text-align: left;padding-top: 13px;">招聘职位</td>
												<td style="width:75px;text-align: left;padding-top: 13px;">招聘人数</td>
												<td style="width:75px;text-align: left;padding-top: 13px;">职位要求</td>
												<td style="width:15px;text-align: left;padding-top: 13px;">操作</td>
											</tr>
											<c:if test="${empty pageDatas}">
												<tr class="recruit_Info">
													<td><input type="text" name="recruits[0].recruitPosition" value="" maxlength="100" placeholder="这里输入招聘职位" title="招聘职位" style="width:98%;"/></td>
													<td><input type="text" name="recruits[0].recruitCnt" value="" maxlength="100" placeholder="这里输入招聘人数" title="招聘人数" style="width:98%;"/></td>
													<td><input type="text" name="recruits[0].positionRequire" value="" maxlength="100" placeholder="这里输入职位要求" title="职位要求" style="width:98%;"/></td>
													<td>
														<i class="add_recruit glyphicon glyphicon-plus" title="增加"></i>
													</td>
												</tr>

											</c:if>

											<c:if test="${pageDatas != null}">
												<c:forEach items="${pageDatas}" var="var" varStatus="vs">
													<tr class="recruit_Info">
														<input type="hidden" name="recruits[${vs.index}].recruitInfoId" value="${var.RECRUITINFO_ID}"/>
														<td><input type="text" name="recruits[${vs.index}].recruitPosition" value="${var.RECRUIT_POSITION}" maxlength="100" placeholder="这里输入招聘职位" title="招聘职位" style="width:98%;"/></td>
														<td><input type="text" name="recruits[${vs.index}].recruitCnt" value="${var.RECRUIT_CNT}" maxlength="100" placeholder="这里输入招聘人数" title="招聘人数" style="width:98%;"/></td>
														<td><input type="text" name="recruits[${vs.index}].positionRequire" value="${var.POSITION_REQUIRE}" maxlength="100" placeholder="这里输入职位要求" title="职位要求" style="width:98%;"/></td>
														<input type="hidden"  name = "recruits[${vs.index}].sort" value="${var.SORT==null?0:var.SORT}"/>
														<td>
															<c:if test="${vs.index == 0}">
																<i class="add_recruit glyphicon glyphicon-plus" title="增加"></i>
															</c:if>
															<c:if test="${vs.index > 0}">
																<i class=" remove_recruit ace-icon fa fa-trash-o bigger-120" data="${var.RECRUITINFO_ID}" title="删除"></i>
															</c:if>


														</td>
													</tr>

												</c:forEach>

											</c:if>

											
										<%--	<tr>
												<td><input type="text" name="recruits[1].recruitPosition" value="${pd.ENTERPRISE_ADDRESS}" maxlength="100" placeholder="这里输入招聘职位" title="招聘职位" style="width:98%;"/></td>
												<td><input type="text" name="recruits[1].recruitCnt" value="${pd.ENTERPRISE_ADDRESS}" maxlength="100" placeholder="这里输入招聘人数" title="招聘人数" style="width:98%;"/></td>
												<td><input type="text" name="recruits[1].positionRequire" value="${pd.ENTERPRISE_ADDRESS}" maxlength="100" placeholder="这里输入职位要求" title="职位要求" style="width:98%;"/></td>
												<td>
													<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
												</td>
											</tr>--%>
										
									</table>
								</td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发布时间:</td>
								<td><input class="span10 date-picker" name="PUBLISH_TIME" id="PUBLISH_TIME" value="${pd.PUBLISH_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="发布时间" title="发布时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">截止时间:</td>
								<td><input class="span10 date-picker" name="DEADLINE_TIME" id="DEADLINE_TIME" value="${pd.DEADLINE_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="截止时间" title="截止时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">金额:</td>
								<td><input type="text" name="AMOUNT" id="AMOUNT" value="${pd.AMOUNT}" maxlength="6" placeholder="这里输入金额" title="金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="300" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$('.add_recruit').click(function(){

				var cnt = $('.recruit_Info').length;
				var recruit_str='<tr class="recruit_Info">'
					+'<td><input type="text" class="position" name="recruits['+cnt+'].recruitPosition" value="" maxlength="100" placeholder="这里输入招聘职位" title="招聘职位" style="width:98%;"/></td>'
						+'<td><input type="text" class="cnt" name="recruits['+cnt+'].recruitCnt" value="" maxlength="100" placeholder="这里输入招聘人数" title="招聘人数" style="width:98%;"/></td>'
						+'<td><input type="text" class="require" name="recruits['+cnt+'].positionRequire" value="" maxlength="100" placeholder="这里输入职位要求" title="职位要求" style="width:98%;"/></td>'
					    +'<input type="hidden"  name = "recruits['+cnt+'].sort" value="0"/>'
						+'<td>'
						+'<i class=" remove_recruit ace-icon fa fa-trash-o bigger-120" title="删除"></i>'
						+'</td>'
						+'</tr>';

			$('.recruit_Info:last').after(recruit_str);
			//$(this).closest('.recruit_Info').after(recruit_str)

			bindremove();
			
		})
		function bindremove(){
			$('.remove_recruit').unbind('click');

			$('.remove_recruit').click(function(){
				//alert("lv")
				var allCnt = $('.recruit_Info').length;
				var preCnt = $(this).closest('.recruit_Info').prevAll('.recruit_Info').length;
				var nextCnt = $(this).closest('.recruit_Info').nextAll('.recruit_Info').length;

				//alert(allCnt+":"+preCnt+":"+nextCnt)

				$(this).closest('.recruit_Info').nextAll('.recruit_Info').each(function(index){
					//alert(index)
					$(this).find('.position').attr("name","recruits["+(allCnt-preCnt-1+index)+"].recruitPosition")
					$(this).find('.cnt').attr("name","recruits["+(allCnt-preCnt-1+index)+"].recruitCnt")
					$(this).find('.require').attr("name","recruits["+(allCnt-preCnt-1+index)+"].recruitRequire")
				})
				//alert($('.remove_recruit').attr("data"))
				$.ajax({
					type: "POST",
					url:"<%=basePath%>recruit/deleteInfo.do",
					data: {RECRUITINFO_ID:$('.remove_recruit').attr("data")},
					dataType:'json',
					//beforeSend: validateData,
					cache: false,
					success: function(data){
						//alert(data.flag)
					}
				});

				$(this).closest('.recruit_Info').remove();



			});
		}

		bindremove();
		
		$(top.hangge());
		//保存
		function save(){
			/*if($("#PUBLISH_NAME").val()==""){
				$("#PUBLISH_NAME").tips({
					side:3,
		            msg:'请输入发布',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PUBLISH_NAME").focus();
			return false;
			}
			if($("#ENTERPRISE_NAME").val()==""){
				$("#ENTERPRISE_NAME").tips({
					side:3,
		            msg:'请输入企业名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ENTERPRISE_NAME").focus();
			return false;
			}
			if($("#CONTACT_PHONE").val()==""){
				$("#CONTACT_PHONE").tips({
					side:3,
		            msg:'请输入联系电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTACT_PHONE").focus();
			return false;
			}
			if($("#ENTERPRISE_ADDRESS").val()==""){
				$("#ENTERPRISE_ADDRESS").tips({
					side:3,
		            msg:'请输入地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ENTERPRISE_ADDRESS").focus();
			return false;
			}
			if($("#PUBLISH_TIME").val()==""){
				$("#PUBLISH_TIME").tips({
					side:3,
		            msg:'请输入发布时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PUBLISH_TIME").focus();
			return false;
			}
			if($("#DEADLINE_TIME").val()==""){
				$("#DEADLINE_TIME").tips({
					side:3,
		            msg:'请输入截止时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DEADLINE_TIME").focus();
			return false;
			}
			if($("#AMOUNT").val()==""){
				$("#AMOUNT").tips({
					side:3,
		            msg:'请输入金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AMOUNT").focus();
			return false;
			}
			if($("#REMARK").val()==""){
				$("#REMARK").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMARK").focus();
			return false;
			}*/
			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('#PUBLISH_TIME').datepicker({autoclose: true,todayHighlight: true,onSelect:goToDate}).on("changeDate",goToDate);
			$('#DEADLINE_TIME').datepicker({autoclose: true,todayHighlight: true});

			$('#PUBLISH_TIME').val(getNowFormatDate(new Date()));

			$('#DEADLINE_TIME').val(getNowFormatDate(addDateTime(new Date())));
		});

		function goToDate(){
			var pubTime = $('#PUBLISH_TIME').val();

			$('#DEADLINE_TIME').val(getNowFormatDate(addDateTime(strToDate(pubTime))));
		}


		function strToDate(strDate){
			var strDates = strDate.split('-')

			var date = new Date(strDates[0],strDates[1]-1,strDates[2]);
			return date;
		}


		/*$(function(){
			$('#PUBLISH_TIME').datepicker({onSelect:function(){
				alert('lv')
			}})


		})
*/		function getNowFormatDate(nowDate) {
			var date = nowDate;
			var seperator1 = "-";
			var seperator2 = ":";
			//alert(date.getMonth())
			var month = date.getMonth() + 1;

			var strDate = date.getDate();
			if (month >= 1 && month <= 9) {
				month = "0" + month;
			}
			if (strDate >= 0 && strDate <= 9) {
				strDate = "0" + strDate;
			}
			var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
			return currentdate;
		}

		function addDateTime(date){
			var d=date;
			var year=d.getFullYear();
			var month=d.getMonth();
			var day=d.getDate();
			var hour=d.getHours();
			var min=d.getMinutes();
			var s=d.getSeconds();
			d=new Date(year,month,day+9,hour,min,s);

			return d;
		}
		</script>
</body>
</html>