<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@include file="/static/common/bootstrap-table.jsp"%>--%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script src="${ctx}/static/system/user/list.js"></script>

<div class="widget-box">
	<div class="widget-title">
		<h5>查询条件</h5>
	</div>
	<div class="widget-content nopadding">
		<div>
			<form class="form-horizontal" method="post" action="" id="form">
				<div class="control-group">
					<label class="control-label">用户名</label>
					<div class="search-controls">
						<input type="text" name="accountName" id="accountName" class="search-input" />

						<input type="submit" value="查询" class="btn btn-success" id="search-btn" />
					</div>
				</div>

				<div class="control-group text-left btn-position">
					<shiro:hasPermission name="user:add"><a class="btn" id="save-btn">新增</a></shiro:hasPermission>
					<shiro:hasPermission name="user:update"><a class="btn" id="edit-btn">修改</a></shiro:hasPermission>
					<shiro:hasPermission name="user:delete"><a class="btn" id="delete-btn">删除</a></shiro:hasPermission>
				</div>
			</form>
		</div>
	</div>
</div>


<table id="tb_data">
</table>
