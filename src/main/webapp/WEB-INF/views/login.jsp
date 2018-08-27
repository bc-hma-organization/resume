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
    <link rel="stylesheet" href="https://cdn.bootcss.com/Swiper/3.4.2/css/swiper.min.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
    <script src="${ctx}/statics/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/statics/js/xadmin.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/request.js"></script>
</head>
<body>
<div class="login-logo"><h1>区块链</h1></div>
<div class="login-box">
    <form class="layui-form layui-form-pane" method="post">

        <h3>登录你的帐号</h3>
        <label class="login-title">帐号</label>
        <div class="layui-form-item">
            <label class="layui-form-label login-form"><i class="iconfont">&#xe6b8;</i></label>
            <div class="layui-input-inline login-inline">
                <input type="text" id="username" name="username" placeholder="请输入你的帐号" autocomplete="off" class="layui-input">
            </div>
        </div>
        <label class="login-title">密码</label>
        <div class="layui-form-item">
            <label class="layui-form-label login-form"><i class="iconfont">&#xe82b;</i></label>
            <div class="layui-input-inline login-inline">
                <input type="password" id="password" name="password" placeholder="请输入你的密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="form-actions">
            <button class="btn btn-warning pull-right" lay-submit lay-filter="login"  type="submit">登录</button>
            <div class="forgot"><a href="#" class="forgot">忘记帐号或者密码</a></div>
        </div>
    </form>
</div>
<%--<div class="bg-changer">
    <div class="swiper-container changer-list">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><img class="item" src="${ctx}/statics/images/a.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="${ctx}/statics/images/b.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="${ctx}/statics/images/c.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="${ctx}/statics/images/d.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="${ctx}/statics/images/e.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="${ctx}/statics/images/f.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="${ctx}/statics/images/g.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="${ctx}/statics/images/h.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="${ctx}/statics/images/i.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="${ctx}/statics/images/j.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="${ctx}/statics/images/k.jpg" alt=""></div>
            <div class="swiper-slide"><span class="reset">初始化</span></div>
        </div>
    </div>
    <div class="bg-out"></div>
    <div id="changer-set"><i class="iconfont">&#xe696;</i></div>
</div>--%>
<script>
    var host = getHttpHost();
    $(function  () {
        layui.use('form', function(){
            var form = layui.form();
            //监听提交
            form.on('submit(login)', function(){
                var username = $("#username").val();
                var password = $("#password").val();
                if(username == ""){
                    layui.layer.msg("请填写用户名！", {icon: 3, time: 2000, title: "提示"});
                    return false
                }else if(password == ""){
                    layui.layer.msg("请填写密码！", {icon: 3, time: 2000, title: "提示"});
                    return false
                }
                $.ajax({
                    type: 'post',
                    url: host+"/login",
                    data: {username: username, password: password},
                    async: false,
                    success: function (re) {
                        var result = re.data;
                        if(result.success){
                            layui.layer.msg(result.message, {icon: 1, time: 2000, title: '提示'});
                            location.href = "/index.html"
                        }else{
                            layui.layer.msg(result.message, {icon: 2, time: 2000, title: '提示'});
                        }
                    }
                })
            });
        });
    })
</script>
</body>
</html>