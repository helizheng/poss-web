<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%--<%@include file="/static/common/bootstrap-table.jsp"%>--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/system/resource/list.js"></script>
	<div class="widget-box">
		<div class="widget-title">
			<h5>操作</h5>
		</div>
		<div class="widget-content nopadding">
			<div>
				<form class="form-horizontal" method="post" action="" id="form">
					<%--<div class="control-group">
						<label class="control-label">资源名称</label>
						<div class="search-controls">
							<input type="text" name="name" id="name" class="search-input" />

							<a class="btn btn-success" id="search-btn" >查询</a>
						</div>
					</div>--%>

					<div class="control-group text-left btn-position">
						<shiro:hasPermission name="resource:add"><a class="btn" id="save-btn">新增</a></shiro:hasPermission>
						<shiro:hasPermission name="resource:update"><a class="btn" id="edit-btn">修改</a></shiro:hasPermission>
						<shiro:hasPermission name="resource:delete"><a class="btn" id="delete-btn">删除</a></shiro:hasPermission>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%--<header class="panel-heading">
	<div class="doc-buttons">
		<c:forEach items="${res}" var="key">
			${key.description}
		</c:forEach>
	</div>
	</header>--%>


	<div class="table-responsive">
		<div id="paging" class="pagclass"></div>
	</div>
