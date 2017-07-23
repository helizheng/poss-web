var pageii = null;
var grid = null;
var del_url = ctx + "/system/role/delete";
var edit_url = ctx + "/system/role/toEdit";
var add_url = ctx + "/system/role/toAdd";
$(function () {
    loadData();

    //初始化页面上面的按钮事件
    $("#save-btn").click(function(){
        add(add_url);
    });

    $("#edit-btn").click(function(){
        edit(edit_url);
    });

    $("#delete-btn").click(function(){
        remove(del_url,true);
    });

    $("#resource-btn").click("click", function() {
        permissions();
    });
});

var opt = "";
function loadData(){
    opt = {
        url: ctx + '/system/role/findByPage',   //请求后台的URL（*）
        queryParams: queryParams,//传递参数（*）
        columns: [{checkbox: true},
        {field: 'name',title: '角色名称'},
        {field: 'status',title: '是否禁用',
            formatter : function(value,row,index){
                if(value == 1){
                    return "否";
                }else{
                    return "是";
                }
            }
        },
        {field: 'description',title: '描述'}
        ]
    };
    grid = dataGrid(opt);
}

function queryParams(params) {
    return {
        limit: params.limit, //页面大小
        offset: params.offset, //页码
        pageNumber: params.pageNumber
    };
}


function permissions() {
    var cbox = getIdSelections("tb_data");
    if (cbox == "") {
        layer.msg("请选择一个对象！!");
        return;
    }
    if(cbox.length > 1){
        layer.msg("只能选中一个！!");
        return;
    }
    var url = ctx + '/system/resource/permissions?roleId='+cbox;
    pageii = layer.open({
        title : "分配权限",
        type : 2,
        area : [ "700px", "60%" ],
        content : url
    });
}