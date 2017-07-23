<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<title></title>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<!-- name="viewport" 的详细用法  http://www.php100.com/html/webkaifa/HTML5/2012/0831/10979.html -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctx}/static/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/static/bootstrap/css/matrix-style.css" />
<link href="${ctx}/static/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />

<script src="${ctx}/static/bootstrap/js/jquery.min.js"></script>
<script src="${ctx}/static/bootstrap/js/bootstrap.min.js"></script>
<%--弹出框--%>
<script type="text/javascript" src="${ctx}/static/bootstrap/js/layer-v1.9.2/layer/layer.js"></script>
<%--通用js--%>
<script type="text/javascript" src="${ctx}/static/common/common.js"></script>
<%--验证--%>
<%--<script src="${ctx}/static/bootstrap/js/select2.min.js"></script>
<script src="${ctx}/static/bootstrap/js/jquery.validate.js"></script>
<script src="${ctx}/static/bootstrap/js/matrix.form_validation.js"></script>--%>
<%--<script src="${ctx}/static/bootstrap/js/jquery.ui.custom.js"></script>--%>
<%--<script src="${ctx}/static/bootstrap/js/jquery.uniform.js"></script>--%>
<script src="${ctx}/static/validation/jqBootstrapValidation.js"></script>
<script src="${ctx}/static/js/jquery.form.js"></script>
<script type="text/javascript">
  var ctx = "${ctx}";
</script>

