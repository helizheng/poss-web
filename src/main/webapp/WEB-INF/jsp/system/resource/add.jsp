<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="/static/common/common.jsp"%>
	<script type="text/javascript">
		$(function(){
			var id = $("#id").val();
			$("input,select,textarea").not("[type=submit]").jqBootstrapValidation({
				submitSuccess: function ($form, event) {
					var url = "";
					var data = $("form").serialize();
					if(id != "" && id != undefined){
						url = ctx + "/system/resource/update";
						$.ajax({
							type: "POST",
							url: url,
							data: data,
							dataType: "json",
							success: function(data){
								if (data.success) {
									layer.confirm('修改成功!是否关闭窗口?', function(index) {
										//关闭弹出窗
										parent.layer.close(parent.pageii);
										return false;
									});
									//刷新数据
									parent.grid.loadData();
									$("#form")[0].reset();
								} else {
									layer.alert('修改失败！', 3);
								}
							}
						});
					}else{
						url = ctx + "/system/resource/add";
						$.ajax({
							type: "POST",
							url: url,
							data: data,
							dataType: "json",
							success: function(data){
								if (data.success) {
									layer.confirm('添加成功!是否关闭窗口?', function(index) {
										//关闭弹出窗
										parent.layer.close(parent.pageii);
										return false;
									});
									//刷新数据
									parent.grid.loadData();
									$("#form")[0].reset();
								} else {
									layer.alert('添加失败！', 3);
								}
							}
						});
					}
					event.preventDefault();
				}
			});


			//获取菜单信息
			var url = ctx + '/system/resource/reslists';
			var data = CommnUtil.ajax(url, null,"json");
			if (data != null) {
				var h = "<option value='0'>------顶级目录------</option>";
				for ( var i = 0; i < data.length; i++) {
					if(parseInt("${resource.parentId}",10)==parseInt(data[i].id,10)){
						h+="<option value='" + data[i].id + "' selected='selected'>"
								+ data[i].name + "</option>";
					}else{
						h+="<option value='" + data[i].id + "'>"+ data[i].name + "</option>";
					}
				}
				$("#parentId").html(h);
			} else {
				layer.alert("获取菜单信息错误，请联系管理员！");
			}

			//菜单类型
			$("#type").val("${resource.type}");
			//菜单状态
			$("#status").val("${resource.status}");
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
							<input type="hidden" name="id" id="id" value="${resource.id}" />
							<div class="control-group">
								<label class="control-label">菜单名称</label>
								<div class="controls">
									<input type="text" name="name" id="name" value="${resource.name}" required>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">菜单标识</label>
								<div class="controls">
									<input type="text" name="resKey" id="resKey" value="${resource.resKey}" required>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">菜单url</label>
								<div class="controls">
									<input type="text" name="resUrl" id="resUrl" value="${resource.resUrl}" required>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">访问权限</label>
								<div class="controls">
									<input type="text" name="permission" id="permission" value="${resource.permission}" required>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">上级菜单</label>
								<div class="controls">
									<select id="parentId" name="parentId" class="form-control m-b"
											tabindex="-1">
									</select>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">菜单类型</label>
								<div class="controls">
									<select id="type" name="type" class="form-control m-b"
											tabindex="-1">
										<option value="0">------  菜单  ------</option>
										<option value="1">------  按钮  ------</option>
									</select>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">是否禁用</label>
								<div class="controls">
									<select class="select-locked" name="status" id="status">
										<option value="1" selected="selected">否</option>
										<option value="0">是</option>
									</select>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">描述</label>
								<div class="controls">
									<input type="text" name="description" id="description" value="${resource.description}">
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