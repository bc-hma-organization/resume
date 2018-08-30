<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/menu/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ctx}/statics/css/font.css">
    <link rel="stylesheet" href="${ctx}/statics/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${ctx}/statics/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/statics/js/xadmin.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/request.js"></script>
</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="./index"><img src="${ctx}/statics/images/login/logo.png" style="width: 40px;height: 40px;"></a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <!--<ul class="layui-nav left fast-add" lay-filter="">
      <li class="layui-nav-item">
        <a href="javascript:;">+新增</a>
        <dl class="layui-nav-child">
          <dd><a onclick="x_admin_show('资讯','http://www.baidu.com')"><i class="iconfont">&#xe6a2;</i>资讯</a></dd>
          <dd><a onclick="x_admin_show('图片','http://www.baidu.com')"><i class="iconfont">&#xe6a8;</i>图片</a></dd>
           <dd><a onclick="x_admin_show('用户','http://www.baidu.com')"><i class="iconfont">&#xe6b8;</i>用户</a></dd>
        </dl>
      </li>
    </ul>-->
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">${user.trueName}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a href="javascript:;" onclick="exit()">退出</a></dd>
            </dl>
        </li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <c:if test="${not empty user.organizationID}">
                <li>
                    <a _href="organization/selectUser?page=1">
                        <i class="iconfont">&#xe6b2;</i>
                        <cite>认证简历</cite>
                    </a>
                </li>
            </c:if>
            <c:if test="${empty user.organizationID}">
                <li>
                    <a _href="javascript:;">
                        <i class="layui-icon">&#xe66f;</i>
                        <cite>修改个人信息</cite>
                    </a>
                </li>
                <li>
                    <a _href="./info/upInfo">
                        <i class="layui-icon">&#xe6b2;</i>
                        <cite>简历信息</cite>
                    </a>
                </li>
            </c:if>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='./welcome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">版权所有 ©2018 黄埔区块链培训学院</div>
</div>
<!-- 底部结束 -->
<script>
    var host = getHttpHost();
    //退出
    function exit() {
        $.ajax({
            type: 'post',
            url: host + '/resume/logout',
            async: false,
            success: function (re) {
                if(re == 1){
                    location.href = host+"/resume/login"
                }
            }
        })
    }
</script>
</body>
</html>