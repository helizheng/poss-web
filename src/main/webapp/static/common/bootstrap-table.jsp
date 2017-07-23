<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctx}/static/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/static/bootstrap/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/static/bootstrap/css/matrix-style.css" />
<link rel="stylesheet" href="${ctx}/static/bootstrap/css/matrix-media.css" />
<link href="${ctx}/static/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />
<%--表格--%>
<link href="${ctx}/static/bootstrap/bootstrapTable/css/bootstrap-table.css" rel="stylesheet">

<script src="${ctx}/static/bootstrap/js/jquery.min.js"></script>
<script src="${ctx}/static/bootstrap/js/bootstrap.min.js"></script>

<%--表格--%>
<script src="${ctx}/static/bootstrap/bootstrapTable/js/bootstrap-table.js"></script>
<script src="${ctx}/static/bootstrap/bootstrapTable/js/bootstrap-table-zh-CN.js"></script>
<%--弹出框--%>
<script type="text/javascript" src="${ctx}/static/bootstrap/js/layer-v1.9.2/layer/layer.js"></script>
<%--通用js--%>
<script type="text/javascript" src="${ctx}/static/common/common.js"></script>
<script type="text/javascript" src="${ctx}/static/common/lyGrid.js"></script>
<script type="text/javascript">
    var ctx = "${ctx}";
</script>