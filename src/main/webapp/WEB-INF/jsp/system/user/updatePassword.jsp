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
						url = ctx + "/system/user/updatePassword";
						$.ajax({
							type: "POST",
							url: url,
							data: data,
							dataType: "json",
							success: function(data){
								if (data.success) {
									layer.confirm("修改成功", function(index) {
										//关闭弹出窗
										parent.layer.close(parent.pageii);
										return false;
									});
									//刷新数据
									parent.grid.loadData();
									$("#form")[0].reset();

										} else {
									layer.alert("修改成功", 3);
								}
							}
						});
					}
					event.preventDefault();
				}
			});
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
							<input type="hidden" name="userId" id="userId" value="${userId}" />

							<div class="control-group">
								<label class="control-label">原始密码</label>
								<div class="controls">
									<input type="password" name="oldPassword" id="oldPassword" required>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">新密码</label>
								<div class="controls">
									<input type="password" name="newPassword" id="newPassword" required>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">确认密码</label>
								<div class="controls">
									<input type="password" name="confirmPassword" id="confirmPassword" required>
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