﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	<script src="static/print/LodopFuncs.js"></script>
	<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width="0"
			height="0">
		<embed id="LODOP_EM" type="application/x-print-lodop" width="0" height="0"<%-- pluginspage="Lodop/install_lodop32.exe"--%>></embed>
	</object>

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
							
						<!-- 检索  -->
						<form action="recruit/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="招聘手机" class="recruit-phone nav-search-input" id="nav-search-input" autocomplete="off" name="recruitPhone" value="${pd.recruitPhone }" placeholder="这里输入关键词"/>
											<%--<i class="ace-icon fa fa-search nav-search-icon"></i>--%>
										</span>
									</div>
								</td>

								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="厂名" class="recruit-phone nav-search-input" autocomplete="off" name="enterpriseName" value="${pd.enterpriseName}" placeholder="这里输入关键词"/>
											<%--<i class="ace-icon fa fa-search nav-search-icon"></i>--%>
										</span>
									</div>
								</td>

								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="工种" class="recruit-phone nav-search-input" autocomplete="off" name="recruitPosition" value="${pd.recruitPosition }" placeholder="这里输入关键词"/>
											<%--<i class="ace-icon fa fa-search nav-search-icon"></i>--%>
										</span>
									</div>
								</td>

								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="地址" class="recruit-phone nav-search-input" autocomplete="off" name="enterpriseAddress" value="${pd.enterpriseAddress }" placeholder="这里输入关键词"/>
											<%--<i class="ace-icon fa fa-search nav-search-icon"></i>--%>
										</span>
									</div>
								</td>

								<%--<td style="vertical-align:top;padding-left:2px"><a class="recruit-phone-search btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>--%>

								<td style="padding-left:2px;"><input class="span10 date-picker" name="publishTime" id="lastStart"  value="${pd.publishTime}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="deadLineTime" name="lastEnd"  value="${pd.deadLineTime}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
								<%--<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="name" id="id" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
									<option value=""></option>
									<option value="">全部</option>

															<option value="">1</option>
									<option value="">2</option>
								  	</select>
								</td>--%>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
								<c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">发布</th>
									<th class="center">企业名称</th>
									<th class="center">联系电话</th>
									<th class="center">地址</th>
									<th class="center">招聘信息</th>
									<th class="center">发布时间</th>
									<th class="center">截止时间</th>
									<th class="center">金额</th>
									<th class="center">备注</th>
									<th class="center">操作</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<c:if test="${vs.index == 0}">
											<input type="hidden" name="firstId" class="firstId" value="${var.RECRUIT_ID}"/>
										</c:if>

										<tr>
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.RECRUIT_ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.PUBLISH_NAME}</td>
											<td class='center'>${var.ENTERPRISE_NAME}</td>
											<td class='center'>${var.CONTACT_PHONE}</td>
											<td class='center'>${var.ENTERPRISE_ADDRESS}</td>
											<td class='center'>${var.recInfo}</td>
											<td class='center'>${var.PUBLISH_TIME}</td>
											<td class='center'>${var.DEADLINE_TIME}</td>
											<td class='center'>${var.AMOUNT}</td>
											<td class='center'>${var.REMARK}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.RECRUIT_ID}');">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" onclick="del('${var.RECRUIT_ID}');">
														<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
													</a>
													</c:if>

													<a class="btn btn-xs btn-primary" onclick="f_print('${var.RECRUIT_ID}');">
														<i class="glyphicon glyphicon-print bigger-120" title="打印"></i>
													</a>

												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${QX.edit == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="edit('${var.RECRUIT_ID}');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${var.RECRUIT_ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
														</ul>
													</div>
												</div>
											</td>
										</tr>
									
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<c:if test="${QX.add == 1 }">
									<a class="btn btn-sm btn-success" onclick="add();">新增</a>
									</c:if>
									<c:if test="${QX.del == 1 }">
									<a class="btn btn-sm btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
									</c:if>

									<a class="btn btn-sm btn-primary" onclick="print_list();">列表打印</a>

									<input type="number" class="keywords nav-search-input" autocomplete="off" name="record_cnt"   placeholder="默认打印40条" value="40"/>

									<input type="radio" value="0" name="isSelect" checked/>查询所有
									<input type="radio" value="1" name="isSelect"/>查询有限制
								</td>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
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

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		$(function() {
		
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>recruit/goAdd.do?flag=add';
			 diag.Width = 600;
			 diag.Height = 550;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>recruit/delete.do?RECRUIT_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>recruit/goEdit.do?RECRUIT_ID='+Id;
			 diag.Width = 600;
			 diag.Height = 550;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>recruit/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		};
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>recruit/excel.do';
		}
	</script>

	<script>
		var LODOP;
		function f_print(id){
			//alert($('#print').load('<%=basePath%>recruit/print.do?RECRUIT_ID='+id))
			$('#print').load('<%=basePath%>recruit/print.do?RECRUIT_ID='+id,function(){
				LODOP = getLodop(document.getElementById('LODOP_OB'), document.getElementById('LODOP_EM'));
				LODOP.SET_PRINT_PAGESIZE(2, 0, 0, "A3"); //规定纸张大小；使用A4纸。
				//LODOP.ADD_PRINT_IMAGE('22%','30%',800,800,"<img border='0' width='800px'height='565px' src='http://create.b0.upaiyun.com/logo_2!bac'/>")
				LODOP.ADD_PRINT_IMAGE(0,0,"100%","100%","<img border='0' width='1550px' height='1100px' src='http://create.b0.upaiyun.com/logo_3!bac'/>")
				//LODOP.ADD_PRINT_SETUP_BKIMG(0,0,"100%","100%","<img border='0' width='1550px' height='1100px' src='http://create.b0.upaiyun.com/logo_2!bac'/>")
				//LODOP.SET_SHOW_MODE("BKIMG_PRINT",1);

				//LODOP.ADD_PRINT_URL(0,0,"100%","100%","<%=basePath%>recruit/print?RECRUIT_ID="+id);

				LODOP.SET_PRINT_STYLE('Alignment',2);

				LODOP.ADD_PRINT_HTM(0, 0, '100%', '100%',$('#print').html())


				LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED",1);

				LODOP.PREVIEW();//打印预览

			});

		}



		$(document).keypress(function(e){
			if(e.which == 13){
				tosearch()
			}
		})

		$(function(){

			if('${flag}' == 'print'){
				console.log($('.firstId').val())
				f_print($('.firstId').val());
			}

		})


		function print_list(){
			LODOP = getLodop(document.getElementById('LODOP_OB'), document.getElementById('LODOP_EM'));
			//alert("<%=basePath%>recruit/recruit_print?"+decodeURI(decodeURI(decodeURIComponent($('#Form').serialize(),true))))

			LODOP.PRINT_INIT("招聘信息");
			LODOP.ADD_PRINT_URL(0,0,"100%","100%","<%=basePath%>recruit/recruit_print?"+$('#Form').serialize());
			LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A3"); //规定纸张大小；使用A4纸。
			LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED",1);
			LODOP.PREVIEW()
		}
	</script>


	<div id="print" style="display:none">


	</div>


</body>
</html>