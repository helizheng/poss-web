<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@include file="/static/common/bootstrap-table.jsp"%>--%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script src="${ctx}/static/system/role/list.js"></script>

<div class="widget-box">
	<div class="widget-title">
		<h5>操作</h5>
	</div>
	<div class="widget-content nopadding">
		<div>
			<form class="form-horizontal" method="post" action="" id="form">
				<div class="control-group text-left btn-position">
					<shiro:hasPermission name="role:add"><a class="btn" id="save-btn">新增</a></shiro:hasPermission>
					<shiro:hasPermission name="role:update"><a class="btn" id="edit-btn">修改</a></shiro:hasPermission>
					<shiro:hasPermission name="role:delete"><a class="btn" id="delete-btn">删除</a></shiro:hasPermission>
					<shiro:hasPermission name="role:permission"><a class="btn" id="resource-btn">分配菜单</a></shiro:hasPermission>
				</div>
			</form>
		</div>
	</div>
</div>


<table id="tb_data">
</table>
