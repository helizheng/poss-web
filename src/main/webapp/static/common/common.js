/**
 * 工具组件 对原有的工具进行封装，自定义某方法统一处理
 *
 */
(function() {
	CommnUtil = {
		/**
		 * ajax同步请求 返回一个html内容 dataType=html. 默认为html格式 如果想返回json.
		 * CommnUtil.ajax(url, data,"json")
		 * 
		 */
		ajax : function(url, data, dataType) {
			if (!CommnUtil.notNull(dataType)) {
				dataType = "html";
			}
			var html = '没有结果!';
			// 所以AJAX都必须使用ly.ajax..这里经过再次封装,统一处理..同时继承ajax所有属性
			if (url.indexOf("?") > -1) {
				url = url + "&_t=" + new Date();
			} else {
				url = url + "?_t=" + new Date();
			}
			$.ajax({
				type : "post",
				data : data,
				url : url,
				dataType : dataType,// 这里的dataType就是返回回来的数据格式了html,xml,json
				async : false,
				cache : false,// 设置是否缓存，默认设置成为true，当需要每次刷新都需要执行数据库操作的话，需要设置成为false
				success : function(data) {
					html = data;
				}
			});
			return html;
		},
		/**
		 * 判断某对象不为空..返回true 否则 false
		 */
		notNull : function(obj) {
			if (obj === null) {
				return false;
			} else if (obj === undefined) {
				return false;
			} else if (obj === "undefined") {
				return false;
			} else if (obj === "") {
				return false;
			} else if (obj === "[]") {
				return false;
			} else if (obj === "{}") {
				return false;
			} else {
				return true;
			}

		},

		/**
		 * 判断某对象不为空..返回obj 否则 ""
		 */
		notEmpty : function(obj) {
			if (obj === null) {
				return "";
			} else if (obj === undefined) {
				return "";
			} else if (obj === "undefined") {
				return "";
			} else if (obj === "") {
				return "";
			} else if (obj === "[]") {
				return "";
			} else if (obj === "{}") {
				return "";
			} else {
				return obj;
			}

		},
		loadingImg : function() {
			var html = '<div class="alert alert-warning">'
				+ '<button type="button" class="close" data-dismiss="alert">'
				+ '<i class="ace-icon fa fa-times"></i></button><div style="text-align:center">'
				+ '<img src="' + ctx + '/static/images/loading.gif"/><div>'
				+ '</div>';
			return html;
		},
		/**
		 * html标签转义
		 */
		htmlspecialchars : function(str) {
			var s = "";
			if (str.length == 0)
				return "";
			for (var i = 0; i < str.length; i++) {
				switch (str.substr(i, 1)) {
				case "<":
					s += "&lt;";
					break;
				case ">":
					s += "&gt;";
					break;
				case "&":
					s += "&amp;";
					break;
				case " ":
					if (str.substr(i + 1, 1) == " ") {
						s += " &nbsp;";
						i++;
					} else
						s += " ";
					break;
				case "\"":
					s += "&quot;";
					break;
				case "\n":
					s += "";
					break;
				default:
					s += str.substr(i, 1);
					break;
				}
			}
		},
		/**
		 * in_array判断一个值是否在数组中
		 */
		in_array : function(array, string) {
			for (var s = 0; s < array.length; s++) {
				thisEntry = array[s].toString();
				if (thisEntry == string) {
					return true;
				}
			}
			return false;
		}
	};


	dataGrid = (function(params){
		//加载数据------------------------
		var opt = {
			tableId : 'tb_data',
			url: '',   //请求后台的URL（*）
			//method: 'get',      //请求方式（*）
			//toolbar: '#toolbar',    //工具按钮用哪个容器
			striped: true,      //是否显示行间隔色
			cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination: true,     //是否显示分页（*）
			//onlyInfoPagination:true,
			// dataType: "json",
			sortable: false,      //是否启用排序
			sortOrder: "asc",     //排序方式
			queryParams: {},//传递参数（*）
			sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）
			pageNumber:1,      //初始化加载第一页，默认第一页
			pageSize: 10,      //每页的记录行数（*）
			pageList: [10, 25, 50, 100],  //可供选择的每页的行数（*）
			search: false,      //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			strictSearch: false,
			showColumns: false,     //是否显示所有的列
			showRefresh: false,     //是否显示刷新按钮
			minimumCountColumns: 2,    //最少允许的列数
			clickToSelect: true,    //是否启用点击选中行
			height: 500,      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
			uniqueId: "id",      //每一行的唯一标识，一般为主键列
			showToggle:false,     //是否显示详细视图和列表视图的切换按钮
			cardView: false,     //是否显示详细视图
			detailView: false,     //是否显示父子表
			columns : []
		};
		var conf = $.extend(opt, params);
		var id = conf.pagId;
		$("#"+conf.tableId).bootstrapTable(conf);
		//加载数据--------------------------------

		//刷新数据--------------------------------
		var loadData = function (){
			$("#"+conf.tableId).bootstrapTable("refresh",{silent: true});
		}
		//刷新数据-------------------------------
		//获取总条数--------------------------
		var totalData = function (){
			$("#"+conf.tableId).bootstrapTable("getOptions");
		}
		//获取总条数
		return {
			loadData : loadData,//重新加载数据
			totalData : totalData
		};
	});

	//修改密码
	$("#updatePassword").live("click",function(){
		var updatePassword_url = ctx + "/system/user/toUpdatePassword/" + $(this).attr("data-user-id");
		pageii = layer.open({
			title : "修改密码",
			type : 2,
			area : [ "600px", "30%" ],
			content : updatePassword_url
		});
	});
	//重置密码
	$("#resetPassword").live("click",function(){
		var _url = ctx + "/system/user/resetPassword";
		var userId = $(this).siblings("a").attr("data-user-id")
		layer.confirm('是否确认重置密码，密码重置默认为登录账号', function(index) {
			var s = CommnUtil.ajax(_url, {userId : userId}, "json");
			if (s.success) {
				layer.msg('重置密码成功');
				//刷新数据
				grid.loadData();
			} else {
				layer.msg('重置密码失败');
			}
		});
	});
})();

