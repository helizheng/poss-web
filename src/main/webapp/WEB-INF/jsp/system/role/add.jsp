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
					var id = $("#id").val();
					if(id != "" && id != undefined){
						url = ctx + "/system/role/update";
						editData(url,data);
					}else{
						url = ctx + "/system/role/add";
						addData(url,data);
					}
					event.preventDefault();
				}
			});

			//用户状态
			$("#status").val("${role.status}");
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
							<input type="hidden" name="id" id="id" value="${role.id}" />
							<div class="control-group">
								<label class="control-label">角色名称</label>
								<div class="controls">
									<input type="text" name="name" id="name" value="${role.name}" required>
								</div>
							</div>
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
									<input type="text" name="description" id="description" value="${role.description}">
								</div>
							</div>
							<div class="control-group text-right">
								<input type="submit" value="<c:choose><c:when test="${empty role.id}">保存</c:when><c:otherwise>修改</c:otherwise></c:choose>" class="btn btn-success" id="save-btn" />
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