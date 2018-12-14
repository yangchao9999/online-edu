<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/includes/common-import.jsp"%>
<%@ taglib uri="/page" prefix="p"%>
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
	<%@ include file="/WEB-INF/includes/common-component-list.jsp"%>
</head>
<body class="page-header-fixed">
	<%@ include file="/WEB-INF/includes/header.jsp"%>
	<!-- BEGIN CONTAINER -->
	<div class="page-container row-fluid">
		<%@ include file="/WEB-INF/includes/leftMenu.jsp"%>
		<div class="page-content">
			<!-- BEGIN PAGE CONTAINER-->        
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->
				<div class="row-fluid">
					<div class="span12">
						<h3 class="page-title">
							系统日志管理&nbsp;<small>日志只保留近一个月的数据</small>
						</h3>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="portlet box light-grey">
							<div class="portlet-title"></div>
							<div class="portlet-body">
								<div class="portlet-body form">
									<form id="searchForm" class="horizontal-form" action="${basePath }framework/sysLog" method="post">
										<div class="row-fluid">
											<div class="span4">
												<div class="control-group">
													<label class="control-label" for="logType">日志类型</label>
													<div class="controls">
														<input class="m-wrap span12" type="text" placeholder="类型..." id="logType" name="map['logType']" value="${searchParams.map['logType'] }"/>													
													</div>
												</div>
											</div>
											<!--/span-->

											<div class="span5 ">
												<div class="control-group">
													<label class="control-label" for="logContent">日志内容</label>
													<div class="controls">
														<input class="m-wrap span10" type="text" placeholder="日志内容..." id="logContent" name="map['logContent']" value="${searchParams.map['logContent'] }"/>													
													</div>
												</div>
											</div>
											<!--/span-->
										</div>
										<div class="row-fluid">
											<div class="span4">
												<div class="control-group">
													<label class="control-label" for="loginname">账号</label>
													<div class="controls">
														<input class="m-wrap span12" type="text" placeholder="创建人账号..." id="loginname" name="map['loginname']" value="${searchParams.map['loginname'] }"/>													
													</div>
												</div>
											</div>
											<!--/span-->

											<div class="span5 ">
												<div class="control-group">
													<label class="control-label" for="truename">姓名</label>
													<div class="controls">
														<input class="m-wrap span10" type="text" placeholder="创建人姓名..." id="truename" name="map['truename']" value="${searchParams.map['truename'] }"/>													
													</div>
												</div>
											</div>
											<!--/span-->
										</div>
										<div style="text-align:center;">
											<button type="submit" class="btn blue"><i class="icon-ok"></i> 查询</button>
											<button type="button" class="btn" onclick="resetForm('searchForm');">重置</button>
										</div>
									</form>
								</div>
								<div class="alert ${MESSAGE_STATE } ${empty MESSAGE ?'hide':'' }">
									<button class="close" data-dismiss="alert"></button>
									<span>${MESSAGE }</span>
								</div>
								<div class="portlet box light-grey">
									<table class="table table-striped table-bordered table-hover" id="sample_1">
										<thead>
											<tr>
												<th class="hidden-480" style="width:40px;">序号</th>
												<th class="hidden-480">日志类型</th> 
												<th>日志内容</th> 
												<th class="hidden-480">创建人</th> 
												<th >日期</th> 
												<th class="hidden-480">访问IP</th> 
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list}" var="list" varStatus="status">
												<tr class="odd gradeX">
													<td class="hidden-480">${status.index+1 }</td>
													<td class="hidden-480">${list.logType }</td> 
													<td>${list.logContent }</td> 
													<td class="hidden-480">${list.loginname}(${list.truename})</td> 
													<td >${list.createTime }</td> 
													<td class="hidden-480">${list.accessIp }</td>
													<td >
														<a href="${basePath}framework/sysLog/update/${list.id}" class="btn mini purple"><i class="icon-search"></i> 查看</a>&nbsp;
														<a  href="javascript:void();" onclick="delData('${basePath}framework/sysLog/delete/${list.id}');" class="btn mini black"><i class="icon-trash"></i> 删除</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<p:page url="framework/sysLog" cpage="${page.cpage }" perItem="${page.perItem }" totalItem="${page.totalItem }" formId="searchForm"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
