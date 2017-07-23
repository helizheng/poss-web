var pageii = null;
var grid = null;
var del_url = ctx + "/system/user/delete";
var edit_url = ctx + "/system/user/toEdit";
var add_url = ctx + "/system/user/toAdd";
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

    $("#search-btn").click(function(event){
        currentRefresh("tb_data");
        event.preventDefault();
    });

});

var opt = "";
function loadData(){
    opt = {
        url: ctx + '/system/user/findByPage',   //请求后台的URL（*）
        queryParams: queryParams,//传递参数（*）
        columns: [
        {checkbox: true},
        {field: 'userName',title: '用户名称'},
        {field: 'accountName',title: '登录账号'},
        /*{field: 'password',title: '密码'},*/
        {field: 'locked',title: '是否锁定',
            formatter : function(value,row,index){
                if(value == 1){
                    return "否";
                }else{
                    return "是";
                }
            }
        },
        {field: 'status',title: '是否正常',
            formatter : function(value,row,index){
                if(value == 1){
                    return "否";
                }else{
                    return "是";
                }
            }
        },
        {field: 'description',title: '描述'},
        {field:'action',title:'操作',
            formatter:function(value,row,index){
                var handle = "<div style='margin-left: 20%;'><a id='updatePassword' data-user-id='" + row.id + "' class='btn btn-primary'>修改密码</a><a id='resetPassword' style='margin-left: 40px;' class='btn btn-primary'>重置密码</a></div>";
                return handle;
            },width:400
        }
        ]
    };
    grid = dataGrid(opt);
}


function queryParams(params) {
    return {
        limit: params.limit, //页面大小
        offset: params.offset, //页码
        pageNumber: params.pageNumber,
        accountName : $("#accountName").val()
    };
}
