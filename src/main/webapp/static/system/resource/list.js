var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		id : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			hide : true
		}, {
			colkey : "name",
			name : "菜单名称",
			align : 'left'
		}, {
			colkey : "type",
			name : "菜单类型",
			width : "70px",
			renderData : function(rowindex, data, rowdata, column) {
				if(data=="1"){
					return "按钮";
				}else if(data=="0"){
					return "菜单";
				}
			}
		}, {
			colkey : "resKey",
			name : "唯一KEY"
		}, {
			colkey : "resUrl",
			name : "URL地址"
		}, {
			colkey : "permission",
			name : "访问权限"
		},{
			colkey : "status",
			name : "是否禁用",
			renderData : function(rowindex, data, rowdata, column) {
				if(data=="1"){
					return "否";
				}else if(data=="0"){
					return "是";
				}
			}
		}, {
			colkey : "description",
			width : "100px",
			name : "描述"
		} ],
		jsonUrl : ctx + '/system/resource/treelists',
		checkbox : true,
		usePage : false,
		records : "treelists",
		treeGrid : {
			type:1,
			tree : true,
			hide:false,
			name : 'name',
			id: "id",
			pid: "parentId"
		}
	});
	$("#search-btn").click(function(event) {// 绑定查询按扭
		var searchParams = $("#form").serializeJson();
		grid.setOptions({
			data : searchParams
		});
		//grid.loadData();
		event.preventDefault();
	});
	$("#save-btn").click("click", function() {
		addFun();
	});
	$("#edit-btn").click("click", function() {
		editFun();
	});
	$("#delete-btn").click("click", function() {
		delFun();
	});
});
function editFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.alert("请选择！！");
		return;
	}
	if(cbox.length > 1){
		layer.alert("只能选中一个！！");
		return;
	}
	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : [ "600px", "80%" ],
		content : ctx + '/system/resource/toEdit/' + cbox
	});
}
function addFun() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "600px", "80%" ],
		content : ctx + '/system/resource/toAdd'
	});
}
function delFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.alert("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = ctx + '/system/resource/delete';
		var s = CommnUtil.ajax(url, {
			ids : cbox.join(",")
		}, "json");
		if (s.success) {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}
