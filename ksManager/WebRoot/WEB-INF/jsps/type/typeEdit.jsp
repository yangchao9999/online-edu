<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/includes/common-import.jsp"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<title>${systemName}</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<%@ include file="/WEB-INF/includes/common-component-edit.jsp"%>
</head>
<body class="page-header-fixed">
	<%@ include file="/WEB-INF/includes/header.jsp"%>
	<div class="page-container row-fluid">
		<%@ include file="/WEB-INF/includes/leftMenu.jsp"%>
		<div class="page-content">
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<h3 class="page-title">
							题型管理
							<small>${action=='create'?'新增信息':'修改信息'}</small>
						</h3>
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid">

					<div class="span12">

						<div class="portlet box blue" id="form_wizard_1">
							<div class="portlet-title">
								
							</div>

							<div class="portlet-body form">

								<form id="inputForm" class="form-horizontal" action="${basePath}type/${action}" method="post" >
									<input type="hidden" name="id" value="${type.typeid }"/>
									<div class="alert alert-error ${empty MESSAGE ?'hide':'' }">
										<button class="close" data-dismiss="alert"></button>
										<span>${MESSAGE }</span>
									</div>
									
									<div class="control-group"> 
									   <label class="control-label"> 
									       题型名称<span class="required">*</span> 
									   </label> 
									   <div class="controls"> 
									       <input name="typename" class="span6 m-wrap required" type="text" value="${type.typename}"> 
									   </div> 
									</div> 
									<div class="control-group"> 
									   <label class="control-label"> 
									       题型编码<span class="required">*</span> 
									   </label> 
									   <div class="controls"> 
									       <input name="typeCode" class="span6 m-wrap required" type="text" value="${type.typeCode}"> 
									   </div> 
									</div> 
									<div class="control-group"> 
									   <label class="control-label"> 
									       题型描述<span class="required">*</span> 
									   </label> 
									   <div class="controls"> 
									       <input name="typedesc" class="span6 m-wrap required" type="text" value="${type.typedesc}"> 
									   </div> 
									</div> 
									<div class="control-group"> 
									   <label class="control-label"> 
									       显示顺序<span class="required">*</span> 
									   </label> 
									   <div class="controls"> 
									       <input name="typesort" class="span6 m-wrap required" type="text" value="${type.typesort}"> 
									   </div> 
									</div> 

									
									<div class="form-actions clearfix">
										
										<button class="btn blue" type="submit"><i class="icon-ok"></i>完成</button>
										&nbsp;&nbsp;
										<a class="btn" onclick="cancle();">取消</a>
			
									</div>
								</form>
							</div>

						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
	<script src="${resPath}media/js/app.js"></script>   
	<script>
		jQuery(document).ready(function() { 		   
		   $("#inputForm").validate();
		   App.init();
		});
		function cancle(){
			window.location = "${basePath}type";
		}
	</script>
</body>
</html>
