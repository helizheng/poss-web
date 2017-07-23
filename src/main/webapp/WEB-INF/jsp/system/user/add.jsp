<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="/static/common/common.jsp"%>

	<script type="text/javascript">
		$(function(){
			$("input,select,textarea").not("[type=submit]").jqBootstrapValidation({
				submitSuccess: function ($form, event) {
					var url = "";
					var data = $("form").serialize();
					var userId = $("#userId").val();
					if(userId != "" && userId != undefined){
						url = ctx + "/system/user/update";
						editData(url,data);
					}else{
						url = ctx + "/system/user/add";
						addData(url,data);
					}
					event.preventDefault();
				}
			});

			//用户菜单添加角色时
			$("[data-url]").each(function () {
				var tb = $(this);
				tb.html(CommnUtil.loadingImg());
				tb.load(tb.attr("data-url"));
			});

			//用户状态
			if("${user.status}"){
				$("#status").val("${user.status}");
			}
		});

	</script>
</head>
<body>
<div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div>
					<div>
						<form class="form-horizontal" method="post" action="#" name="basic_validate" id="form">
							<input type="hidden" name="id" id="userId" value="${user.id}" />
							<div class="control-group">
								<label class="control-label">用户名</label>
								<div class="controls">
									<input type="text" name="userName" id="userName" value="${user.userName}" required>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">账号</label>
								<div class="controls">
									<input type="text" name="accountName" id="accountName" value="${user.accountName}" required>
								</div>
							</div>
							<c:if test="${empty user.id}">
								<div class="control-group">
									<label class="control-label">密码</label>
									<div class="controls">
										<input type="password" name="password" id="password" value="${user.password}" required>
									</div>
								</div>
							</c:if>

							<div class="control-group" id="selRole" data-url="${ctx}/system/role/roleSelect?userId=${user.id}"></div>

							<div class="control-group">
								<label class="control-label">是否禁用</label>
								<div class="controls">
									<select class="select-locked" name="status" id="status">
										<option value="0">是</option>
										<option value="1" selected="selected">否</option>
									</select>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">描述</label>
								<div class="controls">
									<input type="text" name="description" id="description" value="${user.description}">
								</div>
							</div>
							<div class="control-group text-right">
								<input type="submit" value="保存" class="btn btn-success" id="save-btn" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>

</div>
</body>
</html>