// 表单json格式化方法……不使用&拼接
(function($) {
	$.fn.serializeJson = function() {
		var serializeObj = {};
		var array = this.serializeArray();
		$(array).each(
			function() {
				if (serializeObj[this.name]) {
					if ($.isArray(serializeObj[this.name])) {
						serializeObj[this.name].push(this.value);
					} else {
						serializeObj[this.name] = [
							serializeObj[this.name], this.value ];
					}
				} else {
					serializeObj[this.name] = this.value;
				}
			});
		return serializeObj;
	};
	Date.prototype.format = function(format) {
		var o = {
			"M+" : this.getMonth() + 1, // month
			"d+" : this.getDate(), // day
			"h+" : this.getHours(), // hour
			"m+" : this.getMinutes(), // minute
			"s+" : this.getSeconds(), // second
			"q+" : Math.floor((this.getMonth() + 3) / 3), // quarter
			"S" : this.getMilliseconds()// millisecond
		}
		if (/(y+)/.test(format)) {
			format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
		}
		for ( var k in o) {
			if (new RegExp("(" + k + ")").test(format)) {
				format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
			}
		}
		return format;
	}
})(jQuery);

function addData(url,param){
	$.ajax({
		type: "POST",
		url: url,
		data: param,
		dataType: "json",
		success: function(data){
			if (data.success) {
				layer.confirm('添加成功!是否关闭窗口?', function(index) {
					//关闭弹出窗
					parent.layer.close(parent.pageii);
					return false;
				});
				//刷新数据
				parentRefresh("tb_data");
				$("#form")[0].reset();
			} else {
				layer.alert(data.msg, 3);
			}
		}
	});
}

//var arr = new Array("Saab","Volvo","BMW")
function edit(url,param) {
	var cbox = getIdSelections("tb_data");
	if (cbox == "") {
		layer.msg("请选择修改项！！");
		return;
	}
	if(cbox.length > 1){
		layer.msg("只能选中一个进行修改！！");
		return;
	}
	url += "/" + cbox;
	//for (x in arr) {
	//	document.write(arr[x] + "<br />")
	//}

	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : [ "600px", "80%" ],
		content : url
	});
}
function add(url) {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "600px", "80%" ],
		content : url
	});
}
function remove(url,isCheckbox) {
	var cbox = getIdSelections("tb_data");
	if (isCheckbox && cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	var _url = url;
	layer.confirm('是否删除？', function(index) {
		var s = CommnUtil.ajax(_url, {
			'ids' : cbox.join(",")
		}, "json");
		if (s.success) {
			layer.msg('删除成功');
			//刷新数据
			grid.loadData();
			//currentRefresh("tb_data");
		} else {
			layer.msg('删除失败');
		}
	});
}

function editData(url,param){
	$.ajax({
		type: "POST",
		url: url,
		data: param,
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
				//parentRefresh("tb_data");
				$("#form")[0].reset();
			} else {
				layer.alert('修改失败！', 3);
			}
		}
	});
}

//得到选中的checkbox的值
function getIdSelections(element) {
	return $.map($('#'+element).bootstrapTable('getSelections'), function(row) {
		return row.id
	});
}

function currentRefresh(element){
	$("#"+element).bootstrapTable("refresh",{silent: true});
}

function parentRefresh(element){
	parent.$("#"+element).bootstrapTable("refresh",{silent: true});
}

