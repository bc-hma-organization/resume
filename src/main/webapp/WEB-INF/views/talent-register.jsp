<%--
  Created by IntelliJ IDEA.
  User: 区块链培训学院
  Date: 2018/8/28
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/menu/taglib.jsp"%>
<html>
<head>
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ctx}/statics/css/font.css">
    <link rel="stylesheet" href="${ctx}/statics/css/register_xadmin.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/Swiper/3.4.2/css/swiper.min.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
    <script src="${ctx}/statics/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/statics/js/xadmin.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/request.js"></script>
</head>
<body>
    <div class="talent_register">
        <div class="back"><img src="${ctx}/statics/images/back.jpg" width="60"></div>
        <div class="t_top">
            <p><strong>人才注册</strong></p>
        </div>
        <div class="t_main">
            <form>
                <div class="input_box">
                    <p>用户名：<p/>
                    <input type="text" name="title" lay-verify="title" autocomplete="off" class="layui-input">
                </div>
                <div class="input_box">
                    <p>密码：<p/>
                    <input type="password" name="title" lay-verify="title" autocomplete="off" class="layui-input">
                </div>
                <div class="input_box">
                    <p>确认密码：<p/>
                    <input type="password" name="title" lay-verify="title" autocomplete="off" class="layui-input">
                </div>
                <div class="input_box">
                    <p>邮箱：<p/>
                    <input type="text" name="title" lay-verify="title" autocomplete="off" class="layui-input">
                </div>
                <div class="input_box">
                    <button id="btn_sub" class="layui-btn layui-btn-fluid">提交</button>
                    <button id="btn_re" class="layui-btn layui-btn-fluid">重置</button>
                </div>


            </form>
        </div>
    </div>
</body>
<script>


</script>
</html>
