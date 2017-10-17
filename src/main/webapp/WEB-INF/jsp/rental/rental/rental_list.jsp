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
	<embed id="LODOP_EM" type="application/x-print-lodop" width="0" height="0" pluginspage="Lodop/install_lodop32.exe"></embed>
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
						<form action="rental/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="租赁信息搜索" class="keywords nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<td style="padding-left:2px;"><input class="publishTime date-picker" name="publishTime" id="lastStart"  value="${pd.publishTime}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="发布时间" title="开始日期"/></td>
								<td style="padding-left:2px;"><input class="deadLineTime date-picker" name="deadLineTime"   value="${pd.deadLineTime}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="截至时间" title="结束日期"/></td>

								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
								<c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon1" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>
								<%--<c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon2" class="ace-icon fa fa-download bigger-110 nav-search-icon blue">导出出租</i></a></td></c:if>--%>
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
									<th class="center">信息标题</th>
									<%--<th class="center">类型</th>--%>
									<th class="center">信息内容</th>
									<th class="center">联系电话</th>
									<th class="center">发布时间</th>
									<th class="center">截至时间</th>
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
											<input type="hidden" name="firstId" class="firstId" value="${var.RENTAL_ID}"/>
										</c:if>
										<tr>
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.RENTAL_ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.INFO_TITLE}</td>
											<%--<td class='center'>${var.TYPE}</td>--%>
											<td class='center'>${var.INFO_CONTENT}</td>
											<td class='center'>${var.CONTACT_PHONE}</td>
											<td class='center'>${var.PUBLISH_TIME}</td>
											<td class='center'>${var.DEADLINE_TIME}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.RENTAL_ID}');">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" onclick="del('${var.RENTAL_ID}');">
														<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
													</a>
													</c:if>

													<a class="btn btn-xs btn-primary" onclick="f_print('${var.RENTAL_ID}');">
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
																<a style="cursor:pointer;" onclick="edit('${var.RENTAL_ID}');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${var.RENTAL_ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
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
									<a class="btn btn-sm btn-primary" onclick="rental_print(0);">打印出租信息</a>
									<a class="btn btn-sm btn-info" onclick="rental_print(1);">打印出售信息</a>
									<input type="number" class="keywords nav-search-input" autocomplete="off" name="record_cnt"   placeholder="默认打印40条" value="40"/>
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
			 diag.URL = '<%=basePath%>rental/goAdd.do';
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
					var url = "<%=basePath%>rental/delete.do?RENTAL_ID="+Id+"&tm="+new Date().getTime();
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
			 diag.URL = '<%=basePath%>rental/goEdit.do?RENTAL_ID='+Id;
			 diag.Width = 800;
			 diag.Height = 600;
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
								url: '<%=basePath%>rental/deleteAll.do?tm='+new Date().getTime(),
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
			var keywords = $(".keywords").val();
			var publishTime = $('.publishTime').val();

			var deadLineTime = $('.deadLineTime').val();

			var condition = "?keywords="+keywords+"&publishTime="+publishTime+"&deadLineTime="+deadLineTime;
			window.location.href='<%=basePath%>rental/excel.do'+condition;
		}
	</script>

	<script>


		function setFontSize(){
			//alert($('.main_content span').css("font-size"))
			//alert($('.main_content span').text().length)

			//var span_length = $('.main_content span').length();

			//alert($('#PrintHTML').outerWidth())

			/*var content_length = $('.main_content span').text().length;
			var line_height = $('.main_content span').css("line-height");
			alert("line_height:"+line_height+"  content_length"+content_length)
			var div_w = 1550 //$('.main_content').width();
			var div_h =800 //$('.main_content').height();

			var divs = div_w*div_h;

			alert("div_w:"+div_w+" * div_h:"+div_h+"  divs="+divs)*/

			/*var init_font = 100;
			var fonts = 0;
			do{

				 fonts = init_font*24*124;
				init_font --
			}while(fonts > divs);
			alert("font:"+init_font)
			alert("fonts:"+fonts)
			//var fontJ_size = parseInt(content_length)* 0.82;*/
			var mainLength = $('.main_content').text().length;
			if(mainLength <= 100){
				$('.main_content').css({'font-size':"150px"})
			} else if(mainLength > 100 && mainLength <= 150){
				$('.main_content').css({'font-size':"120px"})
			}


		}

		var LODOP;
		function f_print(id){
			//alert($('#print').load('<%=basePath%>recruit/print.do?RECRUIT_ID='+id))
			$('#print').load('<%=basePath%>rental/print.do?RENTAL_ID='+id,function(){

				setFontSize();

				LODOP = getLodop(document.getElementById('LODOP_OB'), document.getElementById('LODOP_EM'));
				LODOP.SET_PRINT_PAGESIZE(2, 0, 0, "A3"); //规定纸张大小；使用A4纸。
				//LODOP.ADD_PRINT_IMAGE('22%','30%',800,800,"<img border='0' width='100%' height='100%' src='http://create.b0.upaiyun.com/logo_2!bac'/>")
				var width = $(window).width();
				 var height = $(window).height();
				LODOP.ADD_PRINT_IMAGE(0,0,"100%","100%","<img border='0' width='1550px' height='1100px' src='http://create.b0.upaiyun.com/logo_3!bac'/>")
				//LODOP.SET_PRINT_STYLEA(2,"AngleOfPageInside",180);
				//LODOP.SET_PRINT_STYLEA(0,"Angle",180)
				LODOP.SET_PRINT_STYLE('Alignment',2);
				//SET_PRINT_STYLE:设置纯文本打印项风格,格式：SET_PRINT_STYLE(strStyleName,varStyleValue)。
				//strStyleName：打印风0.格名，设定纯文本风格名称及其含义如下：|varStyleValue：打印风格值，相关值如下：
				//“FontName”： 字体名称。|值： 字符型，与操作系统字体名一致，缺省是“宋体”。
				//“FontSize”： 字体大小。|值：数值型，单位是pt，缺省值是9，可以含小数，如13.5。
				//“FontColor”： 字体颜色。|值：整数或字符型，如同CSS的color。
				//“Bold”： 是否粗体。|值：数字型，1代表粗体，0代表非粗体，缺省值是0。
				//“Italic”： 是否斜体。|值：数字型，1代表斜体，0代表非斜体，缺省值是0。
				//“Underline”： 是否下滑线。|值：数字型，1代表有下划线，0代表无下划线，缺省值是0。
				//“Alignment”： 内容左右靠齐方式。|值：数字型，1--左靠齐 2--居中 3--右靠齐，缺省值是1。
				//“Angle”： 旋转角度。|值：数字型，逆时针旋转角度数，单位是度，0度表示不旋转


				//注意：设定样式可以覆盖，更多设置参考技术使用文档。
				//LODOP.SET_PRINT_STYLE("FontColor", "#000000");//字体颜色
				//LODOP.SET_PRINT_STYLE("FontSize", 13); //字体大小


				//LODOP.ADD_PRINT_HTM(50, 50, 1000, 800, document.getElementById("simple-table").innerHTML)*!/; //内容，参数（左边距，上边距，内容显示宽度，内容显示高度）
				LODOP.ADD_PRINT_HTM(0, 0, '100%', '100%',$('#print').html())
				//LODOP.SET_PRINT_STYLEA(0,"AngleOfPageInside",-90);
				//LODOP.SET_PRINT_STYLEA(0,"Angle",-90)
				//LODOP.SET_PRINT_STYLEA(2,"AngleOfPageInside",10);
				LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED",1);

				//LODOP.SET_PRINT_STYLE("FontColor", "#00ff00"); //更换颜色
				//LODOP.ADD_PRINT_TEXT(80, 50, 360, 39, "更换颜色");
				//LODOP.SET_PRINT_STYLE("FontSize", 24); //更换大小
				//LODOP.ADD_PRINT_TEXT(110, 50, 360, 39, "更换大小");


				//LODOP.ADD_PRINT_LINE(150, 50, 200, 50, 0, 1); //线，竖杠(上边距1,1左边距,上边距2,2左边距,intLineStyle, intLineWidth)
				//intLineStyle:线条类型，默认为0；0--实线 1--破折线 2--点线 3--点划线 4--双点划线
				//intLineWidth:线条宽，默认是1，整数型，单位是(打印)像素，非实线的线条宽也是0。
				// LODOP.ADD_PRINT_LINE(150, 50, 150, 200, 0, 1); //线，横杠(上边距1,1左边距,上边距2,2左边距,intLineStyle, intLineWidth)
				LODOP.PREVIEW();//打印预览
				//LODOP. PRINT (); //不经打印预览的直接打印。
				//LODOP.PRINT_DESIGN();
			});

		}

		/*function f_print(id){
			//alert($('#print').load('<%=basePath%>recruit/print.do?RECRUIT_ID='+id))
			LODOP = getLodop(document.getElementById('LODOP_OB'), document.getElementById('LODOP_EM'));

			LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_按网址打印");
			LODOP.ADD_PRINT_URL(0,0,"100%","100%","<%=basePath%>rental/print?RENTAL_ID="+id);
			LODOP.SET_PRINT_PAGESIZE(2, 0, 0, "A3"); //规定纸张大小；使用A4纸。
			LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED",1);

			LODOP.PREVIEW()
		}*/
	</script>

	<script>
		function rental_print(type){
			LODOP = getLodop(document.getElementById('LODOP_OB'), document.getElementById('LODOP_EM'));

			LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_按网址打印");
			LODOP.ADD_PRINT_URL(0,0,"100%","100%","<%=basePath%>rental/rental_print?type="+type+"&"+$('#Form').serialize());
			LODOP.SET_PRINT_PAGESIZE(2, 0, 0, "A3"); //规定纸张大小；使用A4纸。
			LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED",1);
			//LODOP.SET_PRINT_STYLEA(0,"HOrient",3);
			//LODOP.SET_PRINT_STYLEA(0,"VOrient",3);
	//		LODOP.SET_SHOW_MODE("MESSAGE_GETING_URL",""); //该语句隐藏进度条或修改提示信息
	//		LODOP.SET_SHOW_MODE("MESSAGE_PARSING_URL","");//该语句隐藏进度条或修改提示信息
			LODOP.PREVIEW()


			//LODOP.PRINT_DESIGN();
		}


		$(function(){

			if('${flag}' == 'print'){
				f_print($('.firstId').val());
			}

		})


		$(document).keypress(function(e){
			if(e.which == 13){
				tosearch()
			}
		})

	</script>

	<div id="print" style="display:none">


	</div>

		</body>
</html>