<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Matrix Admin</title>
<meta charset="UTF-8" />
<%@include file="/static/common/bootstrap-table.jsp"%>
<link rel="stylesheet" href="${ctx}/static/bootstrap/css/fullcalendar.css" />
<link rel="stylesheet" href="${ctx}/static/bootstrap/css/jquery.gritter.css" />
<%--<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>--%>

<%--菜单展开收起--%>
<script src="${ctx}/static/bootstrap/js/matrix.js"></script>
<script type="text/javascript">
  $(function() {
    /*$("body").on("click",".sidebar-ul>li",function(){
      $(this).
    });*/

    $(".sidebar-ul > li ul > li > a").click(function(e){
      e.preventDefault();
      $(this).parent().parent().parent().removeClass("active");
      $(this).parent().siblings("li").removeClass("active");
      $(this).parent().addClass("active");
    });

    var tb = $(".container-fluid");
   // tb.html(layer.load(0, {shade: false}));
    tb.load(ctx+"/welcome.jsp");
    $("[nav-n]").each(function () {
      $(this).bind("click",function(){
        var nav = $(this).attr("nav-n");
        var sn = nav.split(",");

        var html = '<a href="${ctx}/system/index" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a>';
        for(var i = 0;i < 2;i++){
          html+='<a href="javascript:void(0);" title="Go to Home" class="tip-bottom">'+sn[i]+'</a>';
        }
        $("#breadcrumb").html(html);
        var tb = $(".container-fluid");
       // tb.html(layer.load(0, {shade: false}));
        tb.load(ctx+sn[2]);
      });
    });
  });
</script>
</head>
<body>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Matrix Admin</a></h1>
</div>
<!--close-Header-part--> 


<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">${APP_USER.userName}</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <%--<li><a href="#"><i class="icon-user"></i> My Profile</a></li>
        <li class="divider"></li>
        <li><a href="#"><i class="icon-check"></i> My Tasks</a></li>
        <li class="divider"></li>--%>
        <li><a id="updatePassword" data-user-id="${APP_USER.id}"><i class="icon-key"></i> 修改密码</a></li>
        <li><a href="${ctx}/system/logout"><i class="icon icon-share-alt"></i> 退出</a></li>
      </ul>
    </li>
   <%-- <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">Messages</span> <span class="label label-important">5</span> <b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> new message</a></li>
        <li class="divider"></li>
        <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> inbox</a></li>
        <li class="divider"></li>
        <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> outbox</a></li>
        <li class="divider"></li>
        <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> trash</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">Settings</span></a></li>--%>
    <li class=""><a title="" href="${ctx}/system/logout"><i class="icon icon-share-alt"></i> <span class="text">退出</span></a></li>
  </ul>
</div>
<!--close-top-Header-menu-->
<!--sidebar-menu-->
<div id="sidebar">
  <a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
  <ul class="sidebar-ul">
    <c:forEach var="key" items="${list}" varStatus="s">
      <li class="submenu<c:if test="${s.index == 0}"> active</c:if>"><a href="#"><i class="icon icon-home"></i> <span>${key.name}</span></a>
        <c:if test="${key.children != null || fn:length(key.children) != 0}">
          <ul>
            <c:forEach var="kc" items="${key.children}">
              <li><a href="javascript:void(0);" nav-n="${key.name},${kc.name},${kc.resUrl}">${kc.name}</a></li>
            </c:forEach>
          </ul>
        </c:if>
      </li>
    </c:forEach>
  </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="${ctx}/system/index" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->
  <div class="container-fluid">

  </div>
</div>

<!--end-main-container-part-->

<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12"> 2016 &copy; Matrix Admin. Brought to you by <a href="http://themedesigner.in/">Themedesigner.in</a> </div>
</div>

<!--end-Footer-part-->

</body>
</html>
