<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/menu/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ctx}/statics/css/font.css">
    <link rel="stylesheet" href="${ctx}/statics/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${ctx}/statics/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/statics/js/xadmin.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/request.js"></script>
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div style="text-align: center;"><img src="${ctx}/statics/images/login/logo.png" style="width: 100px;height: 100px;margin-bottom: 10px;"></div>
    <form method="post" class="layui-form" >
        <input id="username" name="username" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input id="password" name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
        <input id="btnSubmit" value="登录" lay-submit lay-filter="login" style="width:100%;" type="button">
        <hr class="hr20" >
    </form>
</div>
<script>
    var host = getHttpHost();
    layui.use('layer', function () {
        var layer = layui.layer;
        layer.config({
            skin: 'layui-layer-lan'
        });
    });
    /*$(function  () {
        layui.use('form', function(){
            var form = layui.form();
            //监听提交
            form.on('submit(login)', function(){
            });
        });
    })*/

    //用户名enter则聚焦到密码输入
    $("#username").keydown(function (e) {
        if(e.keyCode==13){
            $("#password").focus().select();
        }
    });

    $("#password").keydown(function (e) {
        if(e.keyCode==13){
            $("#btnSubmit").click()
        }
    });

    //提交表单
    $("#btnSubmit").click(function () {
        var username = $("#username").val();
        var password = $("#password").val();
        if(username == ""){
            layui.layer.msg("请填写用户名！", {icon: 3, time: 2000, title: "提示"});
            return false
        }else if(password == ""){
            layui.layer.msg("请填写密码！", {icon: 3, time: 2000, title: "提示"});
            return false
        }
        //保存数据
        $.ajax({
            type: 'post',
            url: host+"/resume/login",
            data: {'username': username, 'password': password},
            async: false,
            success: function (re) {
                if(re.success){
                    layui.layer.msg(re.message, {icon: 1, time: 2000, title: '提示'}, function () {
                        location.href = host+"/resume/index"
                    });
                }else{
                    layui.layer.msg(re.message, {icon: 2, time: 2000, title: '提示'});
                }
            }
        })
    });

    //注册
    $("#register").click(function () {
        location.href = host+"/resume/register"
    })
</script>
</body>
</html